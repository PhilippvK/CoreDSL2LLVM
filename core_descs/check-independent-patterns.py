#!/usr/bin/env python3
"""Verify ordinary TableGen import for the independent PatternGen features.

Usage: python3 core_descs/check-independent-patterns.py build-port/bin
"""
import contextlib
import pathlib
import subprocess
import sys
import tempfile

ROOT = pathlib.Path(__file__).resolve().parent.parent
BIN = pathlib.Path(sys.argv[1]).resolve()


def run(args):
    result = subprocess.run([str(x) for x in args], text=True, capture_output=True)
    if result.returncode:
        raise RuntimeError(f"Command failed: {args}\n{result.stdout}\n{result.stderr}")
    return result.stdout, result.stderr


export = pathlib.Path(sys.argv[2]).resolve() if len(sys.argv) > 2 else None
if export:
    export.mkdir(parents=True, exist_ok=True)
context = contextlib.nullcontext(export) if export else tempfile.TemporaryDirectory(prefix="patterngen-independent-")
with context as directory:
    directory = pathlib.Path(directory)
    for xlen in (32, 64):
        includes = ['include "RISCV.td"']
        for name in ("IndependentBranches", "IndependentMemory", "IndependentImmediates"):
            output = directory / f"{name}{xlen}.td"
            stdout, stderr = run([
                BIN / "pattern-gen", ROOT / "core_descs" / f"{name}.core_desc",
                "--riscv-xlen", xlen, "-p", "", "-o", output,
            ])
            assert "failed" not in stderr.lower(), stderr
            includes += [f'include "{output.with_name(output.stem + "InstrFormat.td")}"',
                         f'include "{output}"']
            if name == "IndependentImmediates":
                assert stdout.count("Pattern for PG_SPECIAL_") == 4, stdout
                assert output.read_text().count("def PG_SPECIAL_ :") == 1
            if name == "IndependentBranches":
                assert stdout.count("Pattern for PG_B") == 3, stdout
            if name == "IndependentMemory":
                assert stdout.count("Pattern for PG_") == 9, stdout
        wrapper = directory / f"Wrapper{xlen}.td"
        wrapper.write_text("\n".join(includes) + "\n")
        generated, stderr = run([
            BIN / "llvm-tblgen", "-gen-global-isel", "-warn-on-skipped-patterns",
            "-I", ROOT / "llvm/include", "-I", ROOT / "llvm/lib/Target/RISCV",
            wrapper,
        ])
        # These opcode references occur in imported action tables. Seeing a
        # printed PatternGen pattern alone does not establish import support.
        for name in ("PG_BEQ", "PG_BAND", "PG_BREG", "PG_L8", "PG_L8S", "PG_S8",
                     "PG_L16", "PG_S16", "PG_L32", "PG_S32", "PG_LX", "PG_SX",
                     "PG_SPECIAL"):
            assert f"RISCV::{name}_" in generated, f"RV{xlen}: not imported: {name}\n{stderr}"
        print(f"RV{xlen}: all 13 instruction definitions imported through ordinary TableGen")

    if export:
        formats = []
        patterns = []
        for name in ("IndependentBranches", "IndependentMemory", "IndependentImmediates"):
            formats.append(f'include "{directory / (name + "64InstrFormat.td")}"')
            patterns.append(f'include "{directory / (name + "64.td")}"')
            source = directory / f"{name}32.td"
            dest = directory / f"{name}32PatternsOnly.td"
            dest.write_text("\n".join(line for line in source.read_text().splitlines()
                                      if not line.startswith("let hasSideEffects")) + "\n")
            patterns.append(f'include "{dest}"')
        (directory / "patternsInstrFormat.td").write_text("\n".join(formats) + "\n")
        (directory / "patterns.td").write_text("let AddedComplexity = 1000 in {\n" + "\n".join(patterns) + "\n}\n")
        print(f"Combined target includes exported to {directory}")
