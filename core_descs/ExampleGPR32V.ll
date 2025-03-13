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

define void @implCV_SUB_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %20

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = zext i16 %.v to i17
  %6 = zext i16 %.v1 to i17
  %7 = sub i17 %5, %6
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
  %16 = sub i17 %14, %15
  %17 = lshr i17 %16, 0
  %18 = and i17 %17, 65535
  %19 = trunc i17 %18 to i16
  store i16 %19, ptr %11, align 2
  br label %20

20:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SUB_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %20

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = zext i16 %.v to i17
  %6 = zext i16 %.v1 to i17
  %7 = sub i17 %5, %6
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
  %16 = sub i17 %14, %15
  %17 = lshr i17 %16, 0
  %18 = and i17 %17, 65535
  %19 = trunc i17 %18 to i16
  store i16 %19, ptr %11, align 2
  br label %20

20:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SUB_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
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
  %9 = sub i17 %7, %8
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
  %18 = sub i17 %16, %17
  %19 = lshr i17 %18, 0
  %20 = and i17 %19, 65535
  %21 = trunc i17 %20 to i16
  store i16 %21, ptr %13, align 2
  br label %22

22:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SUB_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %38

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = zext i8 %.v to i9
  %6 = zext i8 %.v1 to i9
  %7 = sub i9 %5, %6
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
  %16 = sub i9 %14, %15
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
  %25 = sub i9 %23, %24
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
  %34 = sub i9 %32, %33
  %35 = lshr i9 %34, 0
  %36 = and i9 %35, 255
  %37 = trunc i9 %36 to i8
  store i8 %37, ptr %29, align 1
  br label %38

38:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SUB_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %38

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = zext i8 %.v to i9
  %6 = zext i8 %.v1 to i9
  %7 = sub i9 %5, %6
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
  %16 = sub i9 %14, %15
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
  %25 = sub i9 %23, %24
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
  %34 = sub i9 %32, %33
  %35 = lshr i9 %34, 0
  %36 = and i9 %35, 255
  %37 = trunc i9 %36 to i8
  store i8 %37, ptr %29, align 1
  br label %38

38:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SUB_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
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
  %9 = sub i9 %7, %8
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
  %18 = sub i9 %16, %17
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
  %27 = sub i9 %25, %26
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
  %36 = sub i9 %34, %35
  %37 = lshr i9 %36, 0
  %38 = and i9 %37, 255
  %39 = trunc i9 %38 to i8
  store i8 %39, ptr %31, align 1
  br label %40

40:                                               ; preds = %3, %0
  ret void
}

define void @implCV_MIN_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = icmp slt i16 %.v, %.v1
  %6 = getelementptr i16, ptr %rs1, i32 0
  %7 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %6, align 2
  %.v3 = load i16, ptr %7, align 2
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i16 %.v2, i16 %.v3
  store i16 %9, ptr %2, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = getelementptr i16, ptr %rs2, i32 1
  %.v4 = load i16, ptr %11, align 2
  %.v5 = load i16, ptr %12, align 2
  %13 = icmp slt i16 %.v4, %.v5
  %14 = getelementptr i16, ptr %rs1, i32 1
  %15 = getelementptr i16, ptr %rs2, i32 1
  %.v6 = load i16, ptr %14, align 2
  %.v7 = load i16, ptr %15, align 2
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i16 %.v6, i16 %.v7
  store i16 %17, ptr %10, align 2
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MIN_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = icmp slt i16 %.v, %.v1
  %6 = getelementptr i16, ptr %rs1, i32 0
  %7 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %6, align 2
  %.v3 = load i16, ptr %7, align 2
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i16 %.v2, i16 %.v3
  store i16 %9, ptr %2, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = getelementptr i16, ptr %rs2, i32 0
  %.v4 = load i16, ptr %11, align 2
  %.v5 = load i16, ptr %12, align 2
  %13 = icmp slt i16 %.v4, %.v5
  %14 = getelementptr i16, ptr %rs1, i32 1
  %15 = getelementptr i16, ptr %rs2, i32 0
  %.v6 = load i16, ptr %14, align 2
  %.v7 = load i16, ptr %15, align 2
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i16 %.v6, i16 %.v7
  store i16 %17, ptr %10, align 2
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MIN_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %20

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rd, i32 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %5, align 2
  %7 = icmp slt i16 %.v, %6
  %8 = getelementptr i16, ptr %rs1, i32 0
  %9 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %8, align 2
  %10 = icmp ne i1 %7, false
  %11 = select i1 %10, i16 %.v1, i16 %9
  store i16 %11, ptr %4, align 2
  %12 = getelementptr i16, ptr %rd, i32 1
  %13 = getelementptr i16, ptr %rs1, i32 1
  %14 = trunc i32 %Imm6 to i16
  %.v2 = load i16, ptr %13, align 2
  %15 = icmp slt i16 %.v2, %14
  %16 = getelementptr i16, ptr %rs1, i32 1
  %17 = trunc i32 %Imm6 to i16
  %.v3 = load i16, ptr %16, align 2
  %18 = icmp ne i1 %15, false
  %19 = select i1 %18, i16 %.v3, i16 %17
  store i16 %19, ptr %12, align 2
  br label %20

20:                                               ; preds = %3, %0
  ret void
}

define void @implCV_MIN_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %34

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = icmp slt i8 %.v, %.v1
  %6 = getelementptr i8, ptr %rs1, i32 0
  %7 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %6, align 1
  %.v3 = load i8, ptr %7, align 1
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i8 %.v2, i8 %.v3
  store i8 %9, ptr %2, align 1
  %10 = getelementptr i8, ptr %rd, i32 1
  %11 = getelementptr i8, ptr %rs1, i32 1
  %12 = getelementptr i8, ptr %rs2, i32 1
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = icmp slt i8 %.v4, %.v5
  %14 = getelementptr i8, ptr %rs1, i32 1
  %15 = getelementptr i8, ptr %rs2, i32 1
  %.v6 = load i8, ptr %14, align 1
  %.v7 = load i8, ptr %15, align 1
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i8 %.v6, i8 %.v7
  store i8 %17, ptr %10, align 1
  %18 = getelementptr i8, ptr %rd, i32 2
  %19 = getelementptr i8, ptr %rs1, i32 2
  %20 = getelementptr i8, ptr %rs2, i32 2
  %.v8 = load i8, ptr %19, align 1
  %.v9 = load i8, ptr %20, align 1
  %21 = icmp slt i8 %.v8, %.v9
  %22 = getelementptr i8, ptr %rs1, i32 2
  %23 = getelementptr i8, ptr %rs2, i32 2
  %.v10 = load i8, ptr %22, align 1
  %.v11 = load i8, ptr %23, align 1
  %24 = icmp ne i1 %21, false
  %25 = select i1 %24, i8 %.v10, i8 %.v11
  store i8 %25, ptr %18, align 1
  %26 = getelementptr i8, ptr %rd, i32 3
  %27 = getelementptr i8, ptr %rs1, i32 3
  %28 = getelementptr i8, ptr %rs2, i32 3
  %.v12 = load i8, ptr %27, align 1
  %.v13 = load i8, ptr %28, align 1
  %29 = icmp slt i8 %.v12, %.v13
  %30 = getelementptr i8, ptr %rs1, i32 3
  %31 = getelementptr i8, ptr %rs2, i32 3
  %.v14 = load i8, ptr %30, align 1
  %.v15 = load i8, ptr %31, align 1
  %32 = icmp ne i1 %29, false
  %33 = select i1 %32, i8 %.v14, i8 %.v15
  store i8 %33, ptr %26, align 1
  br label %34

34:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MIN_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %34

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = icmp slt i8 %.v, %.v1
  %6 = getelementptr i8, ptr %rs1, i32 0
  %7 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %6, align 1
  %.v3 = load i8, ptr %7, align 1
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i8 %.v2, i8 %.v3
  store i8 %9, ptr %2, align 1
  %10 = getelementptr i8, ptr %rd, i32 1
  %11 = getelementptr i8, ptr %rs1, i32 1
  %12 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = icmp slt i8 %.v4, %.v5
  %14 = getelementptr i8, ptr %rs1, i32 1
  %15 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %14, align 1
  %.v7 = load i8, ptr %15, align 1
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i8 %.v6, i8 %.v7
  store i8 %17, ptr %10, align 1
  %18 = getelementptr i8, ptr %rd, i32 2
  %19 = getelementptr i8, ptr %rs1, i32 2
  %20 = getelementptr i8, ptr %rs2, i32 0
  %.v8 = load i8, ptr %19, align 1
  %.v9 = load i8, ptr %20, align 1
  %21 = icmp slt i8 %.v8, %.v9
  %22 = getelementptr i8, ptr %rs1, i32 2
  %23 = getelementptr i8, ptr %rs2, i32 0
  %.v10 = load i8, ptr %22, align 1
  %.v11 = load i8, ptr %23, align 1
  %24 = icmp ne i1 %21, false
  %25 = select i1 %24, i8 %.v10, i8 %.v11
  store i8 %25, ptr %18, align 1
  %26 = getelementptr i8, ptr %rd, i32 3
  %27 = getelementptr i8, ptr %rs1, i32 3
  %28 = getelementptr i8, ptr %rs2, i32 0
  %.v12 = load i8, ptr %27, align 1
  %.v13 = load i8, ptr %28, align 1
  %29 = icmp slt i8 %.v12, %.v13
  %30 = getelementptr i8, ptr %rs1, i32 3
  %31 = getelementptr i8, ptr %rs2, i32 0
  %.v14 = load i8, ptr %30, align 1
  %.v15 = load i8, ptr %31, align 1
  %32 = icmp ne i1 %29, false
  %33 = select i1 %32, i8 %.v14, i8 %.v15
  store i8 %33, ptr %26, align 1
  br label %34

34:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MIN_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %36

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rd, i32 0
  %5 = getelementptr i8, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %5, align 1
  %7 = icmp slt i8 %.v, %6
  %8 = getelementptr i8, ptr %rs1, i32 0
  %9 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %8, align 1
  %10 = icmp ne i1 %7, false
  %11 = select i1 %10, i8 %.v1, i8 %9
  store i8 %11, ptr %4, align 1
  %12 = getelementptr i8, ptr %rd, i32 1
  %13 = getelementptr i8, ptr %rs1, i32 1
  %14 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %13, align 1
  %15 = icmp slt i8 %.v2, %14
  %16 = getelementptr i8, ptr %rs1, i32 1
  %17 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %16, align 1
  %18 = icmp ne i1 %15, false
  %19 = select i1 %18, i8 %.v3, i8 %17
  store i8 %19, ptr %12, align 1
  %20 = getelementptr i8, ptr %rd, i32 2
  %21 = getelementptr i8, ptr %rs1, i32 2
  %22 = trunc i32 %Imm6 to i8
  %.v4 = load i8, ptr %21, align 1
  %23 = icmp slt i8 %.v4, %22
  %24 = getelementptr i8, ptr %rs1, i32 2
  %25 = trunc i32 %Imm6 to i8
  %.v5 = load i8, ptr %24, align 1
  %26 = icmp ne i1 %23, false
  %27 = select i1 %26, i8 %.v5, i8 %25
  store i8 %27, ptr %20, align 1
  %28 = getelementptr i8, ptr %rd, i32 3
  %29 = getelementptr i8, ptr %rs1, i32 3
  %30 = trunc i32 %Imm6 to i8
  %.v6 = load i8, ptr %29, align 1
  %31 = icmp slt i8 %.v6, %30
  %32 = getelementptr i8, ptr %rs1, i32 3
  %33 = trunc i32 %Imm6 to i8
  %.v7 = load i8, ptr %32, align 1
  %34 = icmp ne i1 %31, false
  %35 = select i1 %34, i8 %.v7, i8 %33
  store i8 %35, ptr %28, align 1
  br label %36

36:                                               ; preds = %3, %0
  ret void
}

define void @implCV_MINU_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = icmp ult i16 %.v, %.v1
  %6 = getelementptr i16, ptr %rs1, i32 0
  %7 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %6, align 2
  %.v3 = load i16, ptr %7, align 2
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i16 %.v2, i16 %.v3
  store i16 %9, ptr %2, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = getelementptr i16, ptr %rs2, i32 1
  %.v4 = load i16, ptr %11, align 2
  %.v5 = load i16, ptr %12, align 2
  %13 = icmp ult i16 %.v4, %.v5
  %14 = getelementptr i16, ptr %rs1, i32 1
  %15 = getelementptr i16, ptr %rs2, i32 1
  %.v6 = load i16, ptr %14, align 2
  %.v7 = load i16, ptr %15, align 2
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i16 %.v6, i16 %.v7
  store i16 %17, ptr %10, align 2
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MINU_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = icmp ult i16 %.v, %.v1
  %6 = getelementptr i16, ptr %rs1, i32 0
  %7 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %6, align 2
  %.v3 = load i16, ptr %7, align 2
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i16 %.v2, i16 %.v3
  store i16 %9, ptr %2, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = getelementptr i16, ptr %rs2, i32 0
  %.v4 = load i16, ptr %11, align 2
  %.v5 = load i16, ptr %12, align 2
  %13 = icmp ult i16 %.v4, %.v5
  %14 = getelementptr i16, ptr %rs1, i32 1
  %15 = getelementptr i16, ptr %rs2, i32 0
  %.v6 = load i16, ptr %14, align 2
  %.v7 = load i16, ptr %15, align 2
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i16 %.v6, i16 %.v7
  store i16 %17, ptr %10, align 2
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MINU_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %20

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rd, i32 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %5, align 2
  %7 = icmp ult i16 %.v, %6
  %8 = getelementptr i16, ptr %rs1, i32 0
  %9 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %8, align 2
  %10 = icmp ne i1 %7, false
  %11 = select i1 %10, i16 %.v1, i16 %9
  store i16 %11, ptr %4, align 2
  %12 = getelementptr i16, ptr %rd, i32 1
  %13 = getelementptr i16, ptr %rs1, i32 1
  %14 = trunc i32 %Imm6 to i16
  %.v2 = load i16, ptr %13, align 2
  %15 = icmp ult i16 %.v2, %14
  %16 = getelementptr i16, ptr %rs1, i32 1
  %17 = trunc i32 %Imm6 to i16
  %.v3 = load i16, ptr %16, align 2
  %18 = icmp ne i1 %15, false
  %19 = select i1 %18, i16 %.v3, i16 %17
  store i16 %19, ptr %12, align 2
  br label %20

20:                                               ; preds = %3, %0
  ret void
}

