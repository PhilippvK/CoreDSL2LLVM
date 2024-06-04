let Predicates = [HasExtXExample, IsRV32] in {
// class RVInst_CV_SUBINCACC<dag outs, dag ins> : RVInst<outs, ins, "cv.add.h", "$rd, $rs1, $rs2", [], InstFormatOther> {
class RVInst_CV_SUBINCACC<dag outs, dag ins> : Instruction, Sched<[]> {
    // General
    let Namespace = "RISCV";
    let Size = 4;
    bits<32> SoftFail = 0;
    bits<32> Inst;

    // Operands
    bits<5> rd;
    bits<5> rs1;
    bits<5> rs2;

    // Attributes
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let isTerminator = 0;

    // Encoding

    let Inst{31-25} = 0b0101000;

    let Inst{24-20} = rs2;

    let Inst{19-15} = rs1;

    let Inst{14-12} = 0b011;

    let Inst{11-7} = rd;

    let Inst{6-0} = 0b0101011;

    dag OutOperandList = outs;
    dag InOperandList = ins;

    // Assembly
    let AsmString = "xexample.subincacc\t$rd, $rs1, $rs2";

    // Constraints
    let Constraints = "$rd = $rd_wb";
}
def CV_SUBINCACC : RVInst_CV_SUBINCACC<(outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2)>;

}
