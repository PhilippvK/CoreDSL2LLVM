# LLVM 23 PatternGen features using ordinary TableGen patterns

This port takes the independent features of `llvm-20.1.0-gisel-table-new`
(`d1dd6867429`) onto `llvm-23.1.3`. It uses LLVM's existing
SelectionDAG-to-GlobalISel TableGen importer. It does not require the custom
GISel table emitter, matcher opcodes, instruction-deletion markers, or
multi-root extraction.

## Features

- Explicit memory and register names remain supported by the LLVM 23 parser.
  A load feeding a register output or one memory store is a supported pattern
  root. The regression inputs cover 8-, 16-, 32-, and XLEN-bit memory operations.
- `branch(condition);` emits a `brcond` pattern. Integer conditions mean
  nonzero, and comparison conditions retain their predicate. Declare the
  destination as `signed<13> offset [[is_branch_offs]]`; this operand denotes
  the destination basic block during selection. The emitter places it last in
  the instruction's input operands, independently of its declaration order,
  and sets the branch, terminator, and B-format attributes.
- Narrow scalar store values are normalized to XLEN before instruction
  selection, allowing ordinary `truncstore` patterns to match native IR stores.
  Reusing a truncation input or extending a narrow value preserves the low bits
  written to memory.
- RISC-V branch analysis and insertion preserve generated branch operands.
  Generated branches without a known inverse use the existing branch-relaxation
  trampoline path. Native branch folding and copy/loop optimizations skip
  predicates or operand layouts they cannot interpret.
- `[[is_unroll_imm]]` specializes small immediate operands, including signed
  operands and the Cartesian product of multiple immediates. All specializations
  share one encoding class and instruction definition; each selection pattern
  supplies its fixed immediate values. `[[llvm_type = "simm5"]]` can select an
  existing target operand class when the source bit width has no named class.
- Signed immediate assumptions preserve negative values. Unsigned assumptions
  also support an immediate as wide as XLEN without an undefined host shift.
- `--print-mir` prints without requiring LLVM's debug logging. Predicate strings
  and ternary-expression patterns were already present in LLVM 23 and are retained.
- Extraction failures return a nonzero status and discard their semantic
  machine instructions before native selection. Use `-f` to request partial
  pattern output explicitly; the XCV fixture uses this for its unsupported
  vector instructions.

Multiple observable outputs, multiple stores, and branches combined with a
store need a multi-root matcher and remain outside this port. Branch offsets
currently use the standard signed 13-bit RISC-V B-format layout.

## Building and checking

```sh
cmake --build build-port --target pattern-gen llvm-tblgen FileCheck not llc -j 8
PATH="$PWD/build-port/bin:$PATH" build-port/bin/llvm-lit -v core_descs
python3 core_descs/check-independent-patterns.py build-port/bin
```

The last command generates RV32 and RV64 branch, memory, and immediate patterns,
then checks that LLVM's ordinary GlobalISel importer emits actions for every
instruction. It checks the generated matcher, rather than only PatternGen's
printed pattern strings.

For target integration, add includes to
`llvm/lib/Target/RISCV/patternsInstrFormat.td` and `patterns.td`, and configure
with `-DUSE_GENERATED_FORMATS=ON -DUSE_GENERATED_PATTERNS=ON`. Both switches are
disabled unless explicitly enabled. There is no `USE_GENERATED_TABLES`
requirement.

To exercise generated instructions in `llc`, export combined RV32/RV64 test
includes (the two architectures share instruction definitions):

```sh
python3 core_descs/check-independent-patterns.py build-port/bin /tmp/pg-independent
```

Set the two RISC-V include files to include the corresponding exported files,
configure with both generated-output switches, and rebuild `llc`. The exported
test wrapper gives these patterns higher priority so generated memory rules are
exercised even when a native load/store rule has identical semantics. Ordinary
PatternGen output retains its normal priority. Then run:

```sh
python3 core_descs/check-independent-codegen.py build-port/bin
```

This checks generated branch, load, store, and specialized-immediate selection
on both architectures. It also emits an ELF object with an 8 KB gap and checks
that a generated conditional branch survives relaxation and has an encoded
local displacement within its 13-bit range.