define void @implCV_MINU_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %34

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = icmp ult i8 %.v, %.v1
  %6 = getelementptr i8, ptr %rs1, i32 0
  %7 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %6, align 1
  %.v3 = load i8, ptr %7, align 1
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i8 %.v2, i8 %.v3
  store i8 %9, ptr %2, align 1
  %10 = getelementptr i8, ptr %rd, i32 1
  %11 = getelementptr i8, ptr %rs1, i32 1
  %12 = getelementptr i8, ptr %rs2, i32 1
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = icmp ult i8 %.v4, %.v5
  %14 = getelementptr i8, ptr %rs1, i32 1
  %15 = getelementptr i8, ptr %rs2, i32 1
  %.v6 = load i8, ptr %14, align 1
  %.v7 = load i8, ptr %15, align 1
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i8 %.v6, i8 %.v7
  store i8 %17, ptr %10, align 1
  %18 = getelementptr i8, ptr %rd, i32 2
  %19 = getelementptr i8, ptr %rs1, i32 2
  %20 = getelementptr i8, ptr %rs2, i32 2
  %.v8 = load i8, ptr %19, align 1
  %.v9 = load i8, ptr %20, align 1
  %21 = icmp ult i8 %.v8, %.v9
  %22 = getelementptr i8, ptr %rs1, i32 2
  %23 = getelementptr i8, ptr %rs2, i32 2
  %.v10 = load i8, ptr %22, align 1
  %.v11 = load i8, ptr %23, align 1
  %24 = icmp ne i1 %21, false
  %25 = select i1 %24, i8 %.v10, i8 %.v11
  store i8 %25, ptr %18, align 1
  %26 = getelementptr i8, ptr %rd, i32 3
  %27 = getelementptr i8, ptr %rs1, i32 3
  %28 = getelementptr i8, ptr %rs2, i32 3
  %.v12 = load i8, ptr %27, align 1
  %.v13 = load i8, ptr %28, align 1
  %29 = icmp ult i8 %.v12, %.v13
  %30 = getelementptr i8, ptr %rs1, i32 3
  %31 = getelementptr i8, ptr %rs2, i32 3
  %.v14 = load i8, ptr %30, align 1
  %.v15 = load i8, ptr %31, align 1
  %32 = icmp ne i1 %29, false
  %33 = select i1 %32, i8 %.v14, i8 %.v15
  store i8 %33, ptr %26, align 1
  br label %34

34:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MINU_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %34

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = icmp ult i8 %.v, %.v1
  %6 = getelementptr i8, ptr %rs1, i32 0
  %7 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %6, align 1
  %.v3 = load i8, ptr %7, align 1
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i8 %.v2, i8 %.v3
  store i8 %9, ptr %2, align 1
  %10 = getelementptr i8, ptr %rd, i32 1
  %11 = getelementptr i8, ptr %rs1, i32 1
  %12 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = icmp ult i8 %.v4, %.v5
  %14 = getelementptr i8, ptr %rs1, i32 1
  %15 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %14, align 1
  %.v7 = load i8, ptr %15, align 1
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i8 %.v6, i8 %.v7
  store i8 %17, ptr %10, align 1
  %18 = getelementptr i8, ptr %rd, i32 2
  %19 = getelementptr i8, ptr %rs1, i32 2
  %20 = getelementptr i8, ptr %rs2, i32 0
  %.v8 = load i8, ptr %19, align 1
  %.v9 = load i8, ptr %20, align 1
  %21 = icmp ult i8 %.v8, %.v9
  %22 = getelementptr i8, ptr %rs1, i32 2
  %23 = getelementptr i8, ptr %rs2, i32 0
  %.v10 = load i8, ptr %22, align 1
  %.v11 = load i8, ptr %23, align 1
  %24 = icmp ne i1 %21, false
  %25 = select i1 %24, i8 %.v10, i8 %.v11
  store i8 %25, ptr %18, align 1
  %26 = getelementptr i8, ptr %rd, i32 3
  %27 = getelementptr i8, ptr %rs1, i32 3
  %28 = getelementptr i8, ptr %rs2, i32 0
  %.v12 = load i8, ptr %27, align 1
  %.v13 = load i8, ptr %28, align 1
  %29 = icmp ult i8 %.v12, %.v13
  %30 = getelementptr i8, ptr %rs1, i32 3
  %31 = getelementptr i8, ptr %rs2, i32 0
  %.v14 = load i8, ptr %30, align 1
  %.v15 = load i8, ptr %31, align 1
  %32 = icmp ne i1 %29, false
  %33 = select i1 %32, i8 %.v14, i8 %.v15
  store i8 %33, ptr %26, align 1
  br label %34

34:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MINU_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %36

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rd, i32 0
  %5 = getelementptr i8, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %5, align 1
  %7 = icmp ult i8 %.v, %6
  %8 = getelementptr i8, ptr %rs1, i32 0
  %9 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %8, align 1
  %10 = icmp ne i1 %7, false
  %11 = select i1 %10, i8 %.v1, i8 %9
  store i8 %11, ptr %4, align 1
  %12 = getelementptr i8, ptr %rd, i32 1
  %13 = getelementptr i8, ptr %rs1, i32 1
  %14 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %13, align 1
  %15 = icmp ult i8 %.v2, %14
  %16 = getelementptr i8, ptr %rs1, i32 1
  %17 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %16, align 1
  %18 = icmp ne i1 %15, false
  %19 = select i1 %18, i8 %.v3, i8 %17
  store i8 %19, ptr %12, align 1
  %20 = getelementptr i8, ptr %rd, i32 2
  %21 = getelementptr i8, ptr %rs1, i32 2
  %22 = trunc i32 %Imm6 to i8
  %.v4 = load i8, ptr %21, align 1
  %23 = icmp ult i8 %.v4, %22
  %24 = getelementptr i8, ptr %rs1, i32 2
  %25 = trunc i32 %Imm6 to i8
  %.v5 = load i8, ptr %24, align 1
  %26 = icmp ne i1 %23, false
  %27 = select i1 %26, i8 %.v5, i8 %25
  store i8 %27, ptr %20, align 1
  %28 = getelementptr i8, ptr %rd, i32 3
  %29 = getelementptr i8, ptr %rs1, i32 3
  %30 = trunc i32 %Imm6 to i8
  %.v6 = load i8, ptr %29, align 1
  %31 = icmp ult i8 %.v6, %30
  %32 = getelementptr i8, ptr %rs1, i32 3
  %33 = trunc i32 %Imm6 to i8
  %.v7 = load i8, ptr %32, align 1
  %34 = icmp ne i1 %31, false
  %35 = select i1 %34, i8 %.v7, i8 %33
  store i8 %35, ptr %28, align 1
  br label %36

36:                                               ; preds = %3, %0
  ret void
}

define void @implCV_MAX_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = icmp sgt i16 %.v, %.v1
  %6 = getelementptr i16, ptr %rs1, i32 0
  %7 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %6, align 2
  %.v3 = load i16, ptr %7, align 2
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i16 %.v2, i16 %.v3
  store i16 %9, ptr %2, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = getelementptr i16, ptr %rs2, i32 1
  %.v4 = load i16, ptr %11, align 2
  %.v5 = load i16, ptr %12, align 2
  %13 = icmp sgt i16 %.v4, %.v5
  %14 = getelementptr i16, ptr %rs1, i32 1
  %15 = getelementptr i16, ptr %rs2, i32 1
  %.v6 = load i16, ptr %14, align 2
  %.v7 = load i16, ptr %15, align 2
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i16 %.v6, i16 %.v7
  store i16 %17, ptr %10, align 2
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MAX_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = icmp sgt i16 %.v, %.v1
  %6 = getelementptr i16, ptr %rs1, i32 0
  %7 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %6, align 2
  %.v3 = load i16, ptr %7, align 2
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i16 %.v2, i16 %.v3
  store i16 %9, ptr %2, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = getelementptr i16, ptr %rs2, i32 0
  %.v4 = load i16, ptr %11, align 2
  %.v5 = load i16, ptr %12, align 2
  %13 = icmp sgt i16 %.v4, %.v5
  %14 = getelementptr i16, ptr %rs1, i32 1
  %15 = getelementptr i16, ptr %rs2, i32 0
  %.v6 = load i16, ptr %14, align 2
  %.v7 = load i16, ptr %15, align 2
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i16 %.v6, i16 %.v7
  store i16 %17, ptr %10, align 2
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MAX_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %20

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rd, i32 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %5, align 2
  %7 = icmp sgt i16 %.v, %6
  %8 = getelementptr i16, ptr %rs1, i32 0
  %9 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %8, align 2
  %10 = icmp ne i1 %7, false
  %11 = select i1 %10, i16 %.v1, i16 %9
  store i16 %11, ptr %4, align 2
  %12 = getelementptr i16, ptr %rd, i32 1
  %13 = getelementptr i16, ptr %rs1, i32 1
  %14 = trunc i32 %Imm6 to i16
  %.v2 = load i16, ptr %13, align 2
  %15 = icmp sgt i16 %.v2, %14
  %16 = getelementptr i16, ptr %rs1, i32 1
  %17 = trunc i32 %Imm6 to i16
  %.v3 = load i16, ptr %16, align 2
  %18 = icmp ne i1 %15, false
  %19 = select i1 %18, i16 %.v3, i16 %17
  store i16 %19, ptr %12, align 2
  br label %20

20:                                               ; preds = %3, %0
  ret void
}

define void @implCV_MAX_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %34

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = icmp sgt i8 %.v, %.v1
  %6 = getelementptr i8, ptr %rs1, i32 0
  %7 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %6, align 1
  %.v3 = load i8, ptr %7, align 1
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i8 %.v2, i8 %.v3
  store i8 %9, ptr %2, align 1
  %10 = getelementptr i8, ptr %rd, i32 1
  %11 = getelementptr i8, ptr %rs1, i32 1
  %12 = getelementptr i8, ptr %rs2, i32 1
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = icmp sgt i8 %.v4, %.v5
  %14 = getelementptr i8, ptr %rs1, i32 1
  %15 = getelementptr i8, ptr %rs2, i32 1
  %.v6 = load i8, ptr %14, align 1
  %.v7 = load i8, ptr %15, align 1
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i8 %.v6, i8 %.v7
  store i8 %17, ptr %10, align 1
  %18 = getelementptr i8, ptr %rd, i32 2
  %19 = getelementptr i8, ptr %rs1, i32 2
  %20 = getelementptr i8, ptr %rs2, i32 2
  %.v8 = load i8, ptr %19, align 1
  %.v9 = load i8, ptr %20, align 1
  %21 = icmp sgt i8 %.v8, %.v9
  %22 = getelementptr i8, ptr %rs1, i32 2
  %23 = getelementptr i8, ptr %rs2, i32 2
  %.v10 = load i8, ptr %22, align 1
  %.v11 = load i8, ptr %23, align 1
  %24 = icmp ne i1 %21, false
  %25 = select i1 %24, i8 %.v10, i8 %.v11
  store i8 %25, ptr %18, align 1
  %26 = getelementptr i8, ptr %rd, i32 3
  %27 = getelementptr i8, ptr %rs1, i32 3
  %28 = getelementptr i8, ptr %rs2, i32 3
  %.v12 = load i8, ptr %27, align 1
  %.v13 = load i8, ptr %28, align 1
  %29 = icmp sgt i8 %.v12, %.v13
  %30 = getelementptr i8, ptr %rs1, i32 3
  %31 = getelementptr i8, ptr %rs2, i32 3
  %.v14 = load i8, ptr %30, align 1
  %.v15 = load i8, ptr %31, align 1
  %32 = icmp ne i1 %29, false
  %33 = select i1 %32, i8 %.v14, i8 %.v15
  store i8 %33, ptr %26, align 1
  br label %34

34:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MAX_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %34

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = icmp sgt i8 %.v, %.v1
  %6 = getelementptr i8, ptr %rs1, i32 0
  %7 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %6, align 1
  %.v3 = load i8, ptr %7, align 1
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i8 %.v2, i8 %.v3
  store i8 %9, ptr %2, align 1
  %10 = getelementptr i8, ptr %rd, i32 1
  %11 = getelementptr i8, ptr %rs1, i32 1
  %12 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = icmp sgt i8 %.v4, %.v5
  %14 = getelementptr i8, ptr %rs1, i32 1
  %15 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %14, align 1
  %.v7 = load i8, ptr %15, align 1
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i8 %.v6, i8 %.v7
  store i8 %17, ptr %10, align 1
  %18 = getelementptr i8, ptr %rd, i32 2
  %19 = getelementptr i8, ptr %rs1, i32 2
  %20 = getelementptr i8, ptr %rs2, i32 0
  %.v8 = load i8, ptr %19, align 1
  %.v9 = load i8, ptr %20, align 1
  %21 = icmp sgt i8 %.v8, %.v9
  %22 = getelementptr i8, ptr %rs1, i32 2
  %23 = getelementptr i8, ptr %rs2, i32 0
  %.v10 = load i8, ptr %22, align 1
  %.v11 = load i8, ptr %23, align 1
  %24 = icmp ne i1 %21, false
  %25 = select i1 %24, i8 %.v10, i8 %.v11
  store i8 %25, ptr %18, align 1
  %26 = getelementptr i8, ptr %rd, i32 3
  %27 = getelementptr i8, ptr %rs1, i32 3
  %28 = getelementptr i8, ptr %rs2, i32 0
  %.v12 = load i8, ptr %27, align 1
  %.v13 = load i8, ptr %28, align 1
  %29 = icmp sgt i8 %.v12, %.v13
  %30 = getelementptr i8, ptr %rs1, i32 3
  %31 = getelementptr i8, ptr %rs2, i32 0
  %.v14 = load i8, ptr %30, align 1
  %.v15 = load i8, ptr %31, align 1
  %32 = icmp ne i1 %29, false
  %33 = select i1 %32, i8 %.v14, i8 %.v15
  store i8 %33, ptr %26, align 1
  br label %34

34:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MAX_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %36

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rd, i32 0
  %5 = getelementptr i8, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %5, align 1
  %7 = icmp sgt i8 %.v, %6
  %8 = getelementptr i8, ptr %rs1, i32 0
  %9 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %8, align 1
  %10 = icmp ne i1 %7, false
  %11 = select i1 %10, i8 %.v1, i8 %9
  store i8 %11, ptr %4, align 1
  %12 = getelementptr i8, ptr %rd, i32 1
  %13 = getelementptr i8, ptr %rs1, i32 1
  %14 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %13, align 1
  %15 = icmp sgt i8 %.v2, %14
  %16 = getelementptr i8, ptr %rs1, i32 1
  %17 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %16, align 1
  %18 = icmp ne i1 %15, false
  %19 = select i1 %18, i8 %.v3, i8 %17
  store i8 %19, ptr %12, align 1
  %20 = getelementptr i8, ptr %rd, i32 2
  %21 = getelementptr i8, ptr %rs1, i32 2
  %22 = trunc i32 %Imm6 to i8
  %.v4 = load i8, ptr %21, align 1
  %23 = icmp sgt i8 %.v4, %22
  %24 = getelementptr i8, ptr %rs1, i32 2
  %25 = trunc i32 %Imm6 to i8
  %.v5 = load i8, ptr %24, align 1
  %26 = icmp ne i1 %23, false
  %27 = select i1 %26, i8 %.v5, i8 %25
  store i8 %27, ptr %20, align 1
  %28 = getelementptr i8, ptr %rd, i32 3
  %29 = getelementptr i8, ptr %rs1, i32 3
  %30 = trunc i32 %Imm6 to i8
  %.v6 = load i8, ptr %29, align 1
  %31 = icmp sgt i8 %.v6, %30
  %32 = getelementptr i8, ptr %rs1, i32 3
  %33 = trunc i32 %Imm6 to i8
  %.v7 = load i8, ptr %32, align 1
  %34 = icmp ne i1 %31, false
  %35 = select i1 %34, i8 %.v7, i8 %33
  store i8 %35, ptr %28, align 1
  br label %36

