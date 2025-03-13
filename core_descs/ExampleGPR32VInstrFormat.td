class RVInst_CV_ADD_H<dag outs, dag ins> : RVInst<outs, ins, "cv.add.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_ADD_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.add.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_ADD_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.add.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_ADD_B<dag outs, dag ins> : RVInst<outs, ins, "cv.add.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_ADD_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.add.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_ADD_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.add.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SUB_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sub.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SUB_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sub.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SUB_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sub.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SUB_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sub.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SUB_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sub.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SUB_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sub.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MIN_H<dag outs, dag ins> : RVInst<outs, ins, "cv.min.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MIN_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.min.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MIN_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.min.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MIN_B<dag outs, dag ins> : RVInst<outs, ins, "cv.min.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MIN_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.min.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MIN_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.min.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MINU_H<dag outs, dag ins> : RVInst<outs, ins, "cv.minu.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MINU_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.minu.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MINU_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.minu.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MINU_B<dag outs, dag ins> : RVInst<outs, ins, "cv.minu.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MINU_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.minu.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MINU_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.minu.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MAX_H<dag outs, dag ins> : RVInst<outs, ins, "cv.max.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MAX_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.max.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MAX_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.max.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MAX_B<dag outs, dag ins> : RVInst<outs, ins, "cv.max.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MAX_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.max.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MAX_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.max.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MAXU_H<dag outs, dag ins> : RVInst<outs, ins, "cv.maxu.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MAXU_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.maxu.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MAXU_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.maxu.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MAXU_B<dag outs, dag ins> : RVInst<outs, ins, "cv.maxu.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MAXU_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.maxu.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_MAXU_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.maxu.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SRL_H<dag outs, dag ins> : RVInst<outs, ins, "cv.srl.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SRL_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.srl.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SRL_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.srl.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SRL_B<dag outs, dag ins> : RVInst<outs, ins, "cv.srl.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SRL_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.srl.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SRL_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.srl.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SRA_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sra.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SRA_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sra.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SRA_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sra.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SRA_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sra.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SRA_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sra.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SRA_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sra.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SLL_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sll.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SLL_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sll.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SLL_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sll.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SLL_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sll.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SLL_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sll.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SLL_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sll.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_OR_H<dag outs, dag ins> : RVInst<outs, ins, "cv.or.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_OR_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.or.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_OR_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.or.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_OR_B<dag outs, dag ins> : RVInst<outs, ins, "cv.or.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_OR_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.or.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_OR_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.or.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_XOR_H<dag outs, dag ins> : RVInst<outs, ins, "cv.xor.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_XOR_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.xor.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_XOR_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.xor.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_XOR_B<dag outs, dag ins> : RVInst<outs, ins, "cv.xor.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_XOR_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.xor.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_XOR_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.xor.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_AND_H<dag outs, dag ins> : RVInst<outs, ins, "cv.and.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_AND_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.and.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_AND_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.and.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_AND_B<dag outs, dag ins> : RVInst<outs, ins, "cv.and.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_AND_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.and.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_AND_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.and.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_ABS_H<dag outs, dag ins> : RVInst<outs, ins, "cv.abs.h", "$rd, $rs1", [], InstFormatOther> {
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = 0x0;
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_ABS_B<dag outs, dag ins> : RVInst<outs, ins, "cv.abs.b", "$rd, $rs1", [], InstFormatOther> {
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = 0x0;
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTUP_H<dag outs, dag ins> : RVInst<outs, ins, "cv.dotup.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTUP_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.dotup.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTUP_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.dotup.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTUP_B<dag outs, dag ins> : RVInst<outs, ins, "cv.dotup.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTUP_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.dotup.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTUP_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.dotup.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTUSP_H<dag outs, dag ins> : RVInst<outs, ins, "cv.dotusp.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTUSP_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.dotusp.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTUSP_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.dotusp.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTUSP_B<dag outs, dag ins> : RVInst<outs, ins, "cv.dotusp.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTUSP_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.dotusp.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTUSP_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.dotusp.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTSP_H<dag outs, dag ins> : RVInst<outs, ins, "cv.dotsp.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTSP_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.dotsp.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTSP_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.dotsp.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTSP_B<dag outs, dag ins> : RVInst<outs, ins, "cv.dotsp.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTSP_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.dotsp.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_DOTSP_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.dotsp.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTUP_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotup.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTUP_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotup.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTUP_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotup.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTUP_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotup.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTUP_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotup.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTUP_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotup.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTUSP_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotusp.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTUSP_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotusp.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTUSP_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotusp.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTUSP_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotusp.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTUSP_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotusp.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTUSP_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotusp.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTSP_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotsp.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTSP_SC_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotsp.sc.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTSP_SCI_H<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotsp.sci.h", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTSP_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotsp.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTSP_SC_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotsp.sc.b", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = 0x0;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
class RVInst_CV_SDOTSP_SCI_B<dag outs, dag ins> : RVInst<outs, ins, "cv.sdotsp.sci.b", "$rd, $rs1, $Imm6", [], InstFormatOther> {
	bits<6> Imm6;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-27} = 0x0;
	let Inst{26-26} = 0x0;
	let Inst{25-25} = Imm6{0-0};
	let Inst{24-20} = Imm6{5-1};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x0;
}
