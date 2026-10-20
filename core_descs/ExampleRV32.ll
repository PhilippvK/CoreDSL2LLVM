; ModuleID = 'mod'
source_filename = "mod"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define void @implLB(ptr noalias writeonly captures(none) initializes((0, 4)) %rd, ptr readonly captures(none) %rs1, i32 %imm) local_unnamed_addr #0 {
  %1 = icmp ult i32 %imm, 4096
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %2 = add i32 %rs1.v, %imm
  %3 = inttoptr i32 %2 to ptr
  %.v1 = load i8, ptr %3, align 1
  %4 = sext i8 %.v1 to i32
  store i32 %4, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define void @implLH(ptr noalias writeonly captures(none) initializes((0, 4)) %rd, ptr readonly captures(none) %rs1, i32 %imm) local_unnamed_addr #0 {
  %1 = icmp ult i32 %imm, 4096
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %2 = add i32 %rs1.v, %imm
  %3 = inttoptr i32 %2 to ptr
  %.v1 = load i16, ptr %3, align 2
  %4 = sext i16 %.v1 to i32
  store i32 %4, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define void @implLW(ptr noalias writeonly captures(none) initializes((0, 4)) %rd, ptr readonly captures(none) %rs1, i32 %imm) local_unnamed_addr #0 {
  %1 = icmp ult i32 %imm, 4096
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %2 = add i32 %rs1.v, %imm
  %3 = inttoptr i32 %2 to ptr
  %.v1 = load i32, ptr %3, align 4
  store i32 %.v1, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define void @implLBU(ptr noalias writeonly captures(none) initializes((0, 4)) %rd, ptr readonly captures(none) %rs1, i32 %imm) local_unnamed_addr #0 {
  %1 = icmp ult i32 %imm, 4096
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %2 = add i32 %rs1.v, %imm
  %3 = inttoptr i32 %2 to ptr
  %.v1 = load i8, ptr %3, align 1
  %4 = zext i8 %.v1 to i32
  store i32 %4, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define void @implLHU(ptr noalias writeonly captures(none) initializes((0, 4)) %rd, ptr readonly captures(none) %rs1, i32 %imm) local_unnamed_addr #0 {
  %1 = icmp ult i32 %imm, 4096
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %2 = add i32 %rs1.v, %imm
  %3 = inttoptr i32 %2 to ptr
  %.v1 = load i16, ptr %3, align 2
  %4 = zext i16 %.v1 to i32
  store i32 %4, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, target_mem0: none, target_mem1: none)
define void @implSB(ptr readonly captures(none) %rs1, ptr readonly captures(none) %rs2, i32 %imm) local_unnamed_addr #2 {
  %1 = icmp ult i32 %imm, 4096
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %2 = add i32 %rs1.v, %imm
  %3 = inttoptr i32 %2 to ptr
  %rs2.v = load i32, ptr %rs2, align 4
  %4 = trunc i32 %rs2.v to i8
  store i8 %4, ptr %3, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, target_mem0: none, target_mem1: none)
define void @implSH(ptr readonly captures(none) %rs1, ptr readonly captures(none) %rs2, i32 %imm) local_unnamed_addr #2 {
  %1 = icmp ult i32 %imm, 4096
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %2 = add i32 %rs1.v, %imm
  %3 = inttoptr i32 %2 to ptr
  %rs2.v = load i32, ptr %rs2, align 4
  %4 = trunc i32 %rs2.v to i16
  store i16 %4, ptr %3, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, target_mem0: none, target_mem1: none)
define void @implSW(ptr readonly captures(none) %rs1, ptr readonly captures(none) %rs2, i32 %imm) local_unnamed_addr #2 {
  %1 = icmp ult i32 %imm, 4096
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %2 = add i32 %rs1.v, %imm
  %3 = inttoptr i32 %2 to ptr
  %rs2.v = load i32, ptr %rs2, align 4
  store i32 %rs2.v, ptr %3, align 4
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, target_mem0: none, target_mem1: none) }
