; RUN: opt -mtriple=riscv32 -mattr=+gpr32v,+gpr32v-add,-gpr32v-sub -passes='print<cost-model>' -disable-output %s 2>&1 | FileCheck %s --check-prefixes=ADD,STRICT,SHUFFLE
; RUN: opt -mtriple=riscv32 -mattr=+gpr32v,-gpr32v-add,+gpr32v-sub,+unaligned-scalar-mem -passes='print<cost-model>' -disable-output %s 2>&1 | FileCheck %s --check-prefixes=SUB,UNALIGNED,SHUFFLE
; ADD: cost of 1 {{.*}} %sum = add
; ADD: cost of 40 {{.*}} %diff = sub
; SUB: cost of 40 {{.*}} %sum = add
; SUB: cost of 1 {{.*}} %diff = sub
; STRICT: cost of 7 {{.*}} %x = load
; STRICT: cost of 3 {{.*}} store
; UNALIGNED: cost of 1 {{.*}} %x = load
; UNALIGNED: cost of 1 {{.*}} store
; SHUFFLE: cost of 30 {{.*}} %s = shufflevector

define <4 x i8> @arithmetic(<4 x i8> %a, <4 x i8> %b) {
  %sum = add <4 x i8> %a, %b
  %diff = sub <4 x i8> %sum, %b
  ret <4 x i8> %diff
}
define void @memory(ptr %a, ptr %b) {
  %x = load <4 x i8>, ptr %a, align 1
  store <4 x i8> %x, ptr %b, align 2
  ret void
}
define <4 x i8> @shuffle(<4 x i8> %a) {
  %s = shufflevector <4 x i8> %a, <4 x i8> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  ret <4 x i8> %s
}
