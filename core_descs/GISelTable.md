# Experimental direct GlobalISel matchers

`pattern-gen --gisel-table` emits instruction definitions in the requested `.td`
file and direct GlobalISel `RuleMatcher` construction code in the sibling `.inc`.
Without this option the ordinary TableGen pattern extractor remains in use.
The direct extractor is isolated in `PatternGenGISelTable.cpp`.

The runtime and TableGen extensions support graphs with shared inputs and a
connected pair of arithmetic outputs. Instruction erasure belongs to the matcher
executor's state; no MachineInstr flag bit is reserved. Additional captured
instructions must be in the root's block and safe to move to it. Intervening
uses of their results prevent merging. Memory writeback and arbitrary numbers
of outputs are not established by these examples.

## Standalone regression setup

Build `pattern-gen`, `llc`, `llvm-objdump`, `FileCheck`, and the lit support tools
in a separate build directory. Enable the RISC-V target and assertions. The
following helpers prepare both RV32 and RV64 definitions:

```
python3 core_descs/check-gisel-table.py build/bin prepare /tmp/pg-ordinary --backend gisel-table
python3 core_descs/check-gisel-multi.py build/bin prepare /tmp/pg-multi
```

For validation only, place these includes in
`llvm/lib/Target/RISCV/patternsInstrFormat.td`:

```
include "/tmp/pg-ordinary/formats.td"
include "/tmp/pg-multi/formats.td"
```

Place the matching includes in `llvm/lib/Target/RISCV/patterns.td`:

```
include "/tmp/pg-ordinary/patterns.td"
include "/tmp/pg-multi/patterns.td"
```

Create `/tmp/pg-tables.inc` containing:

```
#include "/tmp/pg-ordinary/tables.inc"
#include "/tmp/pg-multi/tables.inc"
```

Reconfigure with `-DUSE_GENERATED_FORMATS=ON -DUSE_GENERATED_PATTERNS=ON
-DPATTERNGEN_GISEL_TABLES=/tmp/pg-tables.inc` and rebuild `llc` and
`llvm-objdump`. Then run:

```
python3 core_descs/check-gisel-table.py build/bin check /tmp/pg-ordinary
python3 core_descs/check-gisel-multi.py build/bin check /tmp/pg-multi
```

The ordinary helper checks NAND, three-input addition, an accumulating operation,
a five-bit immediate shift and unsigned maximum at O0/O2/O3. It checks assembly,
object decoding, disabled-feature fallback and an out-of-range immediate.
The multi-output helper checks sum/difference in both definition orders at all
three optimization levels, decoding, feature/single-output fallback, mismatched
inputs, different blocks and intervening uses. The safety cases intentionally
use O0 to preserve their constructed order and blocks.

For the ordinary TableGen reference, prepare a separate output directory with
`--backend tablegen`, include its formats and definitions instead of the direct
ordinary output, and omit its matcher include. The same ordinary check command
must pass for that build. Include a single ordinary set: reference and direct
sets deliberately use the same instruction names.

The helper makes test definitions decoder-visible; normal generated definitions
remain codegen-only. Restore the two tracked include stubs and disable the three
CMake options after standalone validation. Generated definitions and absolute
paths are not part of this branch.

The `core_descs` lit suite additionally verifies extraction of the ordinary and
multi-output fixtures. Native GlobalISel regression tests remain applicable with
the experimental feature disabled.
