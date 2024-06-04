let Predicates = [HasExtXExample, IsRV32] in {

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SUBINCACC_ : RVInst_CV_SUBINCACC<(outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2)>;

def : Pat<
	(i32 (add (sub (add GPR:$rs1, (i32 1)), GPR:$rs2), GPR:$rd)),
	(CV_SUBINCACC_ GPR:$rd, GPR:$rs1, GPR:$rs2)>;

}

