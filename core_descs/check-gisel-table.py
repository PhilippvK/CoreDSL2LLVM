#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
"""Generate or verify single-result patterns using either PatternGen backend.

Prepare: python3 core_descs/check-gisel-table.py build/bin prepare /tmp/pg-table
Verify:  python3 core_descs/check-gisel-table.py build/bin check /tmp/pg-table
The target must be rebuilt with the exported definitions/matchers before check.
"""

import argparse
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parent.parent
NAMES = ("NAND", "ADD3", "SUBINCACC", "SHLI5", "MAXU")


def run(command, *, source=None):
    result = subprocess.run(
        [str(arg) for arg in command], input=source, text=True, capture_output=True
    )
    if result.returncode:
        raise RuntimeError(f"{command}\n{result.stdout}\n{result.stderr}")
    return result.stdout


def prepare(binary, output, backend):
    formats, definitions, tables = [], [], []
    for xlen in (32, 64):
        source = output / f"Ordinary{xlen}.core_desc"
        source.write_text(
            (ROOT / "core_descs/GISelTableOrdinary.core_desc")
            .read_text()
            .replace("PGT_", f"PGT{xlen}_")
            .replace('"pgt.', f'"pgt{xlen}.')
        )
        # Distinct opcodes keep both decoder-visible instruction sets unambiguous.
        if xlen == 64:
            source.write_text(source.read_text().replace("7'b0001011", "7'b0101011"))
        target = output / f"Ordinary{xlen}.td"
        command = [
            binary / "pattern-gen",
            source,
            "--no-extend",
            "--riscv-xlen",
            xlen,
            "--mattr=+m,+zbb",
            "-p",
            f"HasPGTable,IsRV{xlen}",
            "-o",
            target,
        ]
        if backend == "gisel-table":
            command.append("--gisel-table")
        log = run(command)
        (output / f"prepare{xlen}.log").write_text(log)
        # This standalone target has no separate assembler definitions, unlike Seal5.
        text = target.read_text().replace("isCodeGenOnly = 1", "isCodeGenOnly = 0")
        if backend == "tablegen":
            text = text.replace(
                "def : Pat<", "let AddedComplexity = 1000 in def : Pat<"
            )
        target.write_text(text)
        for name in NAMES:
            assert f"def PGT{xlen}_{name}_ :" in text, text
        if backend == "gisel-table":
            assert "def : Pat<" not in text, text
            fragment = target.with_suffix(".inc")
            for name in NAMES:
                assert f'RK.getDef("PGT{xlen}_{name}_")' in fragment.read_text()
            tables.append(f'#include "{fragment}"')
        else:
            assert text.count("def : Pat<") == len(NAMES), text
        formats.append(f'include "{output / f"Ordinary{xlen}InstrFormat.td"}"')
        definitions.append(f'include "{target}"')
    (output / "formats.td").write_text("\n".join(formats) + "\n")
    features = """def FeaturePGTable : SubtargetFeature<"pgtable", "HasPGTable", "true",
  "PatternGen direct-table regression patterns">;
def HasPGTable : Predicate<"Subtarget->hasPGTable()">,
  AssemblerPredicate<(all_of FeaturePGTable)>;
"""
    (output / "patterns.td").write_text(features + "\n".join(definitions) + "\n")
    (output / "tables.inc").write_text("\n".join(tables) + "\n")
    print(f"Prepared {len(NAMES) * 2} {backend} patterns in {output}")


def program(xlen):
    ty = f"i{xlen}"
    return f"""
define {ty} @nand({ty} %a, {ty} %b) {{
  %and = and {ty} %a, %b
  %r = xor {ty} %and, -1
  ret {ty} %r
}}
define {ty} @add3({ty} %a, {ty} %b, {ty} %c) {{
  %ab = add {ty} %a, %b
  %r = add {ty} %ab, %c
  ret {ty} %r
}}
define {ty} @subincacc({ty} %acc, {ty} %a, {ty} %b) {{
  %inc = add {ty} %a, 1
  %sub = sub {ty} %inc, %b
  %r = add {ty} %sub, %acc
  ret {ty} %r
}}
define {ty} @shli5({ty} %a) {{
  %r = shl {ty} %a, 31
  ret {ty} %r
}}
declare {ty} @llvm.umax.{ty}({ty}, {ty})
define {ty} @maxu({ty} %a, {ty} %b) {{
  %r = call {ty} @llvm.umax.{ty}({ty} %a, {ty} %b)
  ret {ty} %r
}}
"""


def check(binary, output):
    for xlen in (32, 64):
        ir = program(xlen)
        for opt in (0, 2, 3):
            command = [
                binary / "llc",
                f"-mtriple=riscv{xlen}",
                f"-O{opt}",
                "-global-isel=1",
                "-global-isel-abort=1",
                "-verify-machineinstrs",
            ]
            selected = run(
                [*command, "-mattr=+pgtable,+zbb", "-stop-after=instruction-select"],
                source=ir,
            )
            for name in NAMES:
                assert f"PGT{xlen}_{name}_" in selected, selected
            (output / f"selected{xlen}-O{opt}.mir").write_text(selected)
            fallback = run([*command, "-mattr=-pgtable,+zbb"], source=ir)
            assert "pgt" not in fallback, fallback
            obj = output / f"ordinary{xlen}-O{opt}.o"
            run(
                [*command, "-mattr=+pgtable,+zbb", "-filetype=obj", "-o", obj],
                source=ir,
            )
            assembly = run(
                [binary / "llvm-objdump", "-d", "--mattr=+pgtable,+zbb", obj]
            )
            for name in NAMES:
                assert f"pgt{xlen}.{name.lower()}" in assembly, assembly
            assert "<unknown>" not in assembly, assembly
            (output / f"ordinary{xlen}-O{opt}.asm").write_text(assembly)
        if xlen == 64:
            negative = "define i64 @too_wide(i64 %a) { %r = shl i64 %a, 32 ret i64 %r }"
            asm = run(
                [
                    binary / "llc",
                    "-mtriple=riscv64",
                    "-O2",
                    "-mattr=+pgtable,+zbb",
                    "-global-isel=1",
                    "-global-isel-abort=1",
                    "-verify-machineinstrs",
                ],
                source=negative,
            )
            assert "pgt64.shli5" not in asm, asm
        print(
            f"RV{xlen}: selection, native fallback and object decoding passed at O0/O2/O3"
        )


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("binary", type=Path)
    parser.add_argument("action", choices=("prepare", "check"))
    parser.add_argument("output", type=Path)
    parser.add_argument(
        "--backend", choices=("tablegen", "gisel-table"), default="gisel-table"
    )
    args = parser.parse_args()
    args.output = args.output.resolve()
    args.output.mkdir(parents=True, exist_ok=True)
    if args.action == "prepare":
        prepare(args.binary.resolve(), args.output, args.backend)
    else:
        check(args.binary.resolve(), args.output)


if __name__ == "__main__":
    main()
