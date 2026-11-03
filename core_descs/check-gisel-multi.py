#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
"""Generate and verify a connected two-result arithmetic pattern."""

import argparse
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parent.parent


def run(command, source=None):
    result = subprocess.run(
        [str(arg) for arg in command], input=source, text=True, capture_output=True
    )
    if result.returncode:
        raise RuntimeError(f"{command}\n{result.stdout}\n{result.stderr}")
    return result.stdout


def prepare(binary, output):
    formats, patterns, tables = [], [], []
    for xlen in (32, 64):
        source = output / f"Multi{xlen}.core_desc"
        text = (
            (ROOT / "core_descs/GISelTableMulti.core_desc")
            .read_text()
            .replace("PGM_", f"PGM{xlen}_")
            .replace('"pgm.', f'"pgm{xlen}.')
        )
        if xlen == 64:
            text = text.replace("7'b0001011", "7'b0101011")
        source.write_text(text)
        target = output / f"Multi{xlen}.td"
        log = run(
            [
                binary / "pattern-gen",
                source,
                "--no-extend",
                "--gisel-table",
                "--riscv-xlen",
                xlen,
                "--mattr=+m",
                "-p",
                f"HasPGTable,IsRV{xlen}",
                "-o",
                target,
            ]
        )
        (output / f"prepare{xlen}.log").write_text(log)
        assert (
            f"Generated 2 out of 2 GISel pattern permutations for PGM{xlen}_SUMDIFF (100%)"
            in log
        ), log
        target.write_text(
            target.read_text().replace("isCodeGenOnly = 1", "isCodeGenOnly = 0")
        )
        formats.append(f'include "{output/f"Multi{xlen}InstrFormat.td"}"')
        patterns.append(f'include "{target}"')
        tables.append(f'#include "{target.with_suffix(".inc")}"')
    for name, lines in (
        ("formats.td", formats),
        ("patterns.td", patterns),
        ("tables.inc", tables),
    ):
        (output / name).write_text("\n".join(lines) + "\n")
    print(f"Prepared two-result patterns in {output}")


def program(xlen, reverse=False):
    ty = f"i{xlen}"
    operations = [f"%sum = add {ty} %a, %b", f"%diff = sub {ty} %a, %b"]
    if reverse:
        operations.reverse()
    return f"""define {{{ty}, {ty}}} @pair({ty} %a, {ty} %b) {{
  {operations[0]}
  {operations[1]}
  %first = insertvalue {{{ty}, {ty}}} poison, {ty} %sum, 0
  %both = insertvalue {{{ty}, {ty}}} %first, {ty} %diff, 1
  ret {{{ty}, {ty}}} %both
}}
"""


def safety_programs(xlen):
    t = f"i{xlen}"
    cases = {
        "different_inputs": f"""define {{{t}, {t}}} @mismatch({t} %a, {t} %b, {t} %c) {{
 %s = add {t} %a, %b
 %d = sub {t} %a, %c
 %r = insertvalue {{{t}, {t}}} poison, {t} %s, 0
 %r2 = insertvalue {{{t}, {t}}} %r, {t} %d, 1
 ret {{{t}, {t}}} %r2
}}""",
        "cross_block": f"""define {t} @cross({t} %a, {t} %b, i1 %cond, ptr %p) {{
entry:
 %s = add {t} %a, %b
 store volatile {t} %s, ptr %p
 br i1 %cond, label %yes, label %no
yes:
 %d = sub {t} %a, %b
 ret {t} %d
no:
 ret {t} %s
}}""",
        "intervening_use": f"""define {t} @intervening({t} %a, {t} %b, ptr %p) {{
 %s = add {t} %a, %b
 store volatile {t} %s, ptr %p
 %d = sub {t} %a, %b
 ret {t} %d
}}""",
    }
    return cases


def check(binary, output):
    for xlen in (32, 64):
        ty = f"i{xlen}"
        for reverse in (False, True):
            for opt in (0, 2, 3):
                source = program(xlen, reverse)
                command = [
                    binary / "llc",
                    f"-mtriple=riscv{xlen}",
                    f"-O{opt}",
                    "-global-isel=1",
                    "-global-isel-abort=1",
                    "-verify-machineinstrs",
                ]
                mir = run(
                    [*command, "-mattr=+pgtable,+m", "-stop-after=instruction-select"],
                    source,
                )
                assert f"PGM{xlen}_SUMDIFF_" in mir, mir
                (output / f"pair{xlen}-{reverse}-O{opt}.mir").write_text(mir)
                obj = output / f"pair{xlen}-{reverse}-O{opt}.o"
                run(
                    [*command, "-mattr=+pgtable,+m", "-filetype=obj", "-o", obj], source
                )
                disassembly = run(
                    [binary / "llvm-objdump", "-d", "--mattr=+pgtable,+m", obj]
                )
                assert f"pgm{xlen}.sumdiff" in disassembly, disassembly
                assert "<unknown>" not in disassembly, disassembly
                fallback = run([*command, "-mattr=-pgtable,+m"], source)
                assert "pgm" not in fallback, fallback
        for name, source in safety_programs(xlen).items():
            # Preserve the blocks and intervening uses deliberately constructed
            # here; optimized IR may legally move these arithmetic operations.
            mir = run(
                [
                    binary / "llc",
                    f"-mtriple=riscv{xlen}",
                    "-O0",
                    "-mattr=+pgtable,+m",
                    "-global-isel=1",
                    "-global-isel-abort=1",
                    "-verify-machineinstrs",
                    "-stop-after=instruction-select",
                ],
                source,
            )
            assert f"PGM{xlen}_SUMDIFF_" not in mir, (name, mir)
            (output / f"{name}{xlen}.mir").write_text(mir)
        one = f"define {ty} @single({ty} %a, {ty} %b) {{ %sum = add {ty} %a, %b ret {ty} %sum }}"
        asm = run(
            [
                binary / "llc",
                f"-mtriple=riscv{xlen}",
                "-O2",
                "-mattr=+pgtable,+m",
                "-global-isel=1",
                "-global-isel-abort=1",
                "-verify-machineinstrs",
            ],
            one,
        )
        assert "pgm" not in asm, asm
        print(
            f"RV{xlen}: both root orders at O0/O2/O3, decoding, safety rejections and feature/single-output fallback passed"
        )


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("binary", type=Path)
    parser.add_argument("action", choices=("prepare", "check"))
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    args.output = args.output.resolve()
    args.output.mkdir(parents=True, exist_ok=True)
    (prepare if args.action == "prepare" else check)(args.binary.resolve(), args.output)


if __name__ == "__main__":
    main()
