; ModuleID = 'mod'
source_filename = "mod"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_SUBINCACC(ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr noalias nocapture %rd) local_unnamed_addr #0 {
  %rs1.v = load i64, ptr %rs1, align 8
  %rs2.v = load i64, ptr %rs2, align 8
  %rd.v = load i64, ptr %rd, align 8
  %1 = add i64 %rs1.v, 1
  %2 = sub i64 %1, %rs2.v
  %3 = add i64 %2, %rd.v
  store i64 %3, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implCV_MAXU(ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr noalias nocapture writeonly initializes((0, 8)) %rd) local_unnamed_addr #0 {
  %rs1.v = load i64, ptr %rs1, align 8
  %rs2.v = load i64, ptr %rs2, align 8
  %1 = tail call i64 @llvm.umax.i64(i64 %rs1.v, i64 %rs2.v)
  store i64 %1, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implNAND(ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr noalias nocapture writeonly initializes((0, 8)) %rd) local_unnamed_addr #0 {
  %rs1.v = load i64, ptr %rs1, align 8
  %rs2.v = load i64, ptr %rs2, align 8
  %1 = and i64 %rs2.v, %rs1.v
  %2 = xor i64 %1, -1
  store i64 %2, ptr %rd, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @implADD3(ptr nocapture readonly %rs2, ptr nocapture readonly %rs1, ptr noalias nocapture %rd) local_unnamed_addr #0 {
  %rs1.v = load i64, ptr %rs1, align 8
  %rs2.v = load i64, ptr %rs2, align 8
  %1 = add i64 %rs2.v, %rs1.v
  %rd.v = load i64, ptr %rd, align 8
  %2 = add i64 %1, %rd.v
  store i64 %2, ptr %rd, align 8
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
