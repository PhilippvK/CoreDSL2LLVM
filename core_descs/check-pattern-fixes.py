#!/usr/bin/env python3
"""Check llc built with the patterns exported by check-independent-patterns.py.

Usage: python3 core_descs/check-pattern-fixes.py build-port/bin
"""

import pathlib
import re
import subprocess
import sys
import tempfile

BIN = pathlib.Path(sys.argv[1]).resolve()


def compile_ir(ir, xlen, *args):
    result = subprocess.run(
        [
            str(BIN / "llc"),
            f"-mtriple=riscv{xlen}",
            "-global-isel=1",
            "-global-isel-abort=1",
            "-verify-machineinstrs",
            "-O2",
            *args,
        ],
        input=ir,
        text=True,
        capture_output=True,
    )
    if result.returncode:
        raise RuntimeError(result.stderr)
    return result.stdout


def function(name, result, args, body):
    return f"\ndefine {result} @{name}({args}) {{\n{body}\n}}\n"


def branch(name, ty, condition, binary=False):
    args = f"{ty} %a" + (f", {ty} %b" if binary else "")
    return function(
        name,
        "void",
        args,
        f"""  {condition}
  br i1 %c, label %taken, label %fall
fall:
  call void asm sideeffect "addi zero, zero, 1", ""()
  ret void
taken:
  call void asm sideeffect "nop", ""()
  ret void""",
    )


def selected_function(mir, name):
    match = re.search(rf"(?m)^name:\s+{name}\n.*?^\.\.\.", mir, re.DOTALL)
    assert match, f"missing MIR function: {name}"
    return match.group()


