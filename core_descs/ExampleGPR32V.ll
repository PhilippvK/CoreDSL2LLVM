; ModuleID = 'mod'
source_filename = "mod"

define void @implCV_ADD_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = zext i16 %.v to i32
  %6 = zext i16 %.v1 to i32
  %7 = add i32 %5, %6
  %8 = bitcast i32 %7 to <2 x i16>
  %9 = extractelement <2 x i16> %8, i32 0
  store i16 %9, ptr %2, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = getelementptr i16, ptr %rs2, i32 1
  %.v2 = load i16, ptr %11, align 2
  %.v3 = load i16, ptr %12, align 2
  %13 = zext i16 %.v2 to i32
  %14 = zext i16 %.v3 to i32
  %15 = add i32 %13, %14
  %16 = bitcast i32 %15 to <2 x i16>
  %17 = extractelement <2 x i16> %16, i32 0
  store i16 %17, ptr %10, align 2
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_ADD_SC_H(ptr %rs2, ptr %rs1, ptr noalias %rd) {
  br i1 true, label %1, label %18

1:                                                ; preds = %0
  %2 = getelementptr i16, ptr %rd, i32 0
  %3 = getelementptr i16, ptr %rs1, i32 0
  %4 = getelementptr i16, ptr %rs2, i32 0
  %.v = load i16, ptr %3, align 2
  %.v1 = load i16, ptr %4, align 2
  %5 = zext i16 %.v to i32
  %6 = zext i16 %.v1 to i32
  %7 = add i32 %5, %6
  %8 = bitcast i32 %7 to <2 x i16>
  %9 = extractelement <2 x i16> %8, i32 0
  store i16 %9, ptr %2, align 2
  %10 = getelementptr i16, ptr %rd, i32 1
  %11 = getelementptr i16, ptr %rs1, i32 1
  %12 = getelementptr i16, ptr %rs2, i32 0
  %.v2 = load i16, ptr %11, align 2
  %.v3 = load i16, ptr %12, align 2
  %13 = zext i16 %.v2 to i32
  %14 = zext i16 %.v3 to i32
  %15 = add i32 %13, %14
  %16 = bitcast i32 %15 to <2 x i16>
  %17 = extractelement <2 x i16> %16, i32 0
  store i16 %17, ptr %10, align 2
  br label %18

18:                                               ; preds = %1, %0
  ret void
}