36:                                               ; preds = %3, %0
  ret void
}

define void @implCV_MAXU_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = icmp ugt i16 %.v, %.v1
  %6 = getelementptr i16, ptr %rs1, i32 0
  %7 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %6, align 2
  %.v3 = load i16, ptr %7, align 2
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i16 %.v2, i16 %.v3
  store i16 %9, ptr %2, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = getelementptr i16, ptr %rs2, i32 1
  %.v4 = load i16, ptr %11, align 2
  %.v5 = load i16, ptr %12, align 2
  %13 = icmp ugt i16 %.v4, %.v5
  %14 = getelementptr i16, ptr %rs1, i32 1
  %15 = getelementptr i16, ptr %rs2, i32 1
  %.v6 = load i16, ptr %14, align 2
  %.v7 = load i16, ptr %15, align 2
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i16 %.v6, i16 %.v7
  store i16 %17, ptr %10, align 2
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MAXU_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = icmp ugt i16 %.v, %.v1
  %6 = getelementptr i16, ptr %rs1, i32 0
  %7 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %6, align 2
  %.v3 = load i16, ptr %7, align 2
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i16 %.v2, i16 %.v3
  store i16 %9, ptr %2, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = getelementptr i16, ptr %rs2, i32 0
  %.v4 = load i16, ptr %11, align 2
  %.v5 = load i16, ptr %12, align 2
  %13 = icmp ugt i16 %.v4, %.v5
  %14 = getelementptr i16, ptr %rs1, i32 1
  %15 = getelementptr i16, ptr %rs2, i32 0
  %.v6 = load i16, ptr %14, align 2
  %.v7 = load i16, ptr %15, align 2
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i16 %.v6, i16 %.v7
  store i16 %17, ptr %10, align 2
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MAXU_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %20

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rd, i32 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %5, align 2
  %7 = icmp ugt i16 %.v, %6
  %8 = getelementptr i16, ptr %rs1, i32 0
  %9 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %8, align 2
  %10 = icmp ne i1 %7, false
  %11 = select i1 %10, i16 %.v1, i16 %9
  store i16 %11, ptr %4, align 2
  %12 = getelementptr i16, ptr %rd, i32 1
  %13 = getelementptr i16, ptr %rs1, i32 1
  %14 = trunc i32 %Imm6 to i16
  %.v2 = load i16, ptr %13, align 2
  %15 = icmp ugt i16 %.v2, %14
  %16 = getelementptr i16, ptr %rs1, i32 1
  %17 = trunc i32 %Imm6 to i16
  %.v3 = load i16, ptr %16, align 2
  %18 = icmp ne i1 %15, false
  %19 = select i1 %18, i16 %.v3, i16 %17
  store i16 %19, ptr %12, align 2
  br label %20

20:                                               ; preds = %3, %0
  ret void
}

define void @implCV_MAXU_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %34

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = icmp ugt i8 %.v, %.v1
  %6 = getelementptr i8, ptr %rs1, i32 0
  %7 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %6, align 1
  %.v3 = load i8, ptr %7, align 1
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i8 %.v2, i8 %.v3
  store i8 %9, ptr %2, align 1
  %10 = getelementptr i8, ptr %rd, i32 1
  %11 = getelementptr i8, ptr %rs1, i32 1
  %12 = getelementptr i8, ptr %rs2, i32 1
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = icmp ugt i8 %.v4, %.v5
  %14 = getelementptr i8, ptr %rs1, i32 1
  %15 = getelementptr i8, ptr %rs2, i32 1
  %.v6 = load i8, ptr %14, align 1
  %.v7 = load i8, ptr %15, align 1
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i8 %.v6, i8 %.v7
  store i8 %17, ptr %10, align 1
  %18 = getelementptr i8, ptr %rd, i32 2
  %19 = getelementptr i8, ptr %rs1, i32 2
  %20 = getelementptr i8, ptr %rs2, i32 2
  %.v8 = load i8, ptr %19, align 1
  %.v9 = load i8, ptr %20, align 1
  %21 = icmp ugt i8 %.v8, %.v9
  %22 = getelementptr i8, ptr %rs1, i32 2
  %23 = getelementptr i8, ptr %rs2, i32 2
  %.v10 = load i8, ptr %22, align 1
  %.v11 = load i8, ptr %23, align 1
  %24 = icmp ne i1 %21, false
  %25 = select i1 %24, i8 %.v10, i8 %.v11
  store i8 %25, ptr %18, align 1
  %26 = getelementptr i8, ptr %rd, i32 3
  %27 = getelementptr i8, ptr %rs1, i32 3
  %28 = getelementptr i8, ptr %rs2, i32 3
  %.v12 = load i8, ptr %27, align 1
  %.v13 = load i8, ptr %28, align 1
  %29 = icmp ugt i8 %.v12, %.v13
  %30 = getelementptr i8, ptr %rs1, i32 3
  %31 = getelementptr i8, ptr %rs2, i32 3
  %.v14 = load i8, ptr %30, align 1
  %.v15 = load i8, ptr %31, align 1
  %32 = icmp ne i1 %29, false
  %33 = select i1 %32, i8 %.v14, i8 %.v15
  store i8 %33, ptr %26, align 1
  br label %34

34:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MAXU_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %34

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = icmp ugt i8 %.v, %.v1
  %6 = getelementptr i8, ptr %rs1, i32 0
  %7 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %6, align 1
  %.v3 = load i8, ptr %7, align 1
  %8 = icmp ne i1 %5, false
  %9 = select i1 %8, i8 %.v2, i8 %.v3
  store i8 %9, ptr %2, align 1
  %10 = getelementptr i8, ptr %rd, i32 1
  %11 = getelementptr i8, ptr %rs1, i32 1
  %12 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = icmp ugt i8 %.v4, %.v5
  %14 = getelementptr i8, ptr %rs1, i32 1
  %15 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %14, align 1
  %.v7 = load i8, ptr %15, align 1
  %16 = icmp ne i1 %13, false
  %17 = select i1 %16, i8 %.v6, i8 %.v7
  store i8 %17, ptr %10, align 1
  %18 = getelementptr i8, ptr %rd, i32 2
  %19 = getelementptr i8, ptr %rs1, i32 2
  %20 = getelementptr i8, ptr %rs2, i32 0
  %.v8 = load i8, ptr %19, align 1
  %.v9 = load i8, ptr %20, align 1
  %21 = icmp ugt i8 %.v8, %.v9
  %22 = getelementptr i8, ptr %rs1, i32 2
  %23 = getelementptr i8, ptr %rs2, i32 0
  %.v10 = load i8, ptr %22, align 1
  %.v11 = load i8, ptr %23, align 1
  %24 = icmp ne i1 %21, false
  %25 = select i1 %24, i8 %.v10, i8 %.v11
  store i8 %25, ptr %18, align 1
  %26 = getelementptr i8, ptr %rd, i32 3
  %27 = getelementptr i8, ptr %rs1, i32 3
  %28 = getelementptr i8, ptr %rs2, i32 0
  %.v12 = load i8, ptr %27, align 1
  %.v13 = load i8, ptr %28, align 1
  %29 = icmp ugt i8 %.v12, %.v13
  %30 = getelementptr i8, ptr %rs1, i32 3
  %31 = getelementptr i8, ptr %rs2, i32 0
  %.v14 = load i8, ptr %30, align 1
  %.v15 = load i8, ptr %31, align 1
  %32 = icmp ne i1 %29, false
  %33 = select i1 %32, i8 %.v14, i8 %.v15
  store i8 %33, ptr %26, align 1
  br label %34

34:                                               ; preds = %1, %0
  ret void
}

define void @implCV_MAXU_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %36

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rd, i32 0
  %5 = getelementptr i8, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %5, align 1
  %7 = icmp ugt i8 %.v, %6
  %8 = getelementptr i8, ptr %rs1, i32 0
  %9 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %8, align 1
  %10 = icmp ne i1 %7, false
  %11 = select i1 %10, i8 %.v1, i8 %9
  store i8 %11, ptr %4, align 1
  %12 = getelementptr i8, ptr %rd, i32 1
  %13 = getelementptr i8, ptr %rs1, i32 1
  %14 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %13, align 1
  %15 = icmp ugt i8 %.v2, %14
  %16 = getelementptr i8, ptr %rs1, i32 1
  %17 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %16, align 1
  %18 = icmp ne i1 %15, false
  %19 = select i1 %18, i8 %.v3, i8 %17
  store i8 %19, ptr %12, align 1
  %20 = getelementptr i8, ptr %rd, i32 2
  %21 = getelementptr i8, ptr %rs1, i32 2
  %22 = trunc i32 %Imm6 to i8
  %.v4 = load i8, ptr %21, align 1
  %23 = icmp ugt i8 %.v4, %22
  %24 = getelementptr i8, ptr %rs1, i32 2
  %25 = trunc i32 %Imm6 to i8
  %.v5 = load i8, ptr %24, align 1
  %26 = icmp ne i1 %23, false
  %27 = select i1 %26, i8 %.v5, i8 %25
  store i8 %27, ptr %20, align 1
  %28 = getelementptr i8, ptr %rd, i32 3
  %29 = getelementptr i8, ptr %rs1, i32 3
  %30 = trunc i32 %Imm6 to i8
  %.v6 = load i8, ptr %29, align 1
  %31 = icmp ugt i8 %.v6, %30
  %32 = getelementptr i8, ptr %rs1, i32 3
  %33 = trunc i32 %Imm6 to i8
  %.v7 = load i8, ptr %32, align 1
  %34 = icmp ne i1 %31, false
  %35 = select i1 %34, i8 %.v7, i8 %33
  store i8 %35, ptr %28, align 1
  br label %36

36:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SRL_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %10

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = lshr i16 %.v, %.v1
  store i16 %5, ptr %2, align 2
  %6 = getelementptr i16, ptr %rd, i32 1
  %7 = getelementptr i16, ptr %rs1, i32 1
  %8 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %7, align 2
  %.v3 = load i16, ptr %8, align 2
  %9 = lshr i16 %.v2, %.v3
  store i16 %9, ptr %6, align 2
  br label %10

10:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SRL_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %10

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = lshr i16 %.v, %.v1
  store i16 %5, ptr %2, align 2
  %6 = getelementptr i16, ptr %rd, i32 1
  %7 = getelementptr i16, ptr %rs1, i32 1
  %8 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %7, align 2
  %.v3 = load i16, ptr %8, align 2
  %9 = lshr i16 %.v2, %.v3
  store i16 %9, ptr %6, align 2
  br label %10

10:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SRL_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %12

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rd, i32 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %5, align 2
  %7 = lshr i16 %.v, %6
  store i16 %7, ptr %4, align 2
  %8 = getelementptr i16, ptr %rd, i32 1
  %9 = getelementptr i16, ptr %rs1, i32 1
  %10 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %9, align 2
  %11 = lshr i16 %.v1, %10
  store i16 %11, ptr %8, align 2
  br label %12

12:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SRL_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = lshr i8 %.v, %.v1
  store i8 %5, ptr %2, align 1
  %6 = getelementptr i8, ptr %rd, i32 1
  %7 = getelementptr i8, ptr %rs1, i32 1
  %8 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %7, align 1
  %.v3 = load i8, ptr %8, align 1
  %9 = lshr i8 %.v2, %.v3
  store i8 %9, ptr %6, align 1
  %10 = getelementptr i8, ptr %rd, i32 2
  %11 = getelementptr i8, ptr %rs1, i32 2
  %12 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = lshr i8 %.v4, %.v5
  store i8 %13, ptr %10, align 1
  %14 = getelementptr i8, ptr %rd, i32 3
  %15 = getelementptr i8, ptr %rs1, i32 3
  %16 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %15, align 1
  %.v7 = load i8, ptr %16, align 1
  %17 = lshr i8 %.v6, %.v7
  store i8 %17, ptr %14, align 1
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SRL_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = lshr i8 %.v, %.v1
  store i8 %5, ptr %2, align 1
  %6 = getelementptr i8, ptr %rd, i32 1
  %7 = getelementptr i8, ptr %rs1, i32 1
  %8 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %7, align 1
  %.v3 = load i8, ptr %8, align 1
  %9 = lshr i8 %.v2, %.v3
  store i8 %9, ptr %6, align 1
  %10 = getelementptr i8, ptr %rd, i32 2
  %11 = getelementptr i8, ptr %rs1, i32 2
  %12 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = lshr i8 %.v4, %.v5
  store i8 %13, ptr %10, align 1
  %14 = getelementptr i8, ptr %rd, i32 3
  %15 = getelementptr i8, ptr %rs1, i32 3
  %16 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %15, align 1
  %.v7 = load i8, ptr %16, align 1
  %17 = lshr i8 %.v6, %.v7
  store i8 %17, ptr %14, align 1
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SRL_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %20

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rd, i32 0
  %5 = getelementptr i8, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %5, align 1
  %7 = lshr i8 %.v, %6
  store i8 %7, ptr %4, align 1
  %8 = getelementptr i8, ptr %rd, i32 1
  %9 = getelementptr i8, ptr %rs1, i32 1
  %10 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %9, align 1
  %11 = lshr i8 %.v1, %10
  store i8 %11, ptr %8, align 1
  %12 = getelementptr i8, ptr %rd, i32 2
  %13 = getelementptr i8, ptr %rs1, i32 2
  %14 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %13, align 1
  %15 = lshr i8 %.v2, %14
  store i8 %15, ptr %12, align 1
  %16 = getelementptr i8, ptr %rd, i32 3
  %17 = getelementptr i8, ptr %rs1, i32 3
  %18 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %17, align 1
  %19 = lshr i8 %.v3, %18
  store i8 %19, ptr %16, align 1
  br label %20

20:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SRA_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %10

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = ashr i16 %.v, %.v1
  store i16 %5, ptr %2, align 2
  %6 = getelementptr i16, ptr %rd, i32 1
  %7 = getelementptr i16, ptr %rs1, i32 1
  %8 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %7, align 2
  %.v3 = load i16, ptr %8, align 2
  %9 = ashr i16 %.v2, %.v3
  store i16 %9, ptr %6, align 2
  br label %10

10:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SRA_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %10

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = ashr i16 %.v, %.v1
  store i16 %5, ptr %2, align 2
  %6 = getelementptr i16, ptr %rd, i32 1
  %7 = getelementptr i16, ptr %rs1, i32 1
  %8 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %7, align 2
  %.v3 = load i16, ptr %8, align 2
  %9 = ashr i16 %.v2, %.v3
  store i16 %9, ptr %6, align 2
  br label %10

10:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SRA_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %12

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rd, i32 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %5, align 2
  %7 = ashr i16 %.v, %6
  store i16 %7, ptr %4, align 2
  %8 = getelementptr i16, ptr %rd, i32 1
  %9 = getelementptr i16, ptr %rs1, i32 1
  %10 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %9, align 2
  %11 = ashr i16 %.v1, %10
  store i16 %11, ptr %8, align 2
  br label %12

12:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SRA_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = ashr i8 %.v, %.v1
  store i8 %5, ptr %2, align 1
  %6 = getelementptr i8, ptr %rd, i32 1
  %7 = getelementptr i8, ptr %rs1, i32 1
  %8 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %7, align 1
  %.v3 = load i8, ptr %8, align 1
  %9 = ashr i8 %.v2, %.v3
  store i8 %9, ptr %6, align 1
  %10 = getelementptr i8, ptr %rd, i32 2
  %11 = getelementptr i8, ptr %rs1, i32 2
  %12 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = ashr i8 %.v4, %.v5
  store i8 %13, ptr %10, align 1
  %14 = getelementptr i8, ptr %rd, i32 3
  %15 = getelementptr i8, ptr %rs1, i32 3
  %16 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %15, align 1
  %.v7 = load i8, ptr %16, align 1
  %17 = ashr i8 %.v6, %.v7
  store i8 %17, ptr %14, align 1
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SRA_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = ashr i8 %.v, %.v1
  store i8 %5, ptr %2, align 1
  %6 = getelementptr i8, ptr %rd, i32 1
  %7 = getelementptr i8, ptr %rs1, i32 1
  %8 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %7, align 1
  %.v3 = load i8, ptr %8, align 1
  %9 = ashr i8 %.v2, %.v3
  store i8 %9, ptr %6, align 1
  %10 = getelementptr i8, ptr %rd, i32 2
  %11 = getelementptr i8, ptr %rs1, i32 2
  %12 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = ashr i8 %.v4, %.v5
  store i8 %13, ptr %10, align 1
  %14 = getelementptr i8, ptr %rd, i32 3
  %15 = getelementptr i8, ptr %rs1, i32 3
  %16 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %15, align 1
  %.v7 = load i8, ptr %16, align 1
  %17 = ashr i8 %.v6, %.v7
  store i8 %17, ptr %14, align 1
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SRA_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %20

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rd, i32 0
  %5 = getelementptr i8, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %5, align 1
  %7 = ashr i8 %.v, %6
  store i8 %7, ptr %4, align 1
  %8 = getelementptr i8, ptr %rd, i32 1
  %9 = getelementptr i8, ptr %rs1, i32 1
  %10 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %9, align 1
  %11 = ashr i8 %.v1, %10
  store i8 %11, ptr %8, align 1
  %12 = getelementptr i8, ptr %rd, i32 2
  %13 = getelementptr i8, ptr %rs1, i32 2
  %14 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %13, align 1
  %15 = ashr i8 %.v2, %14
  store i8 %15, ptr %12, align 1
  %16 = getelementptr i8, ptr %rd, i32 3
  %17 = getelementptr i8, ptr %rs1, i32 3
  %18 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %17, align 1
  %19 = ashr i8 %.v3, %18
  store i8 %19, ptr %16, align 1
  br label %20

20:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SLL_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %10

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = shl i16 %.v, %.v1
  store i16 %5, ptr %2, align 2
  %6 = getelementptr i16, ptr %rd, i32 1
  %7 = getelementptr i16, ptr %rs1, i32 1
  %8 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %7, align 2
  %.v3 = load i16, ptr %8, align 2
  %9 = shl i16 %.v2, %.v3
  store i16 %9, ptr %6, align 2
  br label %10

10:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SLL_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %10

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = shl i16 %.v, %.v1
  store i16 %5, ptr %2, align 2
  %6 = getelementptr i16, ptr %rd, i32 1
  %7 = getelementptr i16, ptr %rs1, i32 1
  %8 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %7, align 2
  %.v3 = load i16, ptr %8, align 2
  %9 = shl i16 %.v2, %.v3
  store i16 %9, ptr %6, align 2
  br label %10

10:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SLL_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %12

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rd, i32 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %5, align 2
  %7 = shl i16 %.v, %6
  store i16 %7, ptr %4, align 2
  %8 = getelementptr i16, ptr %rd, i32 1
  %9 = getelementptr i16, ptr %rs1, i32 1
  %10 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %9, align 2
  %11 = shl i16 %.v1, %10
  store i16 %11, ptr %8, align 2
  br label %12

12:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SLL_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = shl i8 %.v, %.v1
  store i8 %5, ptr %2, align 1
  %6 = getelementptr i8, ptr %rd, i32 1
  %7 = getelementptr i8, ptr %rs1, i32 1
  %8 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %7, align 1
  %.v3 = load i8, ptr %8, align 1
  %9 = shl i8 %.v2, %.v3
  store i8 %9, ptr %6, align 1
  %10 = getelementptr i8, ptr %rd, i32 2
  %11 = getelementptr i8, ptr %rs1, i32 2
  %12 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = shl i8 %.v4, %.v5
  store i8 %13, ptr %10, align 1
  %14 = getelementptr i8, ptr %rd, i32 3
  %15 = getelementptr i8, ptr %rs1, i32 3
  %16 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %15, align 1
  %.v7 = load i8, ptr %16, align 1
  %17 = shl i8 %.v6, %.v7
  store i8 %17, ptr %14, align 1
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SLL_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = shl i8 %.v, %.v1
  store i8 %5, ptr %2, align 1
  %6 = getelementptr i8, ptr %rd, i32 1
  %7 = getelementptr i8, ptr %rs1, i32 1
  %8 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %7, align 1
  %.v3 = load i8, ptr %8, align 1
  %9 = shl i8 %.v2, %.v3
  store i8 %9, ptr %6, align 1
  %10 = getelementptr i8, ptr %rd, i32 2
  %11 = getelementptr i8, ptr %rs1, i32 2
  %12 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %11, align 1
  %.v5 = load i8, ptr %12, align 1
  %13 = shl i8 %.v4, %.v5
  store i8 %13, ptr %10, align 1
  %14 = getelementptr i8, ptr %rd, i32 3
  %15 = getelementptr i8, ptr %rs1, i32 3
  %16 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %15, align 1
  %.v7 = load i8, ptr %16, align 1
  %17 = shl i8 %.v6, %.v7
  store i8 %17, ptr %14, align 1
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SLL_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %20

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rd, i32 0
  %5 = getelementptr i8, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %5, align 1
  %7 = shl i8 %.v, %6
  store i8 %7, ptr %4, align 1
  %8 = getelementptr i8, ptr %rd, i32 1
  %9 = getelementptr i8, ptr %rs1, i32 1
  %10 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %9, align 1
  %11 = shl i8 %.v1, %10
  store i8 %11, ptr %8, align 1
  %12 = getelementptr i8, ptr %rd, i32 2
  %13 = getelementptr i8, ptr %rs1, i32 2
  %14 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %13, align 1
  %15 = shl i8 %.v2, %14
  store i8 %15, ptr %12, align 1
  %16 = getelementptr i8, ptr %rd, i32 3
  %17 = getelementptr i8, ptr %rs1, i32 3
  %18 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %17, align 1
  %19 = shl i8 %.v3, %18
  store i8 %19, ptr %16, align 1
  br label %20

20:                                               ; preds = %3, %0
  ret void
}

define void @implCV_OR_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %14

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = or i16 %.v, %.v1
  %6 = lshr i16 %5, 0
  %7 = and i16 %6, -1
  store i16 %7, ptr %2, align 2
  %8 = getelementptr i16, ptr %rd, i32 1
  %9 = getelementptr i16, ptr %rs1, i32 1
  %10 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %9, align 2
  %.v3 = load i16, ptr %10, align 2
  %11 = or i16 %.v2, %.v3
  %12 = lshr i16 %11, 0
  %13 = and i16 %12, -1
  store i16 %13, ptr %8, align 2
  br label %14

14:                                               ; preds = %1, %0
  ret void
}

define void @implCV_OR_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %14

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = or i16 %.v, %.v1
  %6 = lshr i16 %5, 0
  %7 = and i16 %6, -1
  store i16 %7, ptr %2, align 2
  %8 = getelementptr i16, ptr %rd, i32 1
  %9 = getelementptr i16, ptr %rs1, i32 1
  %10 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %9, align 2
  %.v3 = load i16, ptr %10, align 2
  %11 = or i16 %.v2, %.v3
  %12 = lshr i16 %11, 0
  %13 = and i16 %12, -1
  store i16 %13, ptr %8, align 2
  br label %14

14:                                               ; preds = %1, %0
  ret void
}

define void @implCV_OR_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %16

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rd, i32 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %5, align 2
  %7 = or i16 %.v, %6
  %8 = lshr i16 %7, 0
  %9 = and i16 %8, -1
  store i16 %9, ptr %4, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %11, align 2
  %13 = or i16 %.v1, %12
  %14 = lshr i16 %13, 0
  %15 = and i16 %14, -1
  store i16 %15, ptr %10, align 2
  br label %16

16:                                               ; preds = %3, %0
  ret void
}

define void @implCV_OR_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %26

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = or i8 %.v, %.v1
  %6 = lshr i8 %5, 0
  %7 = and i8 %6, -1
  store i8 %7, ptr %2, align 1
  %8 = getelementptr i8, ptr %rd, i32 1
  %9 = getelementptr i8, ptr %rs1, i32 1
  %10 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %9, align 1
  %.v3 = load i8, ptr %10, align 1
  %11 = or i8 %.v2, %.v3
  %12 = lshr i8 %11, 0
  %13 = and i8 %12, -1
  store i8 %13, ptr %8, align 1
  %14 = getelementptr i8, ptr %rd, i32 2
  %15 = getelementptr i8, ptr %rs1, i32 2
  %16 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %15, align 1
  %.v5 = load i8, ptr %16, align 1
  %17 = or i8 %.v4, %.v5
  %18 = lshr i8 %17, 0
  %19 = and i8 %18, -1
  store i8 %19, ptr %14, align 1
  %20 = getelementptr i8, ptr %rd, i32 3
  %21 = getelementptr i8, ptr %rs1, i32 3
  %22 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %21, align 1
  %.v7 = load i8, ptr %22, align 1
  %23 = or i8 %.v6, %.v7
  %24 = lshr i8 %23, 0
  %25 = and i8 %24, -1
  store i8 %25, ptr %20, align 1
  br label %26

26:                                               ; preds = %1, %0
  ret void
}

define void @implCV_OR_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %26

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = or i8 %.v, %.v1
  %6 = lshr i8 %5, 0
  %7 = and i8 %6, -1
  store i8 %7, ptr %2, align 1
  %8 = getelementptr i8, ptr %rd, i32 1
  %9 = getelementptr i8, ptr %rs1, i32 1
  %10 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %9, align 1
  %.v3 = load i8, ptr %10, align 1
  %11 = or i8 %.v2, %.v3
  %12 = lshr i8 %11, 0
  %13 = and i8 %12, -1
  store i8 %13, ptr %8, align 1
  %14 = getelementptr i8, ptr %rd, i32 2
  %15 = getelementptr i8, ptr %rs1, i32 2
  %16 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %15, align 1
  %.v5 = load i8, ptr %16, align 1
  %17 = or i8 %.v4, %.v5
  %18 = lshr i8 %17, 0
  %19 = and i8 %18, -1
  store i8 %19, ptr %14, align 1
  %20 = getelementptr i8, ptr %rd, i32 3
  %21 = getelementptr i8, ptr %rs1, i32 3
  %22 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %21, align 1
  %.v7 = load i8, ptr %22, align 1
  %23 = or i8 %.v6, %.v7
  %24 = lshr i8 %23, 0
  %25 = and i8 %24, -1
  store i8 %25, ptr %20, align 1
  br label %26

26:                                               ; preds = %1, %0
  ret void
}

define void @implCV_OR_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %28

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rd, i32 0
  %5 = getelementptr i8, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %5, align 1
  %7 = or i8 %.v, %6
  %8 = lshr i8 %7, 0
  %9 = and i8 %8, -1
  store i8 %9, ptr %4, align 1
  %10 = getelementptr i8, ptr %rd, i32 1
  %11 = getelementptr i8, ptr %rs1, i32 1
  %12 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %11, align 1
  %13 = or i8 %.v1, %12
  %14 = lshr i8 %13, 0
  %15 = and i8 %14, -1
  store i8 %15, ptr %10, align 1
  %16 = getelementptr i8, ptr %rd, i32 2
  %17 = getelementptr i8, ptr %rs1, i32 2
  %18 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %17, align 1
  %19 = or i8 %.v2, %18
  %20 = lshr i8 %19, 0
  %21 = and i8 %20, -1
  store i8 %21, ptr %16, align 1
  %22 = getelementptr i8, ptr %rd, i32 3
  %23 = getelementptr i8, ptr %rs1, i32 3
  %24 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %23, align 1
  %25 = or i8 %.v3, %24
  %26 = lshr i8 %25, 0
  %27 = and i8 %26, -1
  store i8 %27, ptr %22, align 1
  br label %28

28:                                               ; preds = %3, %0
  ret void
}

define void @implCV_XOR_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %14

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = xor i16 %.v, %.v1
  %6 = lshr i16 %5, 0
  %7 = and i16 %6, -1
  store i16 %7, ptr %2, align 2
  %8 = getelementptr i16, ptr %rd, i32 1
  %9 = getelementptr i16, ptr %rs1, i32 1
  %10 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %9, align 2
  %.v3 = load i16, ptr %10, align 2
  %11 = xor i16 %.v2, %.v3
  %12 = lshr i16 %11, 0
  %13 = and i16 %12, -1
  store i16 %13, ptr %8, align 2
  br label %14

14:                                               ; preds = %1, %0
  ret void
}

define void @implCV_XOR_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %14

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = xor i16 %.v, %.v1
  %6 = lshr i16 %5, 0
  %7 = and i16 %6, -1
  store i16 %7, ptr %2, align 2
  %8 = getelementptr i16, ptr %rd, i32 1
  %9 = getelementptr i16, ptr %rs1, i32 1
  %10 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %9, align 2
  %.v3 = load i16, ptr %10, align 2
  %11 = xor i16 %.v2, %.v3
  %12 = lshr i16 %11, 0
  %13 = and i16 %12, -1
  store i16 %13, ptr %8, align 2
  br label %14

