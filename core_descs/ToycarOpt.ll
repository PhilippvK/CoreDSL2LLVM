; ModuleID = 'mod'
source_filename = "mod"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: readwrite)
define void @implMAC_LD_X2_n2(ptr nocapture %rd2, ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr nocapture %rd) local_unnamed_addr #0 {
  %rs2.val = load i32, ptr %rs2, align 4
  %rs1.val = load i32, ptr %rs1, align 4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !0)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !3)
  %1 = add i32 %rs2.val, -8
  %2 = inttoptr i32 %1 to ptr
  %.v.i = load i16, ptr %2, align 2, !noalias !5
  %3 = sext i16 %.v.i to i32
  %4 = mul i32 %rs1.val, %3
  %rd.v.i = load i32, ptr %rd, align 4, !alias.scope !3, !noalias !0
  %5 = add i32 %4, %rd.v.i
  store i32 %5, ptr %rd, align 4, !alias.scope !3, !noalias !0
  %narrow.i = add i32 %rs2.val, -6
  %6 = inttoptr i32 %narrow.i to ptr
  %.v2.i = load i16, ptr %6, align 2, !noalias !5
  %7 = sext i16 %.v2.i to i32
  %8 = mul i32 %rs1.val, %7
  %rd2.v.i = load i32, ptr %rd2, align 4, !alias.scope !0, !noalias !3
  %9 = add i32 %8, %rd2.v.i
  store i32 %9, ptr %rd2, align 4, !alias.scope !0, !noalias !3
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: readwrite)
define void @implMAC_LD_X2_n1(ptr nocapture %rd2, ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr nocapture %rd) local_unnamed_addr #0 {
  %rs2.val = load i32, ptr %rs2, align 4
  %rs1.val = load i32, ptr %rs1, align 4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !6)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !9)
  %1 = add i32 %rs2.val, -4
  %2 = inttoptr i32 %1 to ptr
  %.v.i = load i16, ptr %2, align 2, !noalias !11
  %3 = sext i16 %.v.i to i32
  %4 = mul i32 %rs1.val, %3
  %rd.v.i = load i32, ptr %rd, align 4, !alias.scope !9, !noalias !6
  %5 = add i32 %4, %rd.v.i
  store i32 %5, ptr %rd, align 4, !alias.scope !9, !noalias !6
  %narrow.i = add i32 %rs2.val, -2
  %6 = inttoptr i32 %narrow.i to ptr
  %.v2.i = load i16, ptr %6, align 2, !noalias !11
  %7 = sext i16 %.v2.i to i32
  %8 = mul i32 %rs1.val, %7
  %rd2.v.i = load i32, ptr %rd2, align 4, !alias.scope !6, !noalias !9
  %9 = add i32 %8, %rd2.v.i
  store i32 %9, ptr %rd2, align 4, !alias.scope !6, !noalias !9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: readwrite)
define void @implMAC_LD_X2_0(ptr nocapture %rd2, ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr nocapture %rd) local_unnamed_addr #0 {
  %rs2.val = load i32, ptr %rs2, align 4
  %rs1.val = load i32, ptr %rs1, align 4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !12)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !15)
  %1 = inttoptr i32 %rs2.val to ptr
  %.v.i = load i16, ptr %1, align 2, !noalias !17
  %2 = sext i16 %.v.i to i32
  %3 = mul i32 %rs1.val, %2
  %rd.v.i = load i32, ptr %rd, align 4, !alias.scope !15, !noalias !12
  %4 = add i32 %3, %rd.v.i
  store i32 %4, ptr %rd, align 4, !alias.scope !15, !noalias !12
  %narrow.i = add i32 %rs2.val, 2
  %5 = inttoptr i32 %narrow.i to ptr
  %.v2.i = load i16, ptr %5, align 2, !noalias !17
  %6 = sext i16 %.v2.i to i32
  %7 = mul i32 %rs1.val, %6
  %rd2.v.i = load i32, ptr %rd2, align 4, !alias.scope !12, !noalias !15
  %8 = add i32 %7, %rd2.v.i
  store i32 %8, ptr %rd2, align 4, !alias.scope !12, !noalias !15
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: readwrite)
define void @implMAC_LD_X2_1(ptr nocapture %rd2, ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr nocapture %rd) local_unnamed_addr #0 {
  %rs2.val = load i32, ptr %rs2, align 4
  %rs1.val = load i32, ptr %rs1, align 4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !18)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !21)
  %1 = add i32 %rs2.val, 4
  %2 = inttoptr i32 %1 to ptr
  %.v.i = load i16, ptr %2, align 2, !noalias !23
  %3 = sext i16 %.v.i to i32
  %4 = mul i32 %rs1.val, %3
  %rd.v.i = load i32, ptr %rd, align 4, !alias.scope !21, !noalias !18
  %5 = add i32 %4, %rd.v.i
  store i32 %5, ptr %rd, align 4, !alias.scope !21, !noalias !18
  %narrow.i = add i32 %rs2.val, 6
  %6 = inttoptr i32 %narrow.i to ptr
  %.v2.i = load i16, ptr %6, align 2, !noalias !23
  %7 = sext i16 %.v2.i to i32
  %8 = mul i32 %rs1.val, %7
  %rd2.v.i = load i32, ptr %rd2, align 4, !alias.scope !18, !noalias !21
  %9 = add i32 %8, %rd2.v.i
  store i32 %9, ptr %rd2, align 4, !alias.scope !18, !noalias !21
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: readwrite) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!0 = !{!1}
!1 = distinct !{!1, !2, !"implMAC_LD_X2: %rd2"}
!2 = distinct !{!2, !"implMAC_LD_X2"}
!3 = !{!4}
!4 = distinct !{!4, !2, !"implMAC_LD_X2: %rd"}
!5 = !{!1, !4}
!6 = !{!7}
!7 = distinct !{!7, !8, !"implMAC_LD_X2: %rd2"}
!8 = distinct !{!8, !"implMAC_LD_X2"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"implMAC_LD_X2: %rd"}
!11 = !{!7, !10}
!12 = !{!13}
!13 = distinct !{!13, !14, !"implMAC_LD_X2: %rd2"}
!14 = distinct !{!14, !"implMAC_LD_X2"}
!15 = !{!16}
!16 = distinct !{!16, !14, !"implMAC_LD_X2: %rd"}
!17 = !{!13, !16}
!18 = !{!19}
!19 = distinct !{!19, !20, !"implMAC_LD_X2: %rd2"}
!20 = distinct !{!20, !"implMAC_LD_X2"}
!21 = !{!22}
!22 = distinct !{!22, !20, !"implMAC_LD_X2: %rd"}
!23 = !{!19, !22}