define void @implCV_ADD_SCI_H(i32 %Imm6, ptr %rs1, ptr noalias %rd) {
  %1 = and i32 %Imm6, 63
  %2 = icmp eq i32 %Imm6, %1
  call void @llvm.assume(i1 %2)
  br i1 true, label %3, label %20

3:                                                ; preds = %0
  %4 = getelementptr i16, ptr %rd, i32 0
  %5 = getelementptr i16, ptr %rs1, i32 0
  %6 = trunc i32 %Imm6 to i16
  %.v = load i16, ptr %5, align 2
  %7 = zext i16 %.v to i32
  %8 = zext i16 %6 to i32
  %9 = add i32 %7, %8
  %10 = bitcast i32 %9 to <2 x i16>
  %11 = extractelement <2 x i16> %10, i32 0
  store i16 %11, ptr %4, align 2
  %12 = getelementptr i16, ptr %rd, i32 1
  %13 = getelementptr i16, ptr %rs1, i32 1
  %14 = trunc i32 %Imm6 to i16
  %.v1 = load i16, ptr %13, align 2
  %15 = zext i16 %.v1 to i32
  %16 = zext i16 %14 to i32
  %17 = add i32 %15, %16
  %18 = bitcast i32 %17 to <2 x i16>
  %19 = extractelement <2 x i16> %18, i32 0
  store i16 %19, ptr %12, align 2
  br label %20

20:                                               ; preds = %3, %0
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
  %5 = zext i8 %.v to i16
  %6 = zext i8 %.v1 to i16
  %7 = add i16 %5, %6
  %8 = lshr i16 %7, 0
  %9 = and i16 %8, 255
  %10 = trunc i16 %9 to i8
  store i8 %10, ptr %2, align 1
  %11 = getelementptr i8, ptr %rd, i32 1
  %12 = getelementptr i8, ptr %rs1, i32 1
  %13 = getelementptr i8, ptr %rs2, i32 1
  %.v2 = load i8, ptr %12, align 1
  %.v3 = load i8, ptr %13, align 1
  %14 = zext i8 %.v2 to i16
  %15 = zext i8 %.v3 to i16
  %16 = add i16 %14, %15
  %17 = lshr i16 %16, 0
  %18 = and i16 %17, 255
  %19 = trunc i16 %18 to i8
  store i8 %19, ptr %11, align 1
  %20 = getelementptr i8, ptr %rd, i32 2
  %21 = getelementptr i8, ptr %rs1, i32 2
  %22 = getelementptr i8, ptr %rs2, i32 2
  %.v4 = load i8, ptr %21, align 1
  %.v5 = load i8, ptr %22, align 1
  %23 = zext i8 %.v4 to i16
  %24 = zext i8 %.v5 to i16
  %25 = add i16 %23, %24
  %26 = lshr i16 %25, 0
  %27 = and i16 %26, 255
  %28 = trunc i16 %27 to i8
  store i8 %28, ptr %20, align 1
  %29 = getelementptr i8, ptr %rd, i32 3
  %30 = getelementptr i8, ptr %rs1, i32 3
  %31 = getelementptr i8, ptr %rs2, i32 3
  %.v6 = load i8, ptr %30, align 1
  %.v7 = load i8, ptr %31, align 1
  %32 = zext i8 %.v6 to i16
  %33 = zext i8 %.v7 to i16
  %34 = add i16 %32, %33
  %35 = lshr i16 %34, 0
  %36 = and i16 %35, 255
  %37 = trunc i16 %36 to i8
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
  %5 = zext i8 %.v to i16
  %6 = zext i8 %.v1 to i16
  %7 = add i16 %5, %6
  %8 = lshr i16 %7, 0
  %9 = and i16 %8, 255
  %10 = trunc i16 %9 to i8
  store i8 %10, ptr %2, align 1
  %11 = getelementptr i8, ptr %rd, i32 1
  %12 = getelementptr i8, ptr %rs1, i32 1
  %13 = getelementptr i8, ptr %rs2, i32 0
  %.v2 = load i8, ptr %12, align 1
  %.v3 = load i8, ptr %13, align 1
  %14 = zext i8 %.v2 to i16
  %15 = zext i8 %.v3 to i16
  %16 = add i16 %14, %15
  %17 = lshr i16 %16, 0
  %18 = and i16 %17, 255
  %19 = trunc i16 %18 to i8
  store i8 %19, ptr %11, align 1
  %20 = getelementptr i8, ptr %rd, i32 2
  %21 = getelementptr i8, ptr %rs1, i32 2
  %22 = getelementptr i8, ptr %rs2, i32 0
  %.v4 = load i8, ptr %21, align 1
  %.v5 = load i8, ptr %22, align 1
  %23 = zext i8 %.v4 to i16
  %24 = zext i8 %.v5 to i16
  %25 = add i16 %23, %24
  %26 = lshr i16 %25, 0
  %27 = and i16 %26, 255
  %28 = trunc i16 %27 to i8
  store i8 %28, ptr %20, align 1
  %29 = getelementptr i8, ptr %rd, i32 3
  %30 = getelementptr i8, ptr %rs1, i32 3
  %31 = getelementptr i8, ptr %rs2, i32 0
  %.v6 = load i8, ptr %30, align 1
  %.v7 = load i8, ptr %31, align 1
  %32 = zext i8 %.v6 to i16
  %33 = zext i8 %.v7 to i16
  %34 = add i16 %32, %33
  %35 = lshr i16 %34, 0
  %36 = and i16 %35, 255
  %37 = trunc i16 %36 to i8
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
  %7 = zext i8 %.v to i16
  %8 = zext i8 %6 to i16
  %9 = add i16 %7, %8
  %10 = lshr i16 %9, 0
  %11 = and i16 %10, 255
  %12 = trunc i16 %11 to i8
  store i8 %12, ptr %4, align 1
  %13 = getelementptr i8, ptr %rd, i32 1
  %14 = getelementptr i8, ptr %rs1, i32 1
  %15 = trunc i32 %Imm6 to i8
  %.v1 = load i8, ptr %14, align 1
  %16 = zext i8 %.v1 to i16
  %17 = zext i8 %15 to i16
  %18 = add i16 %16, %17
  %19 = lshr i16 %18, 0
  %20 = and i16 %19, 255
  %21 = trunc i16 %20 to i8
  store i8 %21, ptr %13, align 1
  %22 = getelementptr i8, ptr %rd, i32 2
  %23 = getelementptr i8, ptr %rs1, i32 2
  %24 = trunc i32 %Imm6 to i8
  %.v2 = load i8, ptr %23, align 1
  %25 = zext i8 %.v2 to i16
  %26 = zext i8 %24 to i16
  %27 = add i16 %25, %26
  %28 = lshr i16 %27, 0
  %29 = and i16 %28, 255
  %30 = trunc i16 %29 to i8
  store i8 %30, ptr %22, align 1
  %31 = getelementptr i8, ptr %rd, i32 3
  %32 = getelementptr i8, ptr %rs1, i32 3
  %33 = trunc i32 %Imm6 to i8
  %.v3 = load i8, ptr %32, align 1
  %34 = zext i8 %.v3 to i16
  %35 = zext i8 %33 to i16
  %36 = add i16 %34, %35
  %37 = lshr i16 %36, 0
  %38 = and i16 %37, 255
  %39 = trunc i16 %38 to i8
  store i8 %39, ptr %31, align 1
  br label %40

40:                                               ; preds = %3, %0
  ret void
}

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