14:                                               ; preds = %1, %0
  ret void
}

define void @implCV_XOR_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %16

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rd, i32 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %5, align 2
  %7 = xor i16 %.v, %6
  %8 = lshr i16 %7, 0
  %9 = and i16 %8, -1
  store i16 %9, ptr %4, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %11, align 2
  %13 = xor i16 %.v1, %12
  %14 = lshr i16 %13, 0
  %15 = and i16 %14, -1
  store i16 %15, ptr %10, align 2
  br label %16

16:                                               ; preds = %3, %0
  ret void
}

define void @implCV_XOR_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %26

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = xor i8 %.v, %.v1
  %6 = lshr i8 %5, 0
  %7 = and i8 %6, -1
  store i8 %7, ptr %2, align 1
  %8 = getelementptr i8, ptr %rd, i32 1
  %9 = getelementptr i8, ptr %rs1, i32 1
  %10 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %9, align 1
  %.v3 = load i8, ptr %10, align 1
  %11 = xor i8 %.v2, %.v3
  %12 = lshr i8 %11, 0
  %13 = and i8 %12, -1
  store i8 %13, ptr %8, align 1
  %14 = getelementptr i8, ptr %rd, i32 2
  %15 = getelementptr i8, ptr %rs1, i32 2
  %16 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %15, align 1
  %.v5 = load i8, ptr %16, align 1
  %17 = xor i8 %.v4, %.v5
  %18 = lshr i8 %17, 0
  %19 = and i8 %18, -1
  store i8 %19, ptr %14, align 1
  %20 = getelementptr i8, ptr %rd, i32 3
  %21 = getelementptr i8, ptr %rs1, i32 3
  %22 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %21, align 1
  %.v7 = load i8, ptr %22, align 1
  %23 = xor i8 %.v6, %.v7
  %24 = lshr i8 %23, 0
  %25 = and i8 %24, -1
  store i8 %25, ptr %20, align 1
  br label %26

26:                                               ; preds = %1, %0
  ret void
}

define void @implCV_XOR_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %26

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = xor i8 %.v, %.v1
  %6 = lshr i8 %5, 0
  %7 = and i8 %6, -1
  store i8 %7, ptr %2, align 1
  %8 = getelementptr i8, ptr %rd, i32 1
  %9 = getelementptr i8, ptr %rs1, i32 1
  %10 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %9, align 1
  %.v3 = load i8, ptr %10, align 1
  %11 = xor i8 %.v2, %.v3
  %12 = lshr i8 %11, 0
  %13 = and i8 %12, -1
  store i8 %13, ptr %8, align 1
  %14 = getelementptr i8, ptr %rd, i32 2
  %15 = getelementptr i8, ptr %rs1, i32 2
  %16 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %15, align 1
  %.v5 = load i8, ptr %16, align 1
  %17 = xor i8 %.v4, %.v5
  %18 = lshr i8 %17, 0
  %19 = and i8 %18, -1
  store i8 %19, ptr %14, align 1
  %20 = getelementptr i8, ptr %rd, i32 3
  %21 = getelementptr i8, ptr %rs1, i32 3
  %22 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %21, align 1
  %.v7 = load i8, ptr %22, align 1
  %23 = xor i8 %.v6, %.v7
  %24 = lshr i8 %23, 0
  %25 = and i8 %24, -1
  store i8 %25, ptr %20, align 1
  br label %26

26:                                               ; preds = %1, %0
  ret void
}

define void @implCV_XOR_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %28

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rd, i32 0
  %5 = getelementptr i8, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %5, align 1
  %7 = xor i8 %.v, %6
  %8 = lshr i8 %7, 0
  %9 = and i8 %8, -1
  store i8 %9, ptr %4, align 1
  %10 = getelementptr i8, ptr %rd, i32 1
  %11 = getelementptr i8, ptr %rs1, i32 1
  %12 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %11, align 1
  %13 = xor i8 %.v1, %12
  %14 = lshr i8 %13, 0
  %15 = and i8 %14, -1
  store i8 %15, ptr %10, align 1
  %16 = getelementptr i8, ptr %rd, i32 2
  %17 = getelementptr i8, ptr %rs1, i32 2
  %18 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %17, align 1
  %19 = xor i8 %.v2, %18
  %20 = lshr i8 %19, 0
  %21 = and i8 %20, -1
  store i8 %21, ptr %16, align 1
  %22 = getelementptr i8, ptr %rd, i32 3
  %23 = getelementptr i8, ptr %rs1, i32 3
  %24 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %23, align 1
  %25 = xor i8 %.v3, %24
  %26 = lshr i8 %25, 0
  %27 = and i8 %26, -1
  store i8 %27, ptr %22, align 1
  br label %28

28:                                               ; preds = %3, %0
  ret void
}

define void @implCV_AND_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %14

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = and i16 %.v, %.v1
  %6 = lshr i16 %5, 0
  %7 = and i16 %6, -1
  store i16 %7, ptr %2, align 2
  %8 = getelementptr i16, ptr %rd, i32 1
  %9 = getelementptr i16, ptr %rs1, i32 1
  %10 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %9, align 2
  %.v3 = load i16, ptr %10, align 2
  %11 = and i16 %.v2, %.v3
  %12 = lshr i16 %11, 0
  %13 = and i16 %12, -1
  store i16 %13, ptr %8, align 2
  br label %14

14:                                               ; preds = %1, %0
  ret void
}

define void @implCV_AND_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %14

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = and i16 %.v, %.v1
  %6 = lshr i16 %5, 0
  %7 = and i16 %6, -1
  store i16 %7, ptr %2, align 2
  %8 = getelementptr i16, ptr %rd, i32 1
  %9 = getelementptr i16, ptr %rs1, i32 1
  %10 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %9, align 2
  %.v3 = load i16, ptr %10, align 2
  %11 = and i16 %.v2, %.v3
  %12 = lshr i16 %11, 0
  %13 = and i16 %12, -1
  store i16 %13, ptr %8, align 2
  br label %14

14:                                               ; preds = %1, %0
  ret void
}

define void @implCV_AND_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %16

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rd, i32 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %5, align 2
  %7 = and i16 %.v, %6
  %8 = lshr i16 %7, 0
  %9 = and i16 %8, -1
  store i16 %9, ptr %4, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %11, align 2
  %13 = and i16 %.v1, %12
  %14 = lshr i16 %13, 0
  %15 = and i16 %14, -1
  store i16 %15, ptr %10, align 2
  br label %16

16:                                               ; preds = %3, %0
  ret void
}

define void @implCV_AND_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %26

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = and i8 %.v, %.v1
  %6 = lshr i8 %5, 0
  %7 = and i8 %6, -1
  store i8 %7, ptr %2, align 1
  %8 = getelementptr i8, ptr %rd, i32 1
  %9 = getelementptr i8, ptr %rs1, i32 1
  %10 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %9, align 1
  %.v3 = load i8, ptr %10, align 1
  %11 = and i8 %.v2, %.v3
  %12 = lshr i8 %11, 0
  %13 = and i8 %12, -1
  store i8 %13, ptr %8, align 1
  %14 = getelementptr i8, ptr %rd, i32 2
  %15 = getelementptr i8, ptr %rs1, i32 2
  %16 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %15, align 1
  %.v5 = load i8, ptr %16, align 1
  %17 = and i8 %.v4, %.v5
  %18 = lshr i8 %17, 0
  %19 = and i8 %18, -1
  store i8 %19, ptr %14, align 1
  %20 = getelementptr i8, ptr %rd, i32 3
  %21 = getelementptr i8, ptr %rs1, i32 3
  %22 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %21, align 1
  %.v7 = load i8, ptr %22, align 1
  %23 = and i8 %.v6, %.v7
  %24 = lshr i8 %23, 0
  %25 = and i8 %24, -1
  store i8 %25, ptr %20, align 1
  br label %26

26:                                               ; preds = %1, %0
  ret void
}

define void @implCV_AND_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %26

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %4 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %3, align 1
  %.v1 = load i8, ptr %4, align 1
  %5 = and i8 %.v, %.v1
  %6 = lshr i8 %5, 0
  %7 = and i8 %6, -1
  store i8 %7, ptr %2, align 1
  %8 = getelementptr i8, ptr %rd, i32 1
  %9 = getelementptr i8, ptr %rs1, i32 1
  %10 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %9, align 1
  %.v3 = load i8, ptr %10, align 1
  %11 = and i8 %.v2, %.v3
  %12 = lshr i8 %11, 0
  %13 = and i8 %12, -1
  store i8 %13, ptr %8, align 1
  %14 = getelementptr i8, ptr %rd, i32 2
  %15 = getelementptr i8, ptr %rs1, i32 2
  %16 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %15, align 1
  %.v5 = load i8, ptr %16, align 1
  %17 = and i8 %.v4, %.v5
  %18 = lshr i8 %17, 0
  %19 = and i8 %18, -1
  store i8 %19, ptr %14, align 1
  %20 = getelementptr i8, ptr %rd, i32 3
  %21 = getelementptr i8, ptr %rs1, i32 3
  %22 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %21, align 1
  %.v7 = load i8, ptr %22, align 1
  %23 = and i8 %.v6, %.v7
  %24 = lshr i8 %23, 0
  %25 = and i8 %24, -1
  store i8 %25, ptr %20, align 1
  br label %26

26:                                               ; preds = %1, %0
  ret void
}

define void @implCV_AND_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %28

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rd, i32 0
  %5 = getelementptr i8, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %5, align 1
  %7 = and i8 %.v, %6
  %8 = lshr i8 %7, 0
  %9 = and i8 %8, -1
  store i8 %9, ptr %4, align 1
  %10 = getelementptr i8, ptr %rd, i32 1
  %11 = getelementptr i8, ptr %rs1, i32 1
  %12 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %11, align 1
  %13 = and i8 %.v1, %12
  %14 = lshr i8 %13, 0
  %15 = and i8 %14, -1
  store i8 %15, ptr %10, align 1
  %16 = getelementptr i8, ptr %rd, i32 2
  %17 = getelementptr i8, ptr %rs1, i32 2
  %18 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %17, align 1
  %19 = and i8 %.v2, %18
  %20 = lshr i8 %19, 0
  %21 = and i8 %20, -1
  store i8 %21, ptr %16, align 1
  %22 = getelementptr i8, ptr %rd, i32 3
  %23 = getelementptr i8, ptr %rs1, i32 3
  %24 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %23, align 1
  %25 = and i8 %.v3, %24
  %26 = lshr i8 %25, 0
  %27 = and i8 %26, -1
  store i8 %27, ptr %22, align 1
  br label %28

28:                                               ; preds = %3, %0
  ret void
}

define void @implCV_ABS_H(ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %26

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %.v = load i16, ptr %3, align 2
  %4 = icmp slt i16 %.v, 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %.v1 = load i16, ptr %5, align 2
  %6 = zext i16 %.v1 to i17
  %7 = sub i17 0, %6
  %8 = lshr i17 %7, 0
  %9 = and i17 %8, 65535
  %10 = trunc i17 %9 to i16
  %11 = getelementptr i16, ptr %rs1, i32 0
  %.v2 = load i16, ptr %11, align 2
  %12 = icmp ne i1 %4, false
  %13 = select i1 %12, i16 %10, i16 %.v2
  store i16 %13, ptr %2, align 2
  %14 = getelementptr i16, ptr %rd, i32 1
  %15 = getelementptr i16, ptr %rs1, i32 1
  %.v3 = load i16, ptr %15, align 2
  %16 = icmp slt i16 %.v3, 0
  %17 = getelementptr i16, ptr %rs1, i32 1
  %.v4 = load i16, ptr %17, align 2
  %18 = zext i16 %.v4 to i17
  %19 = sub i17 0, %18
  %20 = lshr i17 %19, 0
  %21 = and i17 %20, 65535
  %22 = trunc i17 %21 to i16
  %23 = getelementptr i16, ptr %rs1, i32 1
  %.v5 = load i16, ptr %23, align 2
  %24 = icmp ne i1 %16, false
  %25 = select i1 %24, i16 %22, i16 %.v5
  store i16 %25, ptr %14, align 2
  br label %26

26:                                               ; preds = %1, %0
  ret void
}

