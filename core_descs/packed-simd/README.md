# RV32 packed SIMD regression fixtures

Run `python3 core_descs/check-packed-simd.py BUILD/bin prepare /tmp/packed`.
Include the exported `formats.td` and `patterns.td` through the target's existing
`patternsInstrFormat.td` and `patterns.td` hooks, enable USE_GENERATED_FORMATS and
USE_GENERATED_PATTERNS, then rebuild llc and llvm-objdump. Run the same command
with `check` in place of `prepare`.

The four lane-wise descriptions must each produce one vector-typed ordinary Pat.
The verifier checks both selectors at O0/O2/O3, optimized subtraction operand
order, aligned/unaligned transfers, decoding and disabled-feature behavior.
No direct GISel matcher is used. For a Seal5-generated backend use
`check ... --extension xpackedsimd32` instead; see Seal5 examples/packed_simd.
