; ModuleID = 'mod'
source_filename = "mod"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write)
define void @implLDR(i64 %imm, ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr noalias nocapture writeonly initializes((0, 8)) %rd) local_unnamed_addr #0 {
  %1 = icmp ult i64 %imm, 32
  tail call void @llvm.assume(i1 %1)
  %rs2.v = load i64, ptr %rs2, align 8
  %2 = shl i64 %rs2.v, %imm
  %rs1.v = load i64, ptr %rs1, align 8
  %3 = add i64 %rs1.v, %2
  %4 = inttoptr i64 %3 to ptr
  %.v1 = load i64, ptr %4, align 8
  store i64 %.v1, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite)
define void @implSTR(ptr nocapture readonly %rs3, ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, i64 %imm) local_unnamed_addr #2 {
  %1 = icmp ult i64 %imm, 32
  tail call void @llvm.assume(i1 %1)
  %rs2.v = load i64, ptr %rs2, align 8
  %2 = shl i64 %rs2.v, %imm
  %rs1.v = load i64, ptr %rs1, align 8
  %3 = add i64 %rs1.v, %2
  %4 = inttoptr i64 %3 to ptr
  %rs3.v = load i64, ptr %rs3, align 8
  store i64 %rs3.v, ptr %4, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @implLOADMAC(ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr noalias nocapture %rd) local_unnamed_addr #3 {
  %rs1.v = load i64, ptr %rs1, align 8
  %1 = inttoptr i64 %rs1.v to ptr
  %rs2.v = load i64, ptr %rs2, align 8
  %2 = inttoptr i64 %rs2.v to ptr
  %.v = load i64, ptr %1, align 8
  %.v1 = load i64, ptr %2, align 8
  %3 = mul i64 %.v1, %.v
  %rd.v = load i64, ptr %rd, align 8
  %4 = add i64 %rd.v, %3
  store i64 %4, ptr %rd, align 8
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
