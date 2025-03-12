; ModuleID = 'mod'
source_filename = "mod"

define void @implCV_ADD_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %20

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = zext i16 %.v to i17
  %6 = zext i16 %.v1 to i17
  %7 = add i17 %5, %6
  %8 = lshr i17 %7, 0
  %9 = and i17 %8, 65535
  %10 = trunc i17 %9 to i16
  store i16 %10, ptr %2, align 2
  %11 = getelementptr i16, ptr %rd, i32 1
  %12 = getelementptr i16, ptr %rs1, i32 1
  %13 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %12, align 2
  %.v3 = load i16, ptr %13, align 2
  %14 = zext i16 %.v2 to i17
  %15 = zext i16 %.v3 to i17
  %16 = add i17 %14, %15
  %17 = lshr i17 %16, 0
  %18 = and i17 %17, 65535
  %19 = trunc i17 %18 to i16
  store i16 %19, ptr %11, align 2
  br label %20

20:                                               ; preds = %1, %0
  ret void
}

define void @implCV_ADD_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %20

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = zext i16 %.v to i17
  %6 = zext i16 %.v1 to i17
  %7 = add i17 %5, %6
  %8 = lshr i17 %7, 0
  %9 = and i17 %8, 65535
  %10 = trunc i17 %9 to i16
  store i16 %10, ptr %2, align 2
  %11 = getelementptr i16, ptr %rd, i32 1
  %12 = getelementptr i16, ptr %rs1, i32 1
  %13 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %12, align 2
  %.v3 = load i16, ptr %13, align 2
  %14 = zext i16 %.v2 to i17
  %15 = zext i16 %.v3 to i17
  %16 = add i17 %14, %15
  %17 = lshr i17 %16, 0
  %18 = and i17 %17, 65535
  %19 = trunc i17 %18 to i16
  store i16 %19, ptr %11, align 2
  br label %20

20:                                               ; preds = %1, %0
  ret void
}

define void @implCV_ADD_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %22

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rd, i32 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %5, align 2
  %7 = zext i16 %.v to i17
  %8 = zext i16 %6 to i17
  %9 = add i17 %7, %8
  %10 = lshr i17 %9, 0
  %11 = and i17 %10, 65535
  %12 = trunc i17 %11 to i16
  store i16 %12, ptr %4, align 2
  %13 = getelementptr i16, ptr %rd, i32 1
  %14 = getelementptr i16, ptr %rs1, i32 1
  %15 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %14, align 2
  %16 = zext i16 %.v1 to i17
  %17 = zext i16 %15 to i17
  %18 = add i17 %16, %17
  %19 = lshr i17 %18, 0
  %20 = and i17 %19, 65535
  %21 = trunc i17 %20 to i16
  store i16 %21, ptr %13, align 2
  br label %22

22:                                               ; preds = %3, %0
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #0

define void @implCV_ADD_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %38

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = zext i8 %.v to i9
  %6 = zext i8 %.v1 to i9
  %7 = add i9 %5, %6
  %8 = lshr i9 %7, 0
  %9 = and i9 %8, 255
  %10 = trunc i9 %9 to i8
  store i8 %10, ptr %2, align 1
  %11 = getelementptr i8, ptr %rd, i32 1
  %12 = getelementptr i8, ptr %rs1, i32 1
  %13 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %12, align 1
  %.v3 = load i8, ptr %13, align 1
  %14 = zext i8 %.v2 to i9
  %15 = zext i8 %.v3 to i9
  %16 = add i9 %14, %15
  %17 = lshr i9 %16, 0
  %18 = and i9 %17, 255
  %19 = trunc i9 %18 to i8
  store i8 %19, ptr %11, align 1
  %20 = getelementptr i8, ptr %rd, i32 2
  %21 = getelementptr i8, ptr %rs1, i32 2
  %22 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %21, align 1
  %.v5 = load i8, ptr %22, align 1
  %23 = zext i8 %.v4 to i9
  %24 = zext i8 %.v5 to i9
  %25 = add i9 %23, %24
  %26 = lshr i9 %25, 0
  %27 = and i9 %26, 255
  %28 = trunc i9 %27 to i8
  store i8 %28, ptr %20, align 1
  %29 = getelementptr i8, ptr %rd, i32 3
  %30 = getelementptr i8, ptr %rs1, i32 3
  %31 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %30, align 1
  %.v7 = load i8, ptr %31, align 1
  %32 = zext i8 %.v6 to i9
  %33 = zext i8 %.v7 to i9
  %34 = add i9 %32, %33
  %35 = lshr i9 %34, 0
  %36 = and i9 %35, 255
  %37 = trunc i9 %36 to i8
  store i8 %37, ptr %29, align 1
  br label %38

