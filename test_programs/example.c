// RUN: pattern-gen %s -O 3 --riscv-xlen 32 --mattr=+m | FileCheck --check-prefixes=CHECK-RV32,CHECK-RV32-EXTEND -allow-unused-prefixes %s
// RUN: pattern-gen %s -O 3 --riscv-xlen 64 --mattr=+m | FileCheck --check-prefixes=CHECK-RV64,CHECK-RV64-EXTEND -allow-unused-prefixes %s

// CHECK-RV32: Pattern for CV_SUBINCACC: (add (sub (add GPR:$rs1, (i32 1)), GPR:$rs2), GPR:$rd)
// CHECK-RV64: Pattern for CV_SUBINCACC: (add (sub (add GPR:$rs1, (i64 1)), GPR:$rs2), GPR:$rd)
int test_subincacc(int a, int b, int c) {
    return ((a + 1) - b) + c;
}
