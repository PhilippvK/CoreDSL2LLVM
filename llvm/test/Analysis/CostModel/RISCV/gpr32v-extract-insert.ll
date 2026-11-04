; RUN: opt -mtriple=riscv32 -mattr=+gpr32v -passes='print<cost-model>' -disable-output %s 2>&1 | FileCheck %s
; Packed GPR vectors must not query RVV-only vector lengths.
; CHECK-LABEL: Printing analysis 'Cost Model Analysis' for function 'extract_insert':
; CHECK: cost of 1 {{.*}} %lane = extractelement <4 x i8> %v, i32 2
; CHECK: cost of 1 {{.*}} %result = insertelement <4 x i8> %v, i8 %lane, i32 1

define <4 x i8> @extract_insert(<4 x i8> %v) {
  %lane = extractelement <4 x i8> %v, i32 2
  %result = insertelement <4 x i8> %v, i8 %lane, i32 1
  ret <4 x i8> %result
}

; RUN: opt -mtriple=riscv32 -mattr=+gpr32v -passes=slp-vectorizer -S %s | FileCheck %s --check-prefix=SLP
; SLP-LABEL: define void @build_vector_cost(
define void @build_vector_cost(ptr %p, i8 %a, i8 %b, i8 %c, i8 %d) {
  store i8 %a, ptr %p, align 4
  %p1 = getelementptr i8, ptr %p, i32 1
  store i8 %b, ptr %p1
  %p2 = getelementptr i8, ptr %p, i32 2
  store i8 %c, ptr %p2
  %p3 = getelementptr i8, ptr %p, i32 3
  store i8 %d, ptr %p3
  ret void
}