define void @implCV_ABS_B(ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %50

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rd, i32 0
  %3 = getelementptr i8, ptr %rs1, i32 0
  %.v = load i8, ptr %3, align 1
  %4 = icmp slt i8 %.v, 0
  %5 = getelementptr i8, ptr %rs1, i32 0
  %.v1 = load i8, ptr %5, align 1
  %6 = zext i8 %.v1 to i9
  %7 = sub i9 0, %6
  %8 = lshr i9 %7, 0
  %9 = and i9 %8, 255
  %10 = trunc i9 %9 to i8
  %11 = getelementptr i8, ptr %rs1, i32 0
  %.v2 = load i8, ptr %11, align 1
  %12 = icmp ne i1 %4, false
  %13 = select i1 %12, i8 %10, i8 %.v2
  store i8 %13, ptr %2, align 1
  %14 = getelementptr i8, ptr %rd, i32 1
  %15 = getelementptr i8, ptr %rs1, i32 1
  %.v3 = load i8, ptr %15, align 1
  %16 = icmp slt i8 %.v3, 0
  %17 = getelementptr i8, ptr %rs1, i32 1
  %.v4 = load i8, ptr %17, align 1
  %18 = zext i8 %.v4 to i9
  %19 = sub i9 0, %18
  %20 = lshr i9 %19, 0
  %21 = and i9 %20, 255
  %22 = trunc i9 %21 to i8
  %23 = getelementptr i8, ptr %rs1, i32 1
  %.v5 = load i8, ptr %23, align 1
  %24 = icmp ne i1 %16, false
  %25 = select i1 %24, i8 %22, i8 %.v5
  store i8 %25, ptr %14, align 1
  %26 = getelementptr i8, ptr %rd, i32 2
  %27 = getelementptr i8, ptr %rs1, i32 2
  %.v6 = load i8, ptr %27, align 1
  %28 = icmp slt i8 %.v6, 0
  %29 = getelementptr i8, ptr %rs1, i32 2
  %.v7 = load i8, ptr %29, align 1
  %30 = zext i8 %.v7 to i9
  %31 = sub i9 0, %30
  %32 = lshr i9 %31, 0
  %33 = and i9 %32, 255
  %34 = trunc i9 %33 to i8
  %35 = getelementptr i8, ptr %rs1, i32 2
  %.v8 = load i8, ptr %35, align 1
  %36 = icmp ne i1 %28, false
  %37 = select i1 %36, i8 %34, i8 %.v8
  store i8 %37, ptr %26, align 1
  %38 = getelementptr i8, ptr %rd, i32 3
  %39 = getelementptr i8, ptr %rs1, i32 3
  %.v9 = load i8, ptr %39, align 1
  %40 = icmp slt i8 %.v9, 0
  %41 = getelementptr i8, ptr %rs1, i32 3
  %.v10 = load i8, ptr %41, align 1
  %42 = zext i8 %.v10 to i9
  %43 = sub i9 0, %42
  %44 = lshr i9 %43, 0
  %45 = and i9 %44, 255
  %46 = trunc i9 %45 to i8
  %47 = getelementptr i8, ptr %rs1, i32 3
  %.v11 = load i8, ptr %47, align 1
  %48 = icmp ne i1 %40, false
  %49 = select i1 %48, i8 %46, i8 %.v11
  store i8 %49, ptr %38, align 1
  br label %50

50:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTUP_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %16

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rs1, i32 0
  %3 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %2, align 2
  %.v1 = load i16, ptr %3, align 2
  %4 = zext i16 %.v to i32
  %5 = zext i16 %.v1 to i32
  %6 = mul i32 %4, %5
  %7 = getelementptr i16, ptr %rs1, i32 1
  %8 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %7, align 2
  %.v3 = load i16, ptr %8, align 2
  %9 = zext i16 %.v2 to i32
  %10 = zext i16 %.v3 to i32
  %11 = mul i32 %9, %10
  %12 = zext i32 %6 to i33
  %13 = zext i32 %11 to i33
  %14 = add i33 %12, %13
  %15 = trunc i33 %14 to i32
  store i32 %15, ptr %rd, align 4
  br label %16

16:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTUP_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %16

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rs1, i32 0
  %3 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %2, align 2
  %.v1 = load i16, ptr %3, align 2
  %4 = zext i16 %.v to i32
  %5 = zext i16 %.v1 to i32
  %6 = mul i32 %4, %5
  %7 = getelementptr i16, ptr %rs1, i32 1
  %8 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %7, align 2
  %.v3 = load i16, ptr %8, align 2
  %9 = zext i16 %.v2 to i32
  %10 = zext i16 %.v3 to i32
  %11 = mul i32 %9, %10
  %12 = zext i32 %6 to i33
  %13 = zext i32 %11 to i33
  %14 = add i33 %12, %13
  %15 = trunc i33 %14 to i32
  store i32 %15, ptr %rd, align 4
  br label %16

16:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTUP_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %18

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rs1, i32 0
  %5 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %4, align 2
  %6 = zext i16 %.v to i32
  %7 = zext i16 %5 to i32
  %8 = mul i32 %6, %7
  %9 = getelementptr i16, ptr %rs1, i32 1
  %10 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %9, align 2
  %11 = zext i16 %.v1 to i32
  %12 = zext i16 %10 to i32
  %13 = mul i32 %11, %12
  %14 = zext i32 %8 to i33
  %15 = zext i32 %13 to i33
  %16 = add i33 %14, %15
  %17 = trunc i33 %16 to i32
  store i32 %17, ptr %rd, align 4
  br label %18

18:                                               ; preds = %3, %0
  ret void
}

define void @implCV_DOTUP_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %32

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rs1, i32 0
  %3 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %2, align 1
  %.v1 = load i8, ptr %3, align 1
  %4 = zext i8 %.v to i16
  %5 = zext i8 %.v1 to i16
  %6 = mul i16 %4, %5
  %7 = getelementptr i8, ptr %rs1, i32 1
  %8 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %7, align 1
  %.v3 = load i8, ptr %8, align 1
  %9 = zext i8 %.v2 to i16
  %10 = zext i8 %.v3 to i16
  %11 = mul i16 %9, %10
  %12 = zext i16 %6 to i17
  %13 = zext i16 %11 to i17
  %14 = add i17 %12, %13
  %15 = getelementptr i8, ptr %rs1, i32 2
  %16 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %15, align 1
  %.v5 = load i8, ptr %16, align 1
  %17 = zext i8 %.v4 to i16
  %18 = zext i8 %.v5 to i16
  %19 = mul i16 %17, %18
  %20 = zext i17 %14 to i18
  %21 = zext i16 %19 to i18
  %22 = add i18 %20, %21
  %23 = getelementptr i8, ptr %rs1, i32 3
  %24 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %23, align 1
  %.v7 = load i8, ptr %24, align 1
  %25 = zext i8 %.v6 to i16
  %26 = zext i8 %.v7 to i16
  %27 = mul i16 %25, %26
  %28 = zext i18 %22 to i19
  %29 = zext i16 %27 to i19
  %30 = add i19 %28, %29
  %31 = zext i19 %30 to i32
  store i32 %31, ptr %rd, align 4
  br label %32

32:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTUP_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %32

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rs1, i32 0
  %3 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %2, align 1
  %.v1 = load i8, ptr %3, align 1
  %4 = zext i8 %.v to i16
  %5 = zext i8 %.v1 to i16
  %6 = mul i16 %4, %5
  %7 = getelementptr i8, ptr %rs1, i32 1
  %8 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %7, align 1
  %.v3 = load i8, ptr %8, align 1
  %9 = zext i8 %.v2 to i16
  %10 = zext i8 %.v3 to i16
  %11 = mul i16 %9, %10
  %12 = zext i16 %6 to i17
  %13 = zext i16 %11 to i17
  %14 = add i17 %12, %13
  %15 = getelementptr i8, ptr %rs1, i32 2
  %16 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %15, align 1
  %.v5 = load i8, ptr %16, align 1
  %17 = zext i8 %.v4 to i16
  %18 = zext i8 %.v5 to i16
  %19 = mul i16 %17, %18
  %20 = zext i17 %14 to i18
  %21 = zext i16 %19 to i18
  %22 = add i18 %20, %21
  %23 = getelementptr i8, ptr %rs1, i32 3
  %24 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %23, align 1
  %.v7 = load i8, ptr %24, align 1
  %25 = zext i8 %.v6 to i16
  %26 = zext i8 %.v7 to i16
  %27 = mul i16 %25, %26
  %28 = zext i18 %22 to i19
  %29 = zext i16 %27 to i19
  %30 = add i19 %28, %29
  %31 = zext i19 %30 to i32
  store i32 %31, ptr %rd, align 4
  br label %32

32:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTUP_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %34

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rs1, i32 0
  %5 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %4, align 1
  %6 = zext i8 %.v to i16
  %7 = zext i8 %5 to i16
  %8 = mul i16 %6, %7
  %9 = getelementptr i8, ptr %rs1, i32 1
  %10 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %9, align 1
  %11 = zext i8 %.v1 to i16
  %12 = zext i8 %10 to i16
  %13 = mul i16 %11, %12
  %14 = zext i16 %8 to i17
  %15 = zext i16 %13 to i17
  %16 = add i17 %14, %15
  %17 = getelementptr i8, ptr %rs1, i32 2
  %18 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %17, align 1
  %19 = zext i8 %.v2 to i16
  %20 = zext i8 %18 to i16
  %21 = mul i16 %19, %20
  %22 = zext i17 %16 to i18
  %23 = zext i16 %21 to i18
  %24 = add i18 %22, %23
  %25 = getelementptr i8, ptr %rs1, i32 3
  %26 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %25, align 1
  %27 = zext i8 %.v3 to i16
  %28 = zext i8 %26 to i16
  %29 = mul i16 %27, %28
  %30 = zext i18 %24 to i19
  %31 = zext i16 %29 to i19
  %32 = add i19 %30, %31
  %33 = zext i19 %32 to i32
  store i32 %33, ptr %rd, align 4
  br label %34

34:                                               ; preds = %3, %0
  ret void
}

define void @implCV_DOTUSP_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %16

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rs1, i32 0
  %3 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %2, align 2
  %.v1 = load i16, ptr %3, align 2
  %4 = zext i16 %.v to i32
  %5 = sext i16 %.v1 to i32
  %6 = mul i32 %4, %5
  %7 = getelementptr i16, ptr %rs1, i32 1
  %8 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %7, align 2
  %.v3 = load i16, ptr %8, align 2
  %9 = zext i16 %.v2 to i32
  %10 = sext i16 %.v3 to i32
  %11 = mul i32 %9, %10
  %12 = sext i32 %6 to i33
  %13 = sext i32 %11 to i33
  %14 = add i33 %12, %13
  %15 = trunc i33 %14 to i32
  store i32 %15, ptr %rd, align 4
  br label %16

16:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTUSP_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %16

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rs1, i32 0
  %3 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %2, align 2
  %.v1 = load i16, ptr %3, align 2
  %4 = zext i16 %.v to i32
  %5 = sext i16 %.v1 to i32
  %6 = mul i32 %4, %5
  %7 = getelementptr i16, ptr %rs1, i32 1
  %8 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %7, align 2
  %.v3 = load i16, ptr %8, align 2
  %9 = zext i16 %.v2 to i32
  %10 = sext i16 %.v3 to i32
  %11 = mul i32 %9, %10
  %12 = sext i32 %6 to i33
  %13 = sext i32 %11 to i33
  %14 = add i33 %12, %13
  %15 = trunc i33 %14 to i32
  store i32 %15, ptr %rd, align 4
  br label %16

16:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTUSP_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %18

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rs1, i32 0
  %5 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %4, align 2
  %6 = zext i16 %.v to i32
  %7 = sext i16 %5 to i32
  %8 = mul i32 %6, %7
  %9 = getelementptr i16, ptr %rs1, i32 1
  %10 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %9, align 2
  %11 = zext i16 %.v1 to i32
  %12 = sext i16 %10 to i32
  %13 = mul i32 %11, %12
  %14 = sext i32 %8 to i33
  %15 = sext i32 %13 to i33
  %16 = add i33 %14, %15
  %17 = trunc i33 %16 to i32
  store i32 %17, ptr %rd, align 4
  br label %18

18:                                               ; preds = %3, %0
  ret void
}

define void @implCV_DOTUSP_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %32

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rs1, i32 0
  %3 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %2, align 1
  %.v1 = load i8, ptr %3, align 1
  %4 = zext i8 %.v to i16
  %5 = sext i8 %.v1 to i16
  %6 = mul i16 %4, %5
  %7 = getelementptr i8, ptr %rs1, i32 1
  %8 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %7, align 1
  %.v3 = load i8, ptr %8, align 1
  %9 = zext i8 %.v2 to i16
  %10 = sext i8 %.v3 to i16
  %11 = mul i16 %9, %10
  %12 = sext i16 %6 to i17
  %13 = sext i16 %11 to i17
  %14 = add i17 %12, %13
  %15 = getelementptr i8, ptr %rs1, i32 2
  %16 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %15, align 1
  %.v5 = load i8, ptr %16, align 1
  %17 = zext i8 %.v4 to i16
  %18 = sext i8 %.v5 to i16
  %19 = mul i16 %17, %18
  %20 = sext i17 %14 to i18
  %21 = sext i16 %19 to i18
  %22 = add i18 %20, %21
  %23 = getelementptr i8, ptr %rs1, i32 3
  %24 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %23, align 1
  %.v7 = load i8, ptr %24, align 1
  %25 = zext i8 %.v6 to i16
  %26 = sext i8 %.v7 to i16
  %27 = mul i16 %25, %26
  %28 = sext i18 %22 to i19
  %29 = sext i16 %27 to i19
  %30 = add i19 %28, %29
  %31 = sext i19 %30 to i32
  store i32 %31, ptr %rd, align 4
  br label %32

32:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTUSP_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %32

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rs1, i32 0
  %3 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %2, align 1
  %.v1 = load i8, ptr %3, align 1
  %4 = zext i8 %.v to i16
  %5 = sext i8 %.v1 to i16
  %6 = mul i16 %4, %5
  %7 = getelementptr i8, ptr %rs1, i32 1
  %8 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %7, align 1
  %.v3 = load i8, ptr %8, align 1
  %9 = zext i8 %.v2 to i16
  %10 = sext i8 %.v3 to i16
  %11 = mul i16 %9, %10
  %12 = sext i16 %6 to i17
  %13 = sext i16 %11 to i17
  %14 = add i17 %12, %13
  %15 = getelementptr i8, ptr %rs1, i32 2
  %16 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %15, align 1
  %.v5 = load i8, ptr %16, align 1
  %17 = zext i8 %.v4 to i16
  %18 = sext i8 %.v5 to i16
  %19 = mul i16 %17, %18
  %20 = sext i17 %14 to i18
  %21 = sext i16 %19 to i18
  %22 = add i18 %20, %21
  %23 = getelementptr i8, ptr %rs1, i32 3
  %24 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %23, align 1
  %.v7 = load i8, ptr %24, align 1
  %25 = zext i8 %.v6 to i16
  %26 = sext i8 %.v7 to i16
  %27 = mul i16 %25, %26
  %28 = sext i18 %22 to i19
  %29 = sext i16 %27 to i19
  %30 = add i19 %28, %29
  %31 = sext i19 %30 to i32
  store i32 %31, ptr %rd, align 4
  br label %32

32:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTUSP_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %34

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rs1, i32 0
  %5 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %4, align 1
  %6 = zext i8 %.v to i16
  %7 = sext i8 %5 to i16
  %8 = mul i16 %6, %7
  %9 = getelementptr i8, ptr %rs1, i32 1
  %10 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %9, align 1
  %11 = zext i8 %.v1 to i16
  %12 = sext i8 %10 to i16
  %13 = mul i16 %11, %12
  %14 = sext i16 %8 to i17
  %15 = sext i16 %13 to i17
  %16 = add i17 %14, %15
  %17 = getelementptr i8, ptr %rs1, i32 2
  %18 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %17, align 1
  %19 = zext i8 %.v2 to i16
  %20 = sext i8 %18 to i16
  %21 = mul i16 %19, %20
  %22 = sext i17 %16 to i18
  %23 = sext i16 %21 to i18
  %24 = add i18 %22, %23
  %25 = getelementptr i8, ptr %rs1, i32 3
  %26 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %25, align 1
  %27 = zext i8 %.v3 to i16
  %28 = sext i8 %26 to i16
  %29 = mul i16 %27, %28
  %30 = sext i18 %24 to i19
  %31 = sext i16 %29 to i19
  %32 = add i19 %30, %31
  %33 = sext i19 %32 to i32
  store i32 %33, ptr %rd, align 4
  br label %34

34:                                               ; preds = %3, %0
  ret void
}

define void @implCV_DOTSP_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %16

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rs1, i32 0
  %3 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %2, align 2
  %.v1 = load i16, ptr %3, align 2
  %4 = sext i16 %.v to i32
  %5 = sext i16 %.v1 to i32
  %6 = mul i32 %4, %5
  %7 = getelementptr i16, ptr %rs1, i32 1
  %8 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %7, align 2
  %.v3 = load i16, ptr %8, align 2
  %9 = sext i16 %.v2 to i32
  %10 = sext i16 %.v3 to i32
  %11 = mul i32 %9, %10
  %12 = sext i32 %6 to i33
  %13 = sext i32 %11 to i33
  %14 = add i33 %12, %13
  %15 = trunc i33 %14 to i32
  store i32 %15, ptr %rd, align 4
  br label %16

16:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTSP_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %16

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rs1, i32 0
  %3 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %2, align 2
  %.v1 = load i16, ptr %3, align 2
  %4 = sext i16 %.v to i32
  %5 = sext i16 %.v1 to i32
  %6 = mul i32 %4, %5
  %7 = getelementptr i16, ptr %rs1, i32 1
  %8 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %7, align 2
  %.v3 = load i16, ptr %8, align 2
  %9 = sext i16 %.v2 to i32
  %10 = sext i16 %.v3 to i32
  %11 = mul i32 %9, %10
  %12 = sext i32 %6 to i33
  %13 = sext i32 %11 to i33
  %14 = add i33 %12, %13
  %15 = trunc i33 %14 to i32
  store i32 %15, ptr %rd, align 4
  br label %16

16:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTSP_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %18

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rs1, i32 0
  %5 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %4, align 2
  %6 = sext i16 %.v to i32
  %7 = sext i16 %5 to i32
  %8 = mul i32 %6, %7
  %9 = getelementptr i16, ptr %rs1, i32 1
  %10 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %9, align 2
  %11 = sext i16 %.v1 to i32
  %12 = sext i16 %10 to i32
  %13 = mul i32 %11, %12
  %14 = sext i32 %8 to i33
  %15 = sext i32 %13 to i33
  %16 = add i33 %14, %15
  %17 = trunc i33 %16 to i32
  store i32 %17, ptr %rd, align 4
  br label %18

18:                                               ; preds = %3, %0
  ret void
}

define void @implCV_DOTSP_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %32

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rs1, i32 0
  %3 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %2, align 1
  %.v1 = load i8, ptr %3, align 1
  %4 = sext i8 %.v to i16
  %5 = sext i8 %.v1 to i16
  %6 = mul i16 %4, %5
  %7 = getelementptr i8, ptr %rs1, i32 1
  %8 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %7, align 1
  %.v3 = load i8, ptr %8, align 1
  %9 = sext i8 %.v2 to i16
  %10 = sext i8 %.v3 to i16
  %11 = mul i16 %9, %10
  %12 = sext i16 %6 to i17
  %13 = sext i16 %11 to i17
  %14 = add i17 %12, %13
  %15 = getelementptr i8, ptr %rs1, i32 2
  %16 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %15, align 1
  %.v5 = load i8, ptr %16, align 1
  %17 = sext i8 %.v4 to i16
  %18 = sext i8 %.v5 to i16
  %19 = mul i16 %17, %18
  %20 = sext i17 %14 to i18
  %21 = sext i16 %19 to i18
  %22 = add i18 %20, %21
  %23 = getelementptr i8, ptr %rs1, i32 3
  %24 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %23, align 1
  %.v7 = load i8, ptr %24, align 1
  %25 = sext i8 %.v6 to i16
  %26 = sext i8 %.v7 to i16
  %27 = mul i16 %25, %26
  %28 = sext i18 %22 to i19
  %29 = sext i16 %27 to i19
  %30 = add i19 %28, %29
  %31 = sext i19 %30 to i32
  store i32 %31, ptr %rd, align 4
  br label %32

32:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTSP_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %32

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rs1, i32 0
  %3 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %2, align 1
  %.v1 = load i8, ptr %3, align 1
  %4 = sext i8 %.v to i16
  %5 = sext i8 %.v1 to i16
  %6 = mul i16 %4, %5
  %7 = getelementptr i8, ptr %rs1, i32 1
  %8 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %7, align 1
  %.v3 = load i8, ptr %8, align 1
  %9 = sext i8 %.v2 to i16
  %10 = sext i8 %.v3 to i16
  %11 = mul i16 %9, %10
  %12 = sext i16 %6 to i17
  %13 = sext i16 %11 to i17
  %14 = add i17 %12, %13
  %15 = getelementptr i8, ptr %rs1, i32 2
  %16 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %15, align 1
  %.v5 = load i8, ptr %16, align 1
  %17 = sext i8 %.v4 to i16
  %18 = sext i8 %.v5 to i16
  %19 = mul i16 %17, %18
  %20 = sext i17 %14 to i18
  %21 = sext i16 %19 to i18
  %22 = add i18 %20, %21
  %23 = getelementptr i8, ptr %rs1, i32 3
  %24 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %23, align 1
  %.v7 = load i8, ptr %24, align 1
  %25 = sext i8 %.v6 to i16
  %26 = sext i8 %.v7 to i16
  %27 = mul i16 %25, %26
  %28 = sext i18 %22 to i19
  %29 = sext i16 %27 to i19
  %30 = add i19 %28, %29
  %31 = sext i19 %30 to i32
  store i32 %31, ptr %rd, align 4
  br label %32

32:                                               ; preds = %1, %0
  ret void
}

define void @implCV_DOTSP_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %34

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rs1, i32 0
  %5 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %4, align 1
  %6 = sext i8 %.v to i16
  %7 = sext i8 %5 to i16
  %8 = mul i16 %6, %7
  %9 = getelementptr i8, ptr %rs1, i32 1
  %10 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %9, align 1
  %11 = sext i8 %.v1 to i16
  %12 = sext i8 %10 to i16
  %13 = mul i16 %11, %12
  %14 = sext i16 %8 to i17
  %15 = sext i16 %13 to i17
  %16 = add i17 %14, %15
  %17 = getelementptr i8, ptr %rs1, i32 2
  %18 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %17, align 1
  %19 = sext i8 %.v2 to i16
  %20 = sext i8 %18 to i16
  %21 = mul i16 %19, %20
  %22 = sext i17 %16 to i18
  %23 = sext i16 %21 to i18
  %24 = add i18 %22, %23
  %25 = getelementptr i8, ptr %rs1, i32 3
  %26 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %25, align 1
  %27 = sext i8 %.v3 to i16
  %28 = sext i8 %26 to i16
  %29 = mul i16 %27, %28
  %30 = sext i18 %24 to i19
  %31 = sext i16 %29 to i19
  %32 = add i19 %30, %31
  %33 = sext i19 %32 to i32
  store i32 %33, ptr %rd, align 4
  br label %34

34:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SDOTUP_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %19

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rs1, i32 0
  %3 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %2, align 2
  %.v1 = load i16, ptr %3, align 2
  %4 = zext i16 %.v to i32
  %5 = zext i16 %.v1 to i32
  %6 = mul i32 %4, %5
  %rd.v = load i32, ptr %rd, align 4
  %7 = zext i32 %rd.v to i33
  %8 = zext i32 %6 to i33
  %9 = add i33 %7, %8
  %10 = getelementptr i16, ptr %rs1, i32 1
  %11 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %10, align 2
  %.v3 = load i16, ptr %11, align 2
  %12 = zext i16 %.v2 to i32
  %13 = zext i16 %.v3 to i32
  %14 = mul i32 %12, %13
  %15 = zext i33 %9 to i34
  %16 = zext i32 %14 to i34
  %17 = add i34 %15, %16
  %18 = trunc i34 %17 to i32
  store i32 %18, ptr %rd, align 4
  br label %19

19:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SDOTUP_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %19

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rs1, i32 0
  %3 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %2, align 2
  %.v1 = load i16, ptr %3, align 2
  %4 = zext i16 %.v to i32
  %5 = zext i16 %.v1 to i32
  %6 = mul i32 %4, %5
  %rd.v = load i32, ptr %rd, align 4
  %7 = zext i32 %rd.v to i33
  %8 = zext i32 %6 to i33
  %9 = add i33 %7, %8
  %10 = getelementptr i16, ptr %rs1, i32 1
  %11 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %10, align 2
  %.v3 = load i16, ptr %11, align 2
  %12 = zext i16 %.v2 to i32
  %13 = zext i16 %.v3 to i32
  %14 = mul i32 %12, %13
  %15 = zext i33 %9 to i34
  %16 = zext i32 %14 to i34
  %17 = add i34 %15, %16
  %18 = trunc i34 %17 to i32
  store i32 %18, ptr %rd, align 4
  br label %19

19:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SDOTUP_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %21

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rs1, i32 0
  %5 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %4, align 2
  %6 = zext i16 %.v to i32
  %7 = zext i16 %5 to i32
  %8 = mul i32 %6, %7
  %rd.v = load i32, ptr %rd, align 4
  %9 = zext i32 %rd.v to i33
  %10 = zext i32 %8 to i33
  %11 = add i33 %9, %10
  %12 = getelementptr i16, ptr %rs1, i32 1
  %13 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %12, align 2
  %14 = zext i16 %.v1 to i32
  %15 = zext i16 %13 to i32
  %16 = mul i32 %14, %15
  %17 = zext i33 %11 to i34
  %18 = zext i32 %16 to i34
  %19 = add i34 %17, %18
  %20 = trunc i34 %19 to i32
  store i32 %20, ptr %rd, align 4
  br label %21

21:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SDOTUP_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %35

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rs1, i32 0
  %3 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %2, align 1
  %.v1 = load i8, ptr %3, align 1
  %4 = zext i8 %.v to i16
  %5 = zext i8 %.v1 to i16
  %6 = mul i16 %4, %5
  %rd.v = load i32, ptr %rd, align 4
  %7 = zext i32 %rd.v to i33
  %8 = zext i16 %6 to i33
  %9 = add i33 %7, %8
  %10 = getelementptr i8, ptr %rs1, i32 1
  %11 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %10, align 1
  %.v3 = load i8, ptr %11, align 1
  %12 = zext i8 %.v2 to i16
  %13 = zext i8 %.v3 to i16
  %14 = mul i16 %12, %13
  %15 = zext i33 %9 to i34
  %16 = zext i16 %14 to i34
  %17 = add i34 %15, %16
  %18 = getelementptr i8, ptr %rs1, i32 2
  %19 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %18, align 1
  %.v5 = load i8, ptr %19, align 1
  %20 = zext i8 %.v4 to i16
  %21 = zext i8 %.v5 to i16
  %22 = mul i16 %20, %21
  %23 = zext i34 %17 to i35
  %24 = zext i16 %22 to i35
  %25 = add i35 %23, %24
  %26 = getelementptr i8, ptr %rs1, i32 3
  %27 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %26, align 1
  %.v7 = load i8, ptr %27, align 1
  %28 = zext i8 %.v6 to i16
  %29 = zext i8 %.v7 to i16
  %30 = mul i16 %28, %29
  %31 = zext i35 %25 to i36
  %32 = zext i16 %30 to i36
  %33 = add i36 %31, %32
  %34 = trunc i36 %33 to i32
  store i32 %34, ptr %rd, align 4
  br label %35

35:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SDOTUP_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %35

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rs1, i32 0
  %3 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %2, align 1
  %.v1 = load i8, ptr %3, align 1
  %4 = zext i8 %.v to i16
  %5 = zext i8 %.v1 to i16
  %6 = mul i16 %4, %5
  %rd.v = load i32, ptr %rd, align 4
  %7 = zext i32 %rd.v to i33
  %8 = zext i16 %6 to i33
  %9 = add i33 %7, %8
  %10 = getelementptr i8, ptr %rs1, i32 1
  %11 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %10, align 1
  %.v3 = load i8, ptr %11, align 1
  %12 = zext i8 %.v2 to i16
  %13 = zext i8 %.v3 to i16
  %14 = mul i16 %12, %13
  %15 = zext i33 %9 to i34
  %16 = zext i16 %14 to i34
  %17 = add i34 %15, %16
  %18 = getelementptr i8, ptr %rs1, i32 2
  %19 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %18, align 1
  %.v5 = load i8, ptr %19, align 1
  %20 = zext i8 %.v4 to i16
  %21 = zext i8 %.v5 to i16
  %22 = mul i16 %20, %21
  %23 = zext i34 %17 to i35
  %24 = zext i16 %22 to i35
  %25 = add i35 %23, %24
  %26 = getelementptr i8, ptr %rs1, i32 3
  %27 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %26, align 1
  %.v7 = load i8, ptr %27, align 1
  %28 = zext i8 %.v6 to i16
  %29 = zext i8 %.v7 to i16
  %30 = mul i16 %28, %29
  %31 = zext i35 %25 to i36
  %32 = zext i16 %30 to i36
  %33 = add i36 %31, %32
  %34 = trunc i36 %33 to i32
  store i32 %34, ptr %rd, align 4
  br label %35

35:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SDOTUP_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %37

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rs1, i32 0
  %5 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %4, align 1
  %6 = zext i8 %.v to i16
  %7 = zext i8 %5 to i16
  %8 = mul i16 %6, %7
  %rd.v = load i32, ptr %rd, align 4
  %9 = zext i32 %rd.v to i33
  %10 = zext i16 %8 to i33
  %11 = add i33 %9, %10
  %12 = getelementptr i8, ptr %rs1, i32 1
  %13 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %12, align 1
  %14 = zext i8 %.v1 to i16
  %15 = zext i8 %13 to i16
  %16 = mul i16 %14, %15
  %17 = zext i33 %11 to i34
  %18 = zext i16 %16 to i34
  %19 = add i34 %17, %18
  %20 = getelementptr i8, ptr %rs1, i32 2
  %21 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %20, align 1
  %22 = zext i8 %.v2 to i16
  %23 = zext i8 %21 to i16
  %24 = mul i16 %22, %23
  %25 = zext i34 %19 to i35
  %26 = zext i16 %24 to i35
  %27 = add i35 %25, %26
  %28 = getelementptr i8, ptr %rs1, i32 3
  %29 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %28, align 1
  %30 = zext i8 %.v3 to i16
  %31 = zext i8 %29 to i16
  %32 = mul i16 %30, %31
  %33 = zext i35 %27 to i36
  %34 = zext i16 %32 to i36
  %35 = add i36 %33, %34
  %36 = trunc i36 %35 to i32
  store i32 %36, ptr %rd, align 4
  br label %37

37:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SDOTUSP_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %19

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rs1, i32 0
  %3 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %2, align 2
  %.v1 = load i16, ptr %3, align 2
  %4 = zext i16 %.v to i32
  %5 = sext i16 %.v1 to i32
  %6 = mul i32 %4, %5
  %rd.v = load i32, ptr %rd, align 4
  %7 = zext i32 %rd.v to i34
  %8 = sext i32 %6 to i34
  %9 = add i34 %7, %8
  %10 = getelementptr i16, ptr %rs1, i32 1
  %11 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %10, align 2
  %.v3 = load i16, ptr %11, align 2
  %12 = zext i16 %.v2 to i32
  %13 = sext i16 %.v3 to i32
  %14 = mul i32 %12, %13
  %15 = sext i34 %9 to i35
  %16 = sext i32 %14 to i35
  %17 = add i35 %15, %16
  %18 = trunc i35 %17 to i32
  store i32 %18, ptr %rd, align 4
  br label %19

19:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SDOTUSP_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %19

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rs1, i32 0
  %3 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %2, align 2
  %.v1 = load i16, ptr %3, align 2
  %4 = zext i16 %.v to i32
  %5 = sext i16 %.v1 to i32
  %6 = mul i32 %4, %5
  %rd.v = load i32, ptr %rd, align 4
  %7 = zext i32 %rd.v to i34
  %8 = sext i32 %6 to i34
  %9 = add i34 %7, %8
  %10 = getelementptr i16, ptr %rs1, i32 1
  %11 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %10, align 2
  %.v3 = load i16, ptr %11, align 2
  %12 = zext i16 %.v2 to i32
  %13 = sext i16 %.v3 to i32
  %14 = mul i32 %12, %13
  %15 = sext i34 %9 to i35
  %16 = sext i32 %14 to i35
  %17 = add i35 %15, %16
  %18 = trunc i35 %17 to i32
  store i32 %18, ptr %rd, align 4
  br label %19

19:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SDOTUSP_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %21

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rs1, i32 0
  %5 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %4, align 2
  %6 = zext i16 %.v to i32
  %7 = sext i16 %5 to i32
  %8 = mul i32 %6, %7
  %rd.v = load i32, ptr %rd, align 4
  %9 = zext i32 %rd.v to i34
  %10 = sext i32 %8 to i34
  %11 = add i34 %9, %10
  %12 = getelementptr i16, ptr %rs1, i32 1
  %13 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %12, align 2
  %14 = zext i16 %.v1 to i32
  %15 = sext i16 %13 to i32
  %16 = mul i32 %14, %15
  %17 = sext i34 %11 to i35
  %18 = sext i32 %16 to i35
  %19 = add i35 %17, %18
  %20 = trunc i35 %19 to i32
  store i32 %20, ptr %rd, align 4
  br label %21

21:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SDOTUSP_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %35

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rs1, i32 0
  %3 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %2, align 1
  %.v1 = load i8, ptr %3, align 1
  %4 = zext i8 %.v to i16
  %5 = sext i8 %.v1 to i16
  %6 = mul i16 %4, %5
  %rd.v = load i32, ptr %rd, align 4
  %7 = zext i32 %rd.v to i34
  %8 = sext i16 %6 to i34
  %9 = add i34 %7, %8
  %10 = getelementptr i8, ptr %rs1, i32 1
  %11 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %10, align 1
  %.v3 = load i8, ptr %11, align 1
  %12 = zext i8 %.v2 to i16
  %13 = sext i8 %.v3 to i16
  %14 = mul i16 %12, %13
  %15 = sext i34 %9 to i35
  %16 = sext i16 %14 to i35
  %17 = add i35 %15, %16
  %18 = getelementptr i8, ptr %rs1, i32 2
  %19 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %18, align 1
  %.v5 = load i8, ptr %19, align 1
  %20 = zext i8 %.v4 to i16
  %21 = sext i8 %.v5 to i16
  %22 = mul i16 %20, %21
  %23 = sext i35 %17 to i36
  %24 = sext i16 %22 to i36
  %25 = add i36 %23, %24
  %26 = getelementptr i8, ptr %rs1, i32 3
  %27 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %26, align 1
  %.v7 = load i8, ptr %27, align 1
  %28 = zext i8 %.v6 to i16
  %29 = sext i8 %.v7 to i16
  %30 = mul i16 %28, %29
  %31 = sext i36 %25 to i37
  %32 = sext i16 %30 to i37
  %33 = add i37 %31, %32
  %34 = trunc i37 %33 to i32
  store i32 %34, ptr %rd, align 4
  br label %35

35:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SDOTUSP_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %35

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rs1, i32 0
  %3 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %2, align 1
  %.v1 = load i8, ptr %3, align 1
  %4 = zext i8 %.v to i16
  %5 = sext i8 %.v1 to i16
  %6 = mul i16 %4, %5
  %rd.v = load i32, ptr %rd, align 4
  %7 = zext i32 %rd.v to i34
  %8 = sext i16 %6 to i34
  %9 = add i34 %7, %8
  %10 = getelementptr i8, ptr %rs1, i32 1
  %11 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %10, align 1
  %.v3 = load i8, ptr %11, align 1
  %12 = zext i8 %.v2 to i16
  %13 = sext i8 %.v3 to i16
  %14 = mul i16 %12, %13
  %15 = sext i34 %9 to i35
  %16 = sext i16 %14 to i35
  %17 = add i35 %15, %16
  %18 = getelementptr i8, ptr %rs1, i32 2
  %19 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %18, align 1
  %.v5 = load i8, ptr %19, align 1
  %20 = zext i8 %.v4 to i16
  %21 = sext i8 %.v5 to i16
  %22 = mul i16 %20, %21
  %23 = sext i35 %17 to i36
  %24 = sext i16 %22 to i36
  %25 = add i36 %23, %24
  %26 = getelementptr i8, ptr %rs1, i32 3
  %27 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %26, align 1
  %.v7 = load i8, ptr %27, align 1
  %28 = zext i8 %.v6 to i16
  %29 = sext i8 %.v7 to i16
  %30 = mul i16 %28, %29
  %31 = sext i36 %25 to i37
  %32 = sext i16 %30 to i37
  %33 = add i37 %31, %32
  %34 = trunc i37 %33 to i32
  store i32 %34, ptr %rd, align 4
  br label %35

35:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SDOTUSP_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %37

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rs1, i32 0
  %5 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %4, align 1
  %6 = zext i8 %.v to i16
  %7 = sext i8 %5 to i16
  %8 = mul i16 %6, %7
  %rd.v = load i32, ptr %rd, align 4
  %9 = zext i32 %rd.v to i34
  %10 = sext i16 %8 to i34
  %11 = add i34 %9, %10
  %12 = getelementptr i8, ptr %rs1, i32 1
  %13 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %12, align 1
  %14 = zext i8 %.v1 to i16
  %15 = sext i8 %13 to i16
  %16 = mul i16 %14, %15
  %17 = sext i34 %11 to i35
  %18 = sext i16 %16 to i35
  %19 = add i35 %17, %18
  %20 = getelementptr i8, ptr %rs1, i32 2
  %21 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %20, align 1
  %22 = zext i8 %.v2 to i16
  %23 = sext i8 %21 to i16
  %24 = mul i16 %22, %23
  %25 = sext i35 %19 to i36
  %26 = sext i16 %24 to i36
  %27 = add i36 %25, %26
  %28 = getelementptr i8, ptr %rs1, i32 3
  %29 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %28, align 1
  %30 = zext i8 %.v3 to i16
  %31 = sext i8 %29 to i16
  %32 = mul i16 %30, %31
  %33 = sext i36 %27 to i37
  %34 = sext i16 %32 to i37
  %35 = add i37 %33, %34
  %36 = trunc i37 %35 to i32
  store i32 %36, ptr %rd, align 4
  br label %37

37:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SDOTSP_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %19

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rs1, i32 0
  %3 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %2, align 2
  %.v1 = load i16, ptr %3, align 2
  %4 = sext i16 %.v to i32
  %5 = sext i16 %.v1 to i32
  %6 = mul i32 %4, %5
  %rd.v = load i32, ptr %rd, align 4
  %7 = zext i32 %rd.v to i34
  %8 = sext i32 %6 to i34
  %9 = add i34 %7, %8
  %10 = getelementptr i16, ptr %rs1, i32 1
  %11 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %10, align 2
  %.v3 = load i16, ptr %11, align 2
  %12 = sext i16 %.v2 to i32
  %13 = sext i16 %.v3 to i32
  %14 = mul i32 %12, %13
  %15 = sext i34 %9 to i35
  %16 = sext i32 %14 to i35
  %17 = add i35 %15, %16
  %18 = trunc i35 %17 to i32
  store i32 %18, ptr %rd, align 4
  br label %19

19:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SDOTSP_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %19

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rs1, i32 0
  %3 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %2, align 2
  %.v1 = load i16, ptr %3, align 2
  %4 = sext i16 %.v to i32
  %5 = sext i16 %.v1 to i32
  %6 = mul i32 %4, %5
  %rd.v = load i32, ptr %rd, align 4
  %7 = zext i32 %rd.v to i34
  %8 = sext i32 %6 to i34
  %9 = add i34 %7, %8
  %10 = getelementptr i16, ptr %rs1, i32 1
  %11 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %10, align 2
  %.v3 = load i16, ptr %11, align 2
  %12 = sext i16 %.v2 to i32
  %13 = sext i16 %.v3 to i32
  %14 = mul i32 %12, %13
  %15 = sext i34 %9 to i35
  %16 = sext i32 %14 to i35
  %17 = add i35 %15, %16
  %18 = trunc i35 %17 to i32
  store i32 %18, ptr %rd, align 4
  br label %19

19:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SDOTSP_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %21

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rs1, i32 0
  %5 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %4, align 2
  %6 = sext i16 %.v to i32
  %7 = sext i16 %5 to i32
  %8 = mul i32 %6, %7
  %rd.v = load i32, ptr %rd, align 4
  %9 = zext i32 %rd.v to i34
  %10 = sext i32 %8 to i34
  %11 = add i34 %9, %10
  %12 = getelementptr i16, ptr %rs1, i32 1
  %13 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %12, align 2
  %14 = sext i16 %.v1 to i32
  %15 = sext i16 %13 to i32
  %16 = mul i32 %14, %15
  %17 = sext i34 %11 to i35
  %18 = sext i32 %16 to i35
  %19 = add i35 %17, %18
  %20 = trunc i35 %19 to i32
  store i32 %20, ptr %rd, align 4
  br label %21

21:                                               ; preds = %3, %0
  ret void
}

define void @implCV_SDOTSP_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %35

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rs1, i32 0
  %3 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %2, align 1
  %.v1 = load i8, ptr %3, align 1
  %4 = sext i8 %.v to i16
  %5 = sext i8 %.v1 to i16
  %6 = mul i16 %4, %5
  %rd.v = load i32, ptr %rd, align 4
  %7 = zext i32 %rd.v to i34
  %8 = sext i16 %6 to i34
  %9 = add i34 %7, %8
  %10 = getelementptr i8, ptr %rs1, i32 1
  %11 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %10, align 1
  %.v3 = load i8, ptr %11, align 1
  %12 = sext i8 %.v2 to i16
  %13 = sext i8 %.v3 to i16
  %14 = mul i16 %12, %13
  %15 = sext i34 %9 to i35
  %16 = sext i16 %14 to i35
  %17 = add i35 %15, %16
  %18 = getelementptr i8, ptr %rs1, i32 2
  %19 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %18, align 1
  %.v5 = load i8, ptr %19, align 1
  %20 = sext i8 %.v4 to i16
  %21 = sext i8 %.v5 to i16
  %22 = mul i16 %20, %21
  %23 = sext i35 %17 to i36
  %24 = sext i16 %22 to i36
  %25 = add i36 %23, %24
  %26 = getelementptr i8, ptr %rs1, i32 3
  %27 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %26, align 1
  %.v7 = load i8, ptr %27, align 1
  %28 = sext i8 %.v6 to i16
  %29 = sext i8 %.v7 to i16
  %30 = mul i16 %28, %29
  %31 = sext i36 %25 to i37
  %32 = sext i16 %30 to i37
  %33 = add i37 %31, %32
  %34 = trunc i37 %33 to i32
  store i32 %34, ptr %rd, align 4
  br label %35

35:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SDOTSP_SC_B(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %35

1:                                                ; preds = %0
  %2 = getelementptr i8, ptr %rs1, i32 0
  %3 = getelementptr i8, ptr %rs2, i32 0
  %.v = load i8, ptr %2, align 1
  %.v1 = load i8, ptr %3, align 1
  %4 = sext i8 %.v to i16
  %5 = sext i8 %.v1 to i16
  %6 = mul i16 %4, %5
  %rd.v = load i32, ptr %rd, align 4
  %7 = zext i32 %rd.v to i34
  %8 = sext i16 %6 to i34
  %9 = add i34 %7, %8
  %10 = getelementptr i8, ptr %rs1, i32 1
  %11 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %10, align 1
  %.v3 = load i8, ptr %11, align 1
  %12 = sext i8 %.v2 to i16
  %13 = sext i8 %.v3 to i16
  %14 = mul i16 %12, %13
  %15 = sext i34 %9 to i35
  %16 = sext i16 %14 to i35
  %17 = add i35 %15, %16
  %18 = getelementptr i8, ptr %rs1, i32 2
  %19 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %18, align 1
  %.v5 = load i8, ptr %19, align 1
  %20 = sext i8 %.v4 to i16
  %21 = sext i8 %.v5 to i16
  %22 = mul i16 %20, %21
  %23 = sext i35 %17 to i36
  %24 = sext i16 %22 to i36
  %25 = add i36 %23, %24
  %26 = getelementptr i8, ptr %rs1, i32 3
  %27 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %26, align 1
  %.v7 = load i8, ptr %27, align 1
  %28 = sext i8 %.v6 to i16
  %29 = sext i8 %.v7 to i16
  %30 = mul i16 %28, %29
  %31 = sext i36 %25 to i37
  %32 = sext i16 %30 to i37
  %33 = add i37 %31, %32
  %34 = trunc i37 %33 to i32
  store i32 %34, ptr %rd, align 4
  br label %35

35:                                               ; preds = %1, %0
  ret void
}

define void @implCV_SDOTSP_SCI_B(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %37

3:                                                ; preds = %0
  %4 = getelementptr i8, ptr %rs1, i32 0
  %5 = trunc i32 %Imm6 to i8
  %.v = load i8, ptr %4, align 1
  %6 = sext i8 %.v to i16
  %7 = sext i8 %5 to i16
  %8 = mul i16 %6, %7
  %rd.v = load i32, ptr %rd, align 4
  %9 = zext i32 %rd.v to i34
  %10 = sext i16 %8 to i34
  %11 = add i34 %9, %10
  %12 = getelementptr i8, ptr %rs1, i32 1
  %13 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %12, align 1
  %14 = sext i8 %.v1 to i16
  %15 = sext i8 %13 to i16
  %16 = mul i16 %14, %15
  %17 = sext i34 %11 to i35
  %18 = sext i16 %16 to i35
  %19 = add i35 %17, %18
  %20 = getelementptr i8, ptr %rs1, i32 2
  %21 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %20, align 1
  %22 = sext i8 %.v2 to i16
  %23 = sext i8 %21 to i16
  %24 = mul i16 %22, %23
  %25 = sext i35 %19 to i36
  %26 = sext i16 %24 to i36
  %27 = add i36 %25, %26
  %28 = getelementptr i8, ptr %rs1, i32 3
  %29 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %28, align 1
  %30 = sext i8 %.v3 to i16
  %31 = sext i8 %29 to i16
  %32 = mul i16 %30, %31
  %33 = sext i36 %27 to i37
  %34 = sext i16 %32 to i37
  %35 = add i37 %33, %34
  %36 = trunc i37 %35 to i32
  store i32 %36, ptr %rd, align 4
  br label %37

37:                                               ; preds = %3, %0
  ret void
}

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

