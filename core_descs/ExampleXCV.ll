; ModuleID = 'mod'
source_filename = "mod"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_MAC(ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr noalias nocapture %rd) local_unnamed_addr #0 {
  %rs1.v = load i32, ptr %rs1, align 4
  %rs2.v = load i32, ptr %rs2, align 4
  %1 = mul i32 %rs2.v, %rs1.v
  %rd.v = load i32, ptr %rd, align 4
  %2 = add i32 %1, %rd.v
  store i32 %2, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_ABS(ptr nocapture readonly %rs1, ptr noalias nocapture writeonly initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %rs1.v = load i32, ptr %rs1, align 4
  %1 = tail call i32 @llvm.abs.i32(i32 %rs1.v, i1 false)
  store i32 %1, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write)
define void @implCV_ADDN(i32 %Luimm5, ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr noalias nocapture writeonly initializes((0, 4)) %rd) local_unnamed_addr #1 {
  %1 = icmp ult i32 %Luimm5, 32
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %rs2.v = load i32, ptr %rs2, align 4
  %2 = add i32 %rs2.v, %rs1.v
  %3 = ashr i32 %2, %Luimm5
  store i32 %3, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_ADD_H(ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr noalias nocapture writeonly initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %.v = load i16, ptr %rs1, align 2
  %.v1 = load i16, ptr %rs2, align 2
  %1 = add i16 %.v1, %.v
  store i16 %1, ptr %rd, align 2
  %2 = getelementptr i8, ptr %rd, i32 2
  %3 = getelementptr i8, ptr %rs1, i32 2
  %4 = getelementptr i8, ptr %rs2, i32 2
  %.v2 = load i16, ptr %3, align 2
  %.v3 = load i16, ptr %4, align 2
  %5 = add i16 %.v3, %.v2
  store i16 %5, ptr %2, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_ADD_SC_H(ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr noalias nocapture writeonly initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %.v = load i16, ptr %rs1, align 2
  %.v1 = load i16, ptr %rs2, align 2
  %1 = add i16 %.v1, %.v
  store i16 %1, ptr %rd, align 2
  %2 = getelementptr i8, ptr %rd, i32 2
  %3 = getelementptr i8, ptr %rs1, i32 2
  %.v2 = load i16, ptr %3, align 2
  %4 = add i16 %.v2, %.v1
  store i16 %4, ptr %2, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write)
define void @implCV_ADD_SCI_H(i32 %Imm6, ptr nocapture readonly %rs1, ptr noalias nocapture writeonly initializes((0, 4)) %rd) local_unnamed_addr #1 {
  %1 = icmp ult i32 %Imm6, 64
  tail call void @llvm.assume(i1 %1)
  %2 = trunc nuw nsw i32 %Imm6 to i16
  %.v = load i16, ptr %rs1, align 2
  %3 = add i16 %.v, %2
  store i16 %3, ptr %rd, align 2
  %4 = getelementptr i8, ptr %rd, i32 2
  %5 = getelementptr i8, ptr %rs1, i32 2
  %.v1 = load i16, ptr %5, align 2
  %6 = add i16 %.v1, %2
  store i16 %6, ptr %4, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_ADD_B(ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr noalias nocapture writeonly initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %.v = load i8, ptr %rs1, align 1
  %.v1 = load i8, ptr %rs2, align 1
  %1 = add i8 %.v1, %.v
  store i8 %1, ptr %rd, align 1
  %2 = getelementptr i8, ptr %rd, i32 1
  %3 = getelementptr i8, ptr %rs1, i32 1
  %4 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %3, align 1
  %.v3 = load i8, ptr %4, align 1
  %5 = add i8 %.v3, %.v2
  store i8 %5, ptr %2, align 1
  %6 = getelementptr i8, ptr %rd, i32 2
  %7 = getelementptr i8, ptr %rs1, i32 2
  %8 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %7, align 1
  %.v5 = load i8, ptr %8, align 1
  %9 = add i8 %.v5, %.v4
  store i8 %9, ptr %6, align 1
  %10 = getelementptr i8, ptr %rd, i32 3
  %11 = getelementptr i8, ptr %rs1, i32 3
  %12 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %11, align 1
  %.v7 = load i8, ptr %12, align 1
  %13 = add i8 %.v7, %.v6
  store i8 %13, ptr %10, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_ADD_SC_B(ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr noalias nocapture writeonly initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %.v = load i8, ptr %rs1, align 1
  %.v1 = load i8, ptr %rs2, align 1
  %1 = add i8 %.v1, %.v
  store i8 %1, ptr %rd, align 1
  %2 = getelementptr i8, ptr %rd, i32 1
  %3 = getelementptr i8, ptr %rs1, i32 1
  %.v2 = load i8, ptr %3, align 1
  %4 = add i8 %.v2, %.v1
  store i8 %4, ptr %2, align 1
  %5 = getelementptr i8, ptr %rd, i32 2
  %6 = getelementptr i8, ptr %rs1, i32 2
  %.v4 = load i8, ptr %6, align 1
  %7 = add i8 %.v4, %.v1
  store i8 %7, ptr %5, align 1
  %8 = getelementptr i8, ptr %rd, i32 3
  %9 = getelementptr i8, ptr %rs1, i32 3
  %.v6 = load i8, ptr %9, align 1
  %10 = add i8 %.v6, %.v1
  store i8 %10, ptr %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write)
define void @implCV_ADD_SCI_B(i32 %Imm6, ptr nocapture readonly %rs1, ptr noalias nocapture writeonly initializes((0, 4)) %rd) local_unnamed_addr #1 {
  %1 = icmp ult i32 %Imm6, 64
  tail call void @llvm.assume(i1 %1)
  %2 = trunc nuw nsw i32 %Imm6 to i8
  %.v = load i8, ptr %rs1, align 1
  %3 = add i8 %.v, %2
  store i8 %3, ptr %rd, align 1
  %4 = getelementptr i8, ptr %rd, i32 1
  %5 = getelementptr i8, ptr %rs1, i32 1
  %.v1 = load i8, ptr %5, align 1
  %6 = add i8 %.v1, %2
  store i8 %6, ptr %4, align 1
  %7 = getelementptr i8, ptr %rd, i32 2
  %8 = getelementptr i8, ptr %rs1, i32 2
  %.v2 = load i8, ptr %8, align 1
  %9 = add i8 %.v2, %2
  store i8 %9, ptr %7, align 1
  %10 = getelementptr i8, ptr %rd, i32 3
  %11 = getelementptr i8, ptr %rs1, i32 3
  %.v3 = load i8, ptr %11, align 1
  %12 = add i8 %.v3, %2
  store i8 %12, ptr %10, align 1
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
