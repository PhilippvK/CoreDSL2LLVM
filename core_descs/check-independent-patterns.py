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


GROUPS = (
    "IndependentBranches",
    "IndependentMemory",
    "IndependentImmediates",
    "DynamicSlices",
    "BranchImmediates",
    "NarrowStoreSlices",
    "MemoryFusion",
    "BranchLogic",
)
NEW_OPCODES = (
    "PG_EXTRACT",
    "PG_BEQI5",
    "PG_BLTUI3",
    "PG_BNEI8",
    "PG_BLTI5",
    "PG_STORE_SLICE",
    "PG_LDX_REG",
    "PG_STX_REG",
    "PG_LDX_SCALE",
    "PG_STX_SCALE",
    "PG_LD_ADD",
    "PG_ST_XOR",
    "PG_LD_BOTH",
    "PG_ST_BOTH",
    "PG_BOR",
    "PG_BXOR",
)
OPERANDS = """def PGImm8 : SImmAsmOperand<8> {
  let PredicateMethod = "isSImm<8>";
}
def pg_simm8 : RISCVOp, ImmLeaf<XLenVT, "return isInt<8>(Imm);"> {
  let ParserMatchClass = PGImm8;
  let EncoderMethod = "getImmOpValue";
  let DecoderMethod = "decodeSImmOperand<8>";
  let OperandType = "OPERAND_SIMM8";
  let MCOperandPredicate = [{
    int64_t Imm;
    return MCOp.evaluateAsConstantImm(Imm) && isInt<8>(Imm);
  }];
}"""

export = pathlib.Path(sys.argv[2]).resolve() if len(sys.argv) > 2 else None
if export:
    export.mkdir(parents=True, exist_ok=True)
context = (
    contextlib.nullcontext(export)
    if export
    else tempfile.TemporaryDirectory(prefix="patterngen-independent-")
)
with context as directory:
    directory = pathlib.Path(directory)
    for xlen in (32, 64):
        includes = ['include "RISCV.td"', OPERANDS]
        for name in GROUPS:
            output = directory / f"{name}{xlen}.td"
            stdout, stderr = run(
                [
                    BIN / "pattern-gen",
                    ROOT / "core_descs" / f"{name}.core_desc",
                    "--riscv-xlen",
                    xlen,
                    "--no-extend",
                    "-p",
                    "",
                    "-o",
                    output,
                ]
            )
            assert "failed" not in stderr.lower(), stderr
            includes += [
                f'include "{output.with_name(output.stem + "InstrFormat.td")}"',
                f'include "{output}"',
            ]
            if name == "IndependentImmediates":
                assert stdout.count("Pattern for PG_SPECIAL_") == 4, stdout
                assert output.read_text().count("def PG_SPECIAL_ :") == 1
            if name == "IndependentBranches":
                assert stdout.count("Pattern for PG_B") == 3, stdout
            if name == "IndependentMemory":
                assert stdout.count("Pattern for PG_") == 9, stdout
        wrapper = directory / f"Wrapper{xlen}.td"
        wrapper.write_text("\n".join(includes) + "\n")
        generated, stderr = run(
            [
                BIN / "llvm-tblgen",
                "-gen-global-isel",
                "-warn-on-skipped-patterns",
                "-I",
                ROOT / "llvm/include",
                "-I",
                ROOT / "llvm/lib/Target/RISCV",
                wrapper,
            ]
        )
        # These opcode references occur in imported action tables. Seeing a
        # printed PatternGen pattern alone does not establish import support.
        for name in (
            "PG_BEQ",
            "PG_BAND",
            "PG_BREG",
            "PG_L8",
            "PG_L8S",
            "PG_S8",
            "PG_L16",
            "PG_S16",
            "PG_L32",
            "PG_S32",
            "PG_LX",
            "PG_SX",
            "PG_SPECIAL",
            *NEW_OPCODES,
        ):
            assert (
                f"RISCV::{name}_" in generated
            ), f"RV{xlen}: not imported: {name}\n{stderr}"
        print(
            f"RV{xlen}: all 29 instruction definitions imported through ordinary TableGen"
        )

    if export:
        formats = []
        patterns = [OPERANDS]
        for name in GROUPS:
            formats.append(f'include "{directory / (name + "64InstrFormat.td")}"')
            original = directory / (name + "64.td")
            preferred = directory / (name + "64Preferred.td")
            lines = []
            for line in original.read_text().splitlines():
                if any(f" in def {opcode}_ :" in line for opcode in NEW_OPCODES):
                    # Standalone fixtures need decoder entries; normal output
                    # stays codegen-only for integration with target ISA defs.
                    line = line.replace("isCodeGenOnly = 1", "isCodeGenOnly = 0")
                lines.append(line)
            preferred.write_text(
                ("\n".join(lines) + "\n").replace(
                    "def : Pat<", "let AddedComplexity = 1000 in def : Pat<"
                )
            )
            patterns.append(f'include "{preferred}"')
            source = directory / f"{name}32.td"
            dest = directory / f"{name}32PatternsOnly.td"
            dest.write_text(
                "\n".join(
                    line
                    for line in source.read_text().splitlines()
                    if not line.startswith("let hasSideEffects")
                    and not (line.startswith("def ") and "_singleuse_" in line)
                ).replace("def : Pat<", "let AddedComplexity = 1000 in def : Pat<")
                + "\n"
            )
            patterns.append(f'include "{dest}"')
        (directory / "patternsInstrFormat.td").write_text("\n".join(formats) + "\n")
        (directory / "patterns.td").write_text("\n".join(patterns) + "\n")
        print(f"Combined target includes exported to {directory}")
