#!/usr/bin/env python3
"""Check an llc built with the generated independent RV32/RV64 patterns.

Use the generated includes described in INDEPENDENT_PORT.md before running:
    python3 core_descs/check-independent-codegen.py build-port/bin
"""
import pathlib
import struct
import subprocess
import sys
import tempfile

BIN = pathlib.Path(sys.argv[1]).resolve()


def llc(ir, xlen, *args, opt=2):
    result = subprocess.run([
        str(BIN / "llc"), f"-mtriple=riscv{xlen}", "-global-isel",
        "-global-isel-abort=1", "-verify-machineinstrs", f"-O{opt}", *args,
    ], input=ir, text=True, capture_output=True)
    if result.returncode:
        raise RuntimeError(result.stderr)
    return result.stdout


def text_section(path):
    data = path.read_bytes()
    wide = data[4] == 2
    shoff = struct.unpack_from("<Q" if wide else "<I", data, 40 if wide else 32)[0]
    entsize, count, namesidx = struct.unpack_from("<HHH", data, 58 if wide else 46)

    def section(index):
        offset = shoff + index * entsize
        name = struct.unpack_from("<I", data, offset)[0]
        fileoff, size = struct.unpack_from("<QQ" if wide else "<II", data,
                                          offset + (24 if wide else 16))
        return name, data[fileoff:fileoff + size]

    _, names = section(namesidx)
    for index in range(count):
        name, contents = section(index)
        if names[name:].split(b"\0", 1)[0] == b".text":
            return contents
    raise AssertionError("missing ELF .text")


with tempfile.TemporaryDirectory(prefix="patterngen-codegen-") as directory:
    for xlen in (32, 64):
        ty = f"i{xlen}"
        ir = ""
        for name, condition in (("equal", f"%c = icmp eq {ty} %a, %b"),
                                ("bits", f"%v = and {ty} %a, %b\n%c = icmp ne {ty} %v, 0"),
                                ("nonzero", f"%c = icmp ne {ty} %a, 0")):
            ir += f"""
define void @{name}({ty} %a, {ty} %b) {{
entry:
  {condition}
  br i1 %c, label %taken, label %fall
fall:
  call void asm sideeffect "addi zero, zero, 1", ""()
  ret void
taken:
  call void asm sideeffect "nop", ""()
  ret void
}}
"""
        for width, signed in ((8, False), (8, True), (16, True), (32, True), (xlen, False)):
            suffix = f"{width}{'s' if signed else 'u'}"
            extension = "sext" if signed else "zext"
            value = "%v"
            convert = ""
            if width != xlen:
                convert = f"%e = {extension} i{width} %v to {ty}"
                value = "%e"
            ir += f"""
define {ty} @load{suffix}(ptr %p) {{
  %v = load i{width}, ptr %p, align {width // 8}
  {convert}
  ret {ty} {value}
}}
"""
        for width in sorted({8, 16, 32, xlen}):
            convert = f"%t = trunc {ty} %v to i{width}" if width != xlen else ""
            value = "%t" if width != xlen else "%v"
            ir += f"""
define void @store{width}(ptr %p, {ty} %v) {{
  {convert}
  store i{width} {value}, ptr %p, align {width // 8}
  ret void
}}
"""
        ir += f"""
define {ty} @specialized_immediate({ty} %a) {{
  %v = add {ty} %a, 2
  ret {ty} %v
}}
"""
        selected = llc(ir, xlen, "-stop-after=instruction-select", "-o", "-")
        for opcode in ("PG_BEQ_", "PG_BAND_", "PG_BREG_", "PG_L8_", "PG_L8S_",
                       "PG_L16_", "PG_S8_", "PG_S16_"):
            assert opcode in selected, f"RV{xlen}: {opcode} was not selected\n{selected}"
        assert "PG_SPECIAL_ 0, -1" in selected, selected
        if xlen == 64:
            for opcode in ("PG_L32_", "PG_LX_", "PG_S32_", "PG_SX_"):
                assert opcode in selected, f"RV64: missing {opcode}\n{selected}"
        for choices in (("PG_L32_", "PG_LX_"), ("PG_S32_", "PG_SX_")):
            assert any(opcode in selected for opcode in choices), choices
        llc(ir, xlen, "-filetype=obj", "-o", str(pathlib.Path(directory) / f"selection{xlen}.o"))
        far = f"""
define void @far_branch({ty} %a, {ty} %b) {{
entry:
  %v = and {ty} %a, %b
  %c = icmp ne {ty} %v, 0
  br i1 %c, label %taken, label %fall
fall:
  call void asm sideeffect ".space 8192", ""()
  ret void
taken:
  call void asm sideeffect "nop", ""()
  ret void
}}
"""
        assembly = llc(far, xlen, "-o", "-", opt=0)
        assert "pg.band" in assembly, assembly
        obj = pathlib.Path(directory) / f"far{xlen}.o"
        llc(far, xlen, "-filetype=obj", "-o", str(obj), opt=0)
        text = text_section(obj)
        assert len(text) > 8192, len(text)
        branches = 0
        for offset in range(0, len(text) - 3, 4):
            word = struct.unpack_from("<I", text, offset)[0]
            if word & 0x7f != 0x2b:
                continue
            displacement = (((word >> 31) & 1) << 12 | ((word >> 25) & 0x3f) << 5 |
                            ((word >> 8) & 15) << 1 | ((word >> 7) & 1) << 11)
            if displacement & 0x1000:
                displacement -= 0x2000
            assert 0 < abs(displacement) < 4096, displacement
            target = offset + displacement
            assert 0 <= target <= len(text) - 4, target
            # The non-invertible branch must reach the nearby trampoline's
            # jump, rather than the padding in the distant fallthrough block.
            jump = struct.unpack_from("<I", text, target)[0]
            assert jump & 0x7f in (0x6f, 0x17), (offset, displacement, hex(jump))
            branches += 1
        assert branches, "no generated branch in object code"
        print(f"RV{xlen}: generated branch/load/store selection and far-branch object encoding passed")
