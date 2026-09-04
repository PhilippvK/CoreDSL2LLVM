; ModuleID = 'mod'
source_filename = "mod"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implSEXT_BIT23(ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %rs1.v = load i32, ptr %rs1, align 4
  %1 = shl i32 %rs1.v, 8
  %sext = ashr i32 %1, 31
  store i32 %sext, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implZEXT_BIT23(ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %rs1.v = load i32, ptr %rs1, align 4
  %1 = lshr i32 %rs1.v, 23
  %.lobit = and i32 %1, 1
  store i32 %.lobit, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implZEXT_UNALIGNED_BYTE(ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %rs1.v = load i32, ptr %rs1, align 4
  %1 = lshr i32 %rs1.v, 11
  %2 = and i32 %1, 255
  store i32 %2, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implSEXT_UNALIGNED_BYTE(ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %rs1.v = load i32, ptr %rs1, align 4
  %1 = shl i32 %rs1.v, 13
  %2 = ashr i32 %1, 24
  store i32 %2, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implZEXT_ALIGNED_WORD(ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %1 = getelementptr i8, ptr %rs1, i32 2
  %.v = load i16, ptr %1, align 2
  %2 = zext i16 %.v to i32
  store i32 %2, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implSEXT_ALIGNED_WORD(ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #0 {
  %1 = getelementptr i8, ptr %rs1, i32 2
  %.v = load i16, ptr %1, align 2
  %2 = sext i16 %.v to i32
  store i32 %2, ptr %rd, align 4
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