with tempfile.TemporaryDirectory(prefix="patterngen-fixes-") as directory:
    for xlen in (32, 64):
        ty = f"i{xlen}"
        ir = ""
        checks = {}
        for scaled in (False, True):
            suffix = "scale" if scaled else "reg"
            address = f"  %offset = shl {ty} %index, 2\n" if scaled else ""
            offset = "%offset" if scaled else "%index"
            address += f"  %address = getelementptr i8, ptr %base, {ty} {offset}\n"
            ir += function(
                "ldx_" + suffix,
                ty,
                f"ptr %base, {ty} %index",
                address + f"  %v = load {ty}, ptr %address\n  ret {ty} %v",
            )
            ir += function(
                "stx_" + suffix,
                "void",
                f"ptr %base, {ty} %index, {ty} %data",
                address + f"  store {ty} %data, ptr %address\n  ret void",
            )
            checks["ldx_" + suffix] = "PG_LDX_" + suffix.upper() + "_"
            checks["stx_" + suffix] = "PG_STX_" + suffix.upper() + "_"
        ir += function(
            "ld_add",
            ty,
            f"ptr %base, {ty} %bias",
            f"  %v = load {ty}, ptr %base\n  %r = add {ty} %v, %bias\n  ret {ty} %r",
        )
        ir += function(
            "st_xor",
            "void",
            f"ptr %base, {ty} %a, {ty} %b",
            f"  %v = xor {ty} %a, %b\n  store {ty} %v, ptr %base\n  ret void",
        )
        ir += function(
            "ld_both",
            ty,
            f"ptr %base, {ty} %index, {ty} %bias",
            f"  %address = getelementptr i8, ptr %base, {ty} %index\n"
            f"  %v = load {ty}, ptr %address\n  %r = xor {ty} %v, %bias\n  ret {ty} %r",
        )
        ir += function(
            "st_both",
            "void",
            f"ptr %base, {ty} %index, {ty} %a, {ty} %b",
            f"  %offset = shl {ty} %index, 2\n"
            f"  %address = getelementptr i8, ptr %base, {ty} %offset\n"
            f"  %v = add {ty} %a, %b\n  store {ty} %v, ptr %address\n  ret void",
        )
        for name in ("ld_add", "st_xor", "ld_both", "st_both"):
            checks[name] = "PG_" + name.upper() + "_"
        ir += function(
            "integer_address",
            ty,
            f"{ty} %base, {ty} %index",
            f"  %address = add {ty} %base, %index\n  %p = inttoptr {ty} %address to ptr\n"
            f"  %v = load {ty}, ptr %p\n  ret {ty} %v",
        )
        checks["integer_address"] = "PG_LDX_REG_"
        ir += function(
            "unaligned_slice",
            ty,
            f"{ty} %value",
            f"  %shifted = lshr {ty} %value, 3\n"
            f"  %result = and {ty} %shifted, 255\n  ret {ty} %result",
        )
        checks["unaligned_slice"] = "PG_EXTRACT_"
        ir += function(
            "shared_volatile_load",
            ty,
            f"ptr %base, {ty} %bias",
            f"  %v = load volatile {ty}, ptr %base\n  %sum = add {ty} %v, %bias\n"
            f"  %result = xor {ty} %sum, %v\n  ret {ty} %result",
        )
        ir += function(
            "load_before_store",
            ty,
            f"ptr %base, {ty} %bias, {ty} %data",
            f"  %v = load {ty}, ptr %base\n  store {ty} %data, ptr %base\n"
            f"  %result = add {ty} %v, %bias\n  ret {ty} %result",
        )
        for name, condition, opcode in (
            ("signed5_min", f"%c = icmp eq {ty} %a, -16", "PG_BEQI5_"),
            ("signed5_max", f"%c = icmp eq {ty} %a, 15", "PG_BEQI5_"),
            ("unsigned3_max", f"%c = icmp ult {ty} %a, 7", "PG_BLTUI3_"),
            ("signed8_min", f"%c = icmp ne {ty} %a, -128", "PG_BNEI8_"),
            ("signed8_max", f"%c = icmp ne {ty} %a, 127", "PG_BNEI8_"),
            ("signed_compare", f"%c = icmp slt {ty} %a, -16", "PG_BLTI5_"),
        ):
            ir += branch(name, ty, condition)
            checks[name] = opcode
        ir += branch("signed5_out_of_range", ty, f"%c = icmp eq {ty} %a, 16")
        ir += branch("signed8_out_of_range", ty, f"%c = icmp ne {ty} %a, 128")
        ir += branch(
            "or_condition",
            ty,
            f"%v = or {ty} %a, %b\n  %c = icmp ne {ty} %v, 0",
            binary=True,
        )
        # PatternGen canonicalizes XOR-nonzero to register inequality.
        ir += branch("xor_condition", ty, f"%c = icmp ne {ty} %a, %b", binary=True)
        checks.update(or_condition="PG_BOR_", xor_condition="PG_BXOR_")

        selected = compile_ir(ir, xlen, "-stop-after=instruction-select", "-o", "-")
        for name, opcode in checks.items():
            body = selected_function(selected, name)
            assert opcode in body, f"RV{xlen}: {name} did not select {opcode}\n{body}"
        shared = selected_function(selected, "shared_volatile_load")
        assert "PG_LD_ADD_" not in shared and shared.count("volatile load") == 1, shared
        alias = selected_function(selected, "load_before_store")
        assert "PG_LD_ADD_" not in alias, alias
        for name, forbidden in (
            ("signed5_out_of_range", "PG_BEQI5_"),
            ("signed8_out_of_range", "PG_BNEI8_"),
        ):
            body = selected_function(selected, name)
            assert forbidden not in body, body
        obj = pathlib.Path(directory) / f"fixes{xlen}.o"
        compile_ir(ir, xlen, "-filetype=obj", "-o", str(obj))
        disassembly = subprocess.check_output(
            [str(BIN / "llvm-objdump"), "-d", str(obj)], text=True
        )
        for mnemonic in (
            "pg.ldx.reg",
            "pg.stx.reg",
            "pg.ldx.scale",
            "pg.stx.scale",
            "pg.ld.add",
            "pg.st.xor",
            "pg.ld.both",
            "pg.st.both",
            "pg.extract",
            "pg.beqi5",
            "pg.bltui3",
            "pg.bnei8",
            "pg.blti5",
            "pg.bor",
            "pg.bxor",
        ):
            assert mnemonic in disassembly, f"RV{xlen}: missing disassembly: {mnemonic}"
        print(
            f"RV{xlen}: {len(checks)} selection cases, safe load folding, "
            "immediate bounds and object disassembly passed"
        )