38:                                               ; preds = %1, %0
  ret void
}

define void @implCV_ADD_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %38

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = zext i8 %.v to i9
  %6 = zext i8 %.v1 to i9
  %7 = add i9 %5, %6
  %8 = lshr i9 %7, 0
  %9 = and i9 %8, 255
  %10 = trunc i9 %9 to i8
  store i8 %10, ptr %2, align 1
  %11 = getelementptr i8, ptr %rd, i32 1
  %12 = getelementptr i8, ptr %rs1, i32 1
  %13 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %12, align 1
  %.v3 = load i8, ptr %13, align 1
  %14 = zext i8 %.v2 to i9
  %15 = zext i8 %.v3 to i9
  %16 = add i9 %14, %15
  %17 = lshr i9 %16, 0
  %18 = and i9 %17, 255
  %19 = trunc i9 %18 to i8
  store i8 %19, ptr %11, align 1
  %20 = getelementptr i8, ptr %rd, i32 2
  %21 = getelementptr i8, ptr %rs1, i32 2
  %22 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %21, align 1
  %.v5 = load i8, ptr %22, align 1
  %23 = zext i8 %.v4 to i9
  %24 = zext i8 %.v5 to i9
  %25 = add i9 %23, %24
  %26 = lshr i9 %25, 0
  %27 = and i9 %26, 255
  %28 = trunc i9 %27 to i8
  store i8 %28, ptr %20, align 1
  %29 = getelementptr i8, ptr %rd, i32 3
  %30 = getelementptr i8, ptr %rs1, i32 3
  %31 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %30, align 1
  %.v7 = load i8, ptr %31, align 1
  %32 = zext i8 %.v6 to i9
  %33 = zext i8 %.v7 to i9
  %34 = add i9 %32, %33
  %35 = lshr i9 %34, 0
  %36 = and i9 %35, 255
  %37 = trunc i9 %36 to i8
  store i8 %37, ptr %29, align 1
  br label %38

38:                                               ; preds = %1, %0
  ret void
}

define void @implCV_ADD_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %40

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rd, i32 0
  %5 = getelementptr i8, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %5, align 1
  %7 = zext i8 %.v to i9
  %8 = zext i8 %6 to i9
  %9 = add i9 %7, %8
  %10 = lshr i9 %9, 0
  %11 = and i9 %10, 255
  %12 = trunc i9 %11 to i8
  store i8 %12, ptr %4, align 1
  %13 = getelementptr i8, ptr %rd, i32 1
  %14 = getelementptr i8, ptr %rs1, i32 1
  %15 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %14, align 1
  %16 = zext i8 %.v1 to i9
  %17 = zext i8 %15 to i9
  %18 = add i9 %16, %17
  %19 = lshr i9 %18, 0
  %20 = and i9 %19, 255
  %21 = trunc i9 %20 to i8
  store i8 %21, ptr %13, align 1
  %22 = getelementptr i8, ptr %rd, i32 2
  %23 = getelementptr i8, ptr %rs1, i32 2
  %24 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %23, align 1
  %25 = zext i8 %.v2 to i9
  %26 = zext i8 %24 to i9
  %27 = add i9 %25, %26
  %28 = lshr i9 %27, 0
  %29 = and i9 %28, 255
  %30 = trunc i9 %29 to i8
  store i8 %30, ptr %22, align 1
  %31 = getelementptr i8, ptr %rd, i32 3
  %32 = getelementptr i8, ptr %rs1, i32 3
  %33 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %32, align 1
  %34 = zext i8 %.v3 to i9
  %35 = zext i8 %33 to i9
  %36 = add i9 %34, %35
  %37 = lshr i9 %36, 0
  %38 = and i9 %37, 255
  %39 = trunc i9 %38 to i8
  store i8 %39, ptr %31, align 1
  br label %40

40:                                               ; preds = %3, %0
  ret void
}

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

