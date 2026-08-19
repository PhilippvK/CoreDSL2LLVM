; ModuleID = 'mod'
source_filename = "mod"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_MAC(ptr readonly captures(none) %rs2, ptr readonly captures(none) %rs1, ptr noalias captures(none) %rd) local_unnamed_addr #0 {
  %rs1.v = load i32, ptr %rs1, align 4
  %rs2.v = load i32, ptr %rs2, align 4
  %1 = mul i32 %rs2.v, %rs1.v
  %rd.v = load i32, ptr %rd, align 4
  %2 = add i32 %1, %rd.v
  store i32 %2, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_ABS(ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %rs1.v = load i32, ptr %rs1, align 4
  %1 = tail call i32 @llvm.abs.i32(i32 %rs1.v, i1 false)
  store i32 %1, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write)
define void @implCV_ADDN(i32 %Luimm5, ptr readonly captures(none) %rs2, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #1 {
  %1 = icmp ult i32 %Luimm5, 32
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %rs2.v = load i32, ptr %rs2, align 4
  %2 = zext i32 %rs1.v to i33
  %3 = zext i32 %rs2.v to i33
  %4 = add nuw i33 %3, %2
  %5 = zext nneg i32 %Luimm5 to i33
  %6 = ashr i33 %4, %5
  %7 = trunc i33 %6 to i32
  store i32 %7, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_ADD_H(ptr readonly captures(none) %rs2, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %.v = load i16, ptr %rs1, align 2
  %.v1 = load i16, ptr %rs2, align 2
  %.narrow = add i16 %.v1, %.v
  store i16 %.narrow, ptr %rd, align 2
  %1 = getelementptr i8, ptr %rd, i32 2
  %2 = getelementptr i8, ptr %rs1, i32 2
  %3 = getelementptr i8, ptr %rs2, i32 2
  %.v2 = load i16, ptr %2, align 2
  %.v3 = load i16, ptr %3, align 2
  %.narrow4 = add i16 %.v3, %.v2
  store i16 %.narrow4, ptr %1, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_ADD_SC_H(ptr readonly captures(none) %rs2, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %.v = load i16, ptr %rs1, align 2
  %.v1 = load i16, ptr %rs2, align 2
  %.narrow = add i16 %.v1, %.v
  store i16 %.narrow, ptr %rd, align 2
  %1 = getelementptr i8, ptr %rd, i32 2
  %2 = getelementptr i8, ptr %rs1, i32 2
  %.v2 = load i16, ptr %2, align 2
  %.narrow4 = add i16 %.v2, %.v1
  store i16 %.narrow4, ptr %1, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write)
define void @implCV_ADD_SCI_H(i32 %Imm6, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #1 {
  %1 = icmp ult i32 %Imm6, 64
  tail call void @llvm.assume(i1 %1)
  %.v = load i16, ptr %rs1, align 2
  %.tr = trunc nuw nsw i32 %Imm6 to i16
  %.narrow = add i16 %.v, %.tr
  store i16 %.narrow, ptr %rd, align 2
  %2 = getelementptr i8, ptr %rd, i32 2
  %3 = getelementptr i8, ptr %rs1, i32 2
  %.v1 = load i16, ptr %3, align 2
  %.narrow3 = add i16 %.v1, %.tr
  store i16 %.narrow3, ptr %2, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_ADD_B(ptr readonly captures(none) %rs2, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %.v = load i8, ptr %rs1, align 1
  %.v1 = load i8, ptr %rs2, align 1
  %.narrow = add i8 %.v1, %.v
  store i8 %.narrow, ptr %rd, align 1
  %1 = getelementptr i8, ptr %rd, i32 1
  %2 = getelementptr i8, ptr %rs1, i32 1
  %3 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %2, align 1
  %.v3 = load i8, ptr %3, align 1
  %.narrow8 = add i8 %.v3, %.v2
  store i8 %.narrow8, ptr %1, align 1
  %4 = getelementptr i8, ptr %rd, i32 2
  %5 = getelementptr i8, ptr %rs1, i32 2
  %6 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %5, align 1
  %.v5 = load i8, ptr %6, align 1
  %.narrow9 = add i8 %.v5, %.v4
  store i8 %.narrow9, ptr %4, align 1
  %7 = getelementptr i8, ptr %rd, i32 3
  %8 = getelementptr i8, ptr %rs1, i32 3
  %9 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %8, align 1
  %.v7 = load i8, ptr %9, align 1
  %.narrow10 = add i8 %.v7, %.v6
  store i8 %.narrow10, ptr %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_ADD_SC_B(ptr readonly captures(none) %rs2, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %.v = load i8, ptr %rs1, align 1
  %.v1 = load i8, ptr %rs2, align 1
  %.narrow = add i8 %.v1, %.v
  store i8 %.narrow, ptr %rd, align 1
  %1 = getelementptr i8, ptr %rd, i32 1
  %2 = getelementptr i8, ptr %rs1, i32 1
  %.v2 = load i8, ptr %2, align 1
  %.narrow8 = add i8 %.v2, %.v1
  store i8 %.narrow8, ptr %1, align 1
  %3 = getelementptr i8, ptr %rd, i32 2
  %4 = getelementptr i8, ptr %rs1, i32 2
  %.v4 = load i8, ptr %4, align 1
  %.narrow9 = add i8 %.v4, %.v1
  store i8 %.narrow9, ptr %3, align 1
  %5 = getelementptr i8, ptr %rd, i32 3
  %6 = getelementptr i8, ptr %rs1, i32 3
  %.v6 = load i8, ptr %6, align 1
  %.narrow10 = add i8 %.v6, %.v1
  store i8 %.narrow10, ptr %5, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write)
define void @implCV_ADD_SCI_B(i32 %Imm6, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #1 {
  %1 = icmp ult i32 %Imm6, 64
  tail call void @llvm.assume(i1 %1)
  %.v = load i8, ptr %rs1, align 1
  %.tr = trunc nuw nsw i32 %Imm6 to i8
  %.narrow = add i8 %.v, %.tr
  store i8 %.narrow, ptr %rd, align 1
  %2 = getelementptr i8, ptr %rd, i32 1
  %3 = getelementptr i8, ptr %rs1, i32 1
  %.v1 = load i8, ptr %3, align 1
  %.narrow5 = add i8 %.v1, %.tr
  store i8 %.narrow5, ptr %2, align 1
  %4 = getelementptr i8, ptr %rd, i32 2
  %5 = getelementptr i8, ptr %rs1, i32 2
  %.v2 = load i8, ptr %5, align 1
  %.narrow7 = add i8 %.v2, %.tr
  store i8 %.narrow7, ptr %4, align 1
  %6 = getelementptr i8, ptr %rd, i32 3
  %7 = getelementptr i8, ptr %rs1, i32 3
  %.v3 = load i8, ptr %7, align 1
  %.narrow9 = add i8 %.v3, %.tr
  store i8 %.narrow9, ptr %6, align 1
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
