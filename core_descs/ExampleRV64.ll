; ModuleID = 'mod'
source_filename = "mod"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implADDW2(ptr readonly captures(none) %rs2, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 8)) %rd) local_unnamed_addr #0 {
  %.v = load i32, ptr %rs1, align 4
  %.v1 = load i32, ptr %rs2, align 4
  %1 = add i32 %.v1, %.v
  %2 = sext i32 %1 to i64
  store i64 %2, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implADDW3(ptr readonly captures(none) %rs2, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 8)) %rd) local_unnamed_addr #0 {
  %rs1.v = load i32, ptr %rs1, align 4
  %rs2.v = load i32, ptr %rs2, align 4
  %1 = add i32 %rs2.v, %rs1.v
  %2 = sext i32 %1 to i64
  store i64 %2, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write)
define void @implLB(ptr noalias writeonly captures(none) initializes((0, 8)) %rd, ptr readonly captures(none) %rs1, i64 %imm) local_unnamed_addr #1 {
  %1 = add i64 %imm, 2048
  %2 = icmp ult i64 %1, 4096
  tail call void @llvm.assume(i1 %2)
  %rs1.v = load i64, ptr %rs1, align 8
  %3 = add i64 %rs1.v, %imm
  %4 = inttoptr i64 %3 to ptr
  %.v1 = load i8, ptr %4, align 1
  %5 = sext i8 %.v1 to i64
  store i64 %5, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write)
define void @implLH(ptr noalias writeonly captures(none) initializes((0, 8)) %rd, ptr readonly captures(none) %rs1, i64 %imm) local_unnamed_addr #1 {
  %1 = add i64 %imm, 2048
  %2 = icmp ult i64 %1, 4096
  tail call void @llvm.assume(i1 %2)
  %rs1.v = load i64, ptr %rs1, align 8
  %3 = add i64 %rs1.v, %imm
  %4 = inttoptr i64 %3 to ptr
  %.v1 = load i16, ptr %4, align 2
  %5 = sext i16 %.v1 to i64
  store i64 %5, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write)
define void @implLW(ptr noalias writeonly captures(none) initializes((0, 8)) %rd, ptr readonly captures(none) %rs1, i64 %imm) local_unnamed_addr #1 {
  %1 = add i64 %imm, 2048
  %2 = icmp ult i64 %1, 4096
  tail call void @llvm.assume(i1 %2)
  %rs1.v = load i64, ptr %rs1, align 8
  %3 = add i64 %rs1.v, %imm
  %4 = inttoptr i64 %3 to ptr
  %.v1 = load i32, ptr %4, align 4
  %5 = sext i32 %.v1 to i64
  store i64 %5, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write)
define void @implLD(ptr noalias writeonly captures(none) initializes((0, 8)) %rd, ptr readonly captures(none) %rs1, i64 %imm) local_unnamed_addr #1 {
  %1 = add i64 %imm, 2048
  %2 = icmp ult i64 %1, 4096
  tail call void @llvm.assume(i1 %2)
  %rs1.v = load i64, ptr %rs1, align 8
  %3 = add i64 %rs1.v, %imm
  %4 = inttoptr i64 %3 to ptr
  %.v1 = load i64, ptr %4, align 8
  store i64 %.v1, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write)
define void @implLBU(ptr noalias writeonly captures(none) initializes((0, 8)) %rd, ptr readonly captures(none) %rs1, i64 %imm) local_unnamed_addr #1 {
  %1 = add i64 %imm, 2048
  %2 = icmp ult i64 %1, 4096
  tail call void @llvm.assume(i1 %2)
  %rs1.v = load i64, ptr %rs1, align 8
  %3 = add i64 %rs1.v, %imm
  %4 = inttoptr i64 %3 to ptr
  %.v1 = load i8, ptr %4, align 1
  %5 = zext i8 %.v1 to i64
  store i64 %5, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write)
define void @implLHU(ptr noalias writeonly captures(none) initializes((0, 8)) %rd, ptr readonly captures(none) %rs1, i64 %imm) local_unnamed_addr #1 {
  %1 = add i64 %imm, 2048
  %2 = icmp ult i64 %1, 4096
  tail call void @llvm.assume(i1 %2)
  %rs1.v = load i64, ptr %rs1, align 8
  %3 = add i64 %rs1.v, %imm
  %4 = inttoptr i64 %3 to ptr
  %.v1 = load i16, ptr %4, align 2
  %5 = zext i16 %.v1 to i64
  store i64 %5, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write)
define void @implLWU(ptr noalias writeonly captures(none) initializes((0, 8)) %rd, ptr readonly captures(none) %rs1, i64 %imm) local_unnamed_addr #1 {
  %1 = add i64 %imm, 2048
  %2 = icmp ult i64 %1, 4096
  tail call void @llvm.assume(i1 %2)
  %rs1.v = load i64, ptr %rs1, align 8
  %3 = add i64 %rs1.v, %imm
  %4 = inttoptr i64 %3 to ptr
  %.v1 = load i32, ptr %4, align 4
  %5 = zext i32 %.v1 to i64
  store i64 %5, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite)
define void @implSB(ptr readonly captures(none) %rs1, ptr readonly captures(none) %rs2, i64 %imm) local_unnamed_addr #3 {
  %1 = add i64 %imm, 2048
  %2 = icmp ult i64 %1, 4096
  tail call void @llvm.assume(i1 %2)
  %rs1.v = load i64, ptr %rs1, align 8
  %3 = add i64 %rs1.v, %imm
  %4 = inttoptr i64 %3 to ptr
  %rs2.v = load i64, ptr %rs2, align 8
  %5 = trunc i64 %rs2.v to i8
  store i8 %5, ptr %4, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite)
define void @implSH(ptr readonly captures(none) %rs1, ptr readonly captures(none) %rs2, i64 %imm) local_unnamed_addr #3 {
  %1 = add i64 %imm, 2048
  %2 = icmp ult i64 %1, 4096
  tail call void @llvm.assume(i1 %2)
  %rs1.v = load i64, ptr %rs1, align 8
  %3 = add i64 %rs1.v, %imm
  %4 = inttoptr i64 %3 to ptr
  %rs2.v = load i64, ptr %rs2, align 8
  %5 = trunc i64 %rs2.v to i16
  store i16 %5, ptr %4, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite)
define void @implSW(ptr readonly captures(none) %rs1, ptr readonly captures(none) %rs2, i64 %imm) local_unnamed_addr #3 {
  %1 = add i64 %imm, 2048
  %2 = icmp ult i64 %1, 4096
  tail call void @llvm.assume(i1 %2)
  %rs1.v = load i64, ptr %rs1, align 8
  %3 = add i64 %rs1.v, %imm
  %4 = inttoptr i64 %3 to ptr
  %rs2.v = load i64, ptr %rs2, align 8
  %5 = trunc i64 %rs2.v to i32
  store i32 %5, ptr %4, align 4
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite) }
