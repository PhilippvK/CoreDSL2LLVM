class RVInst_CV_MAC<dag outs, dag ins> : RVInst<outs, ins, "cv.mac", "$rd, $rs1, $rs2", [], InstFormatOther> {
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-25} = 0x48;
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x3;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x2b;
}
class RVInst_CV_ABS<dag outs, dag ins> : RVInst<outs, ins, "cv.abs", "$rd, $rs1", [], InstFormatOther> {
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-25} = 0x28;
	let Inst{24-20} = 0x0;
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x3;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x2b;
}
class RVInst_CV_ADDN<dag outs, dag ins> : RVInst<outs, ins, "cv.addn", "$rd, $rs1, $rs2, $Luimm5", [], InstFormatOther> {
	bits<5> Luimm5;
	bits<5> rs2;
	bits<5> rs1;
	bits<5> rd;
	let Inst{31-30} = 0x0;
	let Inst{29-25} = Luimm5{4-0};
	let Inst{24-20} = rs2{4-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x2;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x5b;
}
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
	let Inst{6-0} = 0x7b;
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
	let Inst{14-12} = 0x4;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x7b;
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
	let Inst{14-12} = 0x6;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x7b;
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
	let Inst{14-12} = 0x1;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x7b;
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
	let Inst{14-12} = 0x5;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x7b;
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
	let Inst{14-12} = 0x7;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x7b;
}
