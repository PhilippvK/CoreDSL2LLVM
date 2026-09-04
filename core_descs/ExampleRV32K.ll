; ModuleID = 'mod'
source_filename = "mod"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @implK_LLI(i32 %imm, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #0 {
  store i32 %imm, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write)
define void @implK_ADDI(i32 %imm, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #2 {
  %1 = icmp ult i32 %imm, 16777216
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %2 = add i32 %rs1.v, %imm
  store i32 %2, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write)
define void @implK_ANDI(i32 %imm, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #2 {
  %1 = icmp ult i32 %imm, 16777216
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %2 = and i32 %rs1.v, %imm
  store i32 %2, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write)
define void @implK_XORI(i32 %imm, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #2 {
  %1 = icmp ult i32 %imm, 16777216
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %2 = xor i32 %rs1.v, %imm
  store i32 %2, ptr %rd, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write)
define void @implK_ORI(i32 %imm, ptr readonly captures(none) %rs1, ptr noalias writeonly captures(none) initializes((0, 4)) %rd) local_unnamed_addr #2 {
  %1 = icmp ult i32 %imm, 16777216
  tail call void @llvm.assume(i1 %1)
  %rs1.v = load i32, ptr %rs1, align 4
  %2 = or i32 %rs1.v, %imm
  store i32 %2, ptr %rd, align 4
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: write) }
