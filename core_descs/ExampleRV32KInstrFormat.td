class RVInst_K_LLI<dag outs, dag ins> : RVInst48<outs, ins, "k.lli", "$rd, $imm", [], InstFormatOther> {
	bits<32> imm;
	bits<5> rd;
	let Inst{47-44} = 0x0;
	let Inst{43-12} = imm{31-0};
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x5f;
}
class RVInst_K_ADDI<dag outs, dag ins> : RVInst48<outs, ins, "k.addi", "$rd, $rs1, $imm", [], InstFormatOther> {
	bits<24> imm;
	bits<5> rs1;
	bits<5> rd;
	let Inst{47-44} = 0x1;
	let Inst{43-20} = imm{23-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x0;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x5f;
}
class RVInst_K_ANDI<dag outs, dag ins> : RVInst48<outs, ins, "k.andi", "$rd, $rs1, $imm", [], InstFormatOther> {
	bits<24> imm;
	bits<5> rs1;
	bits<5> rd;
	let Inst{47-44} = 0x1;
	let Inst{43-20} = imm{23-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x1;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x5f;
}
class RVInst_K_XORI<dag outs, dag ins> : RVInst48<outs, ins, "k.xori", "$rd, $rs1, $imm", [], InstFormatOther> {
	bits<24> imm;
	bits<5> rs1;
	bits<5> rd;
	let Inst{47-44} = 0x1;
	let Inst{43-20} = imm{23-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x2;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x5f;
}
class RVInst_K_ORI<dag outs, dag ins> : RVInst48<outs, ins, "k.ori", "$rd, $rs1, $imm", [], InstFormatOther> {
	bits<24> imm;
	bits<5> rs1;
	bits<5> rd;
	let Inst{47-44} = 0x1;
	let Inst{43-20} = imm{23-0};
	let Inst{19-15} = rs1{4-0};
	let Inst{14-12} = 0x3;
	let Inst{11-7} = rd{4-0};
	let Inst{6-0} = 0x5f;
}
