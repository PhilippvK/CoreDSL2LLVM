let Predicates = [HasVendorXCValu] in {

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_ADD_H_ : RVInst_CV_ADD_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (add GPR32V2:$rs2, GPR32V2:$rs1)),
	(CV_ADD_H_ GPR32V2:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_ADD_SC_H_ : RVInst_CV_ADD_SC_H<(outs GPR32V2:$rd), (ins GPR:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (add GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_ADD_SC_H_ GPR:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_ADD_SCI_H_ : RVInst_CV_ADD_SCI_H<(outs GPR32V2:$rd), (ins uimm6:$Imm6, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (add GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_ADD_SCI_H_ uimm6:$Imm6, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_ADD_B_ : RVInst_CV_ADD_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (add GPR32V4:$rs2, GPR32V4:$rs1)),
	(CV_ADD_B_ GPR32V4:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_ADD_SC_B_ : RVInst_CV_ADD_SC_B<(outs GPR32V4:$rd), (ins GPR:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (add GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_ADD_SC_B_ GPR:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_ADD_SCI_B_ : RVInst_CV_ADD_SCI_B<(outs GPR32V4:$rd), (ins uimm6:$Imm6, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (add GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_ADD_SCI_B_ uimm6:$Imm6, GPR32V4:$rs1)>;

}
