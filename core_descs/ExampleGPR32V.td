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

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SUB_H_ : RVInst_CV_SUB_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (sub GPR32V2:$rs1, GPR32V2:$rs2)),
	(CV_SUB_H_ GPR32V2:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SUB_SC_H_ : RVInst_CV_SUB_SC_H<(outs GPR32V2:$rd), (ins GPR:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (sub GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_SUB_SC_H_ GPR:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SUB_SCI_H_ : RVInst_CV_SUB_SCI_H<(outs GPR32V2:$rd), (ins uimm6:$Imm6, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (sub GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_SUB_SCI_H_ uimm6:$Imm6, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SUB_B_ : RVInst_CV_SUB_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (sub GPR32V4:$rs1, GPR32V4:$rs2)),
	(CV_SUB_B_ GPR32V4:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SUB_SC_B_ : RVInst_CV_SUB_SC_B<(outs GPR32V4:$rd), (ins GPR:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (sub GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_SUB_SC_B_ GPR:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SUB_SCI_B_ : RVInst_CV_SUB_SCI_B<(outs GPR32V4:$rd), (ins uimm6:$Imm6, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (sub GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_SUB_SCI_B_ uimm6:$Imm6, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MIN_H_ : RVInst_CV_MIN_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (smin GPR32V2:$rs1, GPR32V2:$rs2)),
	(CV_MIN_H_ GPR32V2:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MIN_SC_H_ : RVInst_CV_MIN_SC_H<(outs GPR32V2:$rd), (ins GPR:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (smin GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_MIN_SC_H_ GPR:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MIN_SCI_H_ : RVInst_CV_MIN_SCI_H<(outs GPR32V2:$rd), (ins uimm6:$Imm6, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (smin GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_MIN_SCI_H_ uimm6:$Imm6, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MIN_B_ : RVInst_CV_MIN_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (smin GPR32V4:$rs1, GPR32V4:$rs2)),
	(CV_MIN_B_ GPR32V4:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MIN_SC_B_ : RVInst_CV_MIN_SC_B<(outs GPR32V4:$rd), (ins GPR:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (smin GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_MIN_SC_B_ GPR:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MIN_SCI_B_ : RVInst_CV_MIN_SCI_B<(outs GPR32V4:$rd), (ins uimm6:$Imm6, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (smin GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_MIN_SCI_B_ uimm6:$Imm6, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MINU_H_ : RVInst_CV_MINU_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (umin GPR32V2:$rs1, GPR32V2:$rs2)),
	(CV_MINU_H_ GPR32V2:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MINU_SC_H_ : RVInst_CV_MINU_SC_H<(outs GPR32V2:$rd), (ins GPR:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (umin GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_MINU_SC_H_ GPR:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MINU_SCI_H_ : RVInst_CV_MINU_SCI_H<(outs GPR32V2:$rd), (ins uimm6:$Imm6, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (umin GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_MINU_SCI_H_ uimm6:$Imm6, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MINU_B_ : RVInst_CV_MINU_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (umin GPR32V4:$rs1, GPR32V4:$rs2)),
	(CV_MINU_B_ GPR32V4:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MINU_SC_B_ : RVInst_CV_MINU_SC_B<(outs GPR32V4:$rd), (ins GPR:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (umin GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_MINU_SC_B_ GPR:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MINU_SCI_B_ : RVInst_CV_MINU_SCI_B<(outs GPR32V4:$rd), (ins uimm6:$Imm6, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (umin GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_MINU_SCI_B_ uimm6:$Imm6, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MAX_H_ : RVInst_CV_MAX_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (smax GPR32V2:$rs1, GPR32V2:$rs2)),
	(CV_MAX_H_ GPR32V2:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MAX_SC_H_ : RVInst_CV_MAX_SC_H<(outs GPR32V2:$rd), (ins GPR:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (smax GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_MAX_SC_H_ GPR:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MAX_SCI_H_ : RVInst_CV_MAX_SCI_H<(outs GPR32V2:$rd), (ins uimm6:$Imm6, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (smax GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_MAX_SCI_H_ uimm6:$Imm6, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MAX_B_ : RVInst_CV_MAX_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (smax GPR32V4:$rs1, GPR32V4:$rs2)),
	(CV_MAX_B_ GPR32V4:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MAX_SC_B_ : RVInst_CV_MAX_SC_B<(outs GPR32V4:$rd), (ins GPR:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (smax GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_MAX_SC_B_ GPR:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MAX_SCI_B_ : RVInst_CV_MAX_SCI_B<(outs GPR32V4:$rd), (ins uimm6:$Imm6, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (smax GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_MAX_SCI_B_ uimm6:$Imm6, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MAXU_H_ : RVInst_CV_MAXU_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (umax GPR32V2:$rs1, GPR32V2:$rs2)),
	(CV_MAXU_H_ GPR32V2:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MAXU_SC_H_ : RVInst_CV_MAXU_SC_H<(outs GPR32V2:$rd), (ins GPR:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (umax GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_MAXU_SC_H_ GPR:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MAXU_SCI_H_ : RVInst_CV_MAXU_SCI_H<(outs GPR32V2:$rd), (ins uimm6:$Imm6, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (umax GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_MAXU_SCI_H_ uimm6:$Imm6, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MAXU_B_ : RVInst_CV_MAXU_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (umax GPR32V4:$rs1, GPR32V4:$rs2)),
	(CV_MAXU_B_ GPR32V4:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MAXU_SC_B_ : RVInst_CV_MAXU_SC_B<(outs GPR32V4:$rd), (ins GPR:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (umax GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_MAXU_SC_B_ GPR:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_MAXU_SCI_B_ : RVInst_CV_MAXU_SCI_B<(outs GPR32V4:$rd), (ins uimm6:$Imm6, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (umax GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_MAXU_SCI_B_ uimm6:$Imm6, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SRL_H_ : RVInst_CV_SRL_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (v2i16 (srl (v2i16 GPR32V2:$rs1), (v2i16 GPR32V2:$rs2)))),
	(CV_SRL_H_ GPR32V2:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SRL_SC_H_ : RVInst_CV_SRL_SC_H<(outs GPR32V2:$rd), (ins GPR:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (v2i16 (srl (v2i16 GPR32V2:$rs1), (v2i16 (build_vector (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0)))))))),
	(CV_SRL_SC_H_ GPR:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SRL_SCI_H_ : RVInst_CV_SRL_SCI_H<(outs GPR32V2:$rd), (ins uimm6:$Imm6, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (v2i16 (srl (v2i16 GPR32V2:$rs1), (v2i16 (build_vector (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0)))))))),
	(CV_SRL_SCI_H_ uimm6:$Imm6, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SRL_B_ : RVInst_CV_SRL_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (v4i8 (srl (v4i8 GPR32V4:$rs1), (v4i8 GPR32V4:$rs2)))),
	(CV_SRL_B_ GPR32V4:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SRL_SC_B_ : RVInst_CV_SRL_SC_B<(outs GPR32V4:$rd), (ins GPR:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (v4i8 (srl (v4i8 GPR32V4:$rs1), (v4i8 (build_vector (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))))),
	(CV_SRL_SC_B_ GPR:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SRL_SCI_B_ : RVInst_CV_SRL_SCI_B<(outs GPR32V4:$rd), (ins uimm6:$Imm6, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (v4i8 (srl (v4i8 GPR32V4:$rs1), (v4i8 (build_vector (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))))),
	(CV_SRL_SCI_B_ uimm6:$Imm6, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SRA_H_ : RVInst_CV_SRA_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (v2i16 (sra (v2i16 GPR32V2:$rs1), (v2i16 GPR32V2:$rs2)))),
	(CV_SRA_H_ GPR32V2:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SRA_SC_H_ : RVInst_CV_SRA_SC_H<(outs GPR32V2:$rd), (ins GPR:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (v2i16 (sra (v2i16 GPR32V2:$rs1), (v2i16 (build_vector (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0)))))))),
	(CV_SRA_SC_H_ GPR:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SRA_SCI_H_ : RVInst_CV_SRA_SCI_H<(outs GPR32V2:$rd), (ins uimm6:$Imm6, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (v2i16 (sra (v2i16 GPR32V2:$rs1), (v2i16 (build_vector (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0)))))))),
	(CV_SRA_SCI_H_ uimm6:$Imm6, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SRA_B_ : RVInst_CV_SRA_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (v4i8 (sra (v4i8 GPR32V4:$rs1), (v4i8 GPR32V4:$rs2)))),
	(CV_SRA_B_ GPR32V4:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SRA_SC_B_ : RVInst_CV_SRA_SC_B<(outs GPR32V4:$rd), (ins GPR:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (v4i8 (sra (v4i8 GPR32V4:$rs1), (v4i8 (build_vector (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))))),
	(CV_SRA_SC_B_ GPR:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SRA_SCI_B_ : RVInst_CV_SRA_SCI_B<(outs GPR32V4:$rd), (ins uimm6:$Imm6, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (v4i8 (sra (v4i8 GPR32V4:$rs1), (v4i8 (build_vector (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))))),
	(CV_SRA_SCI_B_ uimm6:$Imm6, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SLL_H_ : RVInst_CV_SLL_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (v2i16 (shl (v2i16 GPR32V2:$rs1), (v2i16 GPR32V2:$rs2)))),
	(CV_SLL_H_ GPR32V2:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SLL_SC_H_ : RVInst_CV_SLL_SC_H<(outs GPR32V2:$rd), (ins GPR:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (v2i16 (shl (v2i16 GPR32V2:$rs1), (v2i16 (build_vector (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0)))))))),
	(CV_SLL_SC_H_ GPR:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SLL_SCI_H_ : RVInst_CV_SLL_SCI_H<(outs GPR32V2:$rd), (ins uimm6:$Imm6, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (v2i16 (shl (v2i16 GPR32V2:$rs1), (v2i16 (build_vector (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0)))))))),
	(CV_SLL_SCI_H_ uimm6:$Imm6, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SLL_B_ : RVInst_CV_SLL_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (v4i8 (shl (v4i8 GPR32V4:$rs1), (v4i8 GPR32V4:$rs2)))),
	(CV_SLL_B_ GPR32V4:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SLL_SC_B_ : RVInst_CV_SLL_SC_B<(outs GPR32V4:$rd), (ins GPR:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (v4i8 (shl (v4i8 GPR32V4:$rs1), (v4i8 (build_vector (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))))),
	(CV_SLL_SC_B_ GPR:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_SLL_SCI_B_ : RVInst_CV_SLL_SCI_B<(outs GPR32V4:$rd), (ins uimm6:$Imm6, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (v4i8 (shl (v4i8 GPR32V4:$rs1), (v4i8 (build_vector (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))))),
	(CV_SLL_SCI_B_ uimm6:$Imm6, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_OR_H_ : RVInst_CV_OR_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (or GPR32V2:$rs2, GPR32V2:$rs1)),
	(CV_OR_H_ GPR32V2:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_OR_SC_H_ : RVInst_CV_OR_SC_H<(outs GPR32V2:$rd), (ins GPR:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (or GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_OR_SC_H_ GPR:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_OR_SCI_H_ : RVInst_CV_OR_SCI_H<(outs GPR32V2:$rd), (ins uimm6:$Imm6, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (or GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_OR_SCI_H_ uimm6:$Imm6, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_OR_B_ : RVInst_CV_OR_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (or GPR32V4:$rs2, GPR32V4:$rs1)),
	(CV_OR_B_ GPR32V4:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_OR_SC_B_ : RVInst_CV_OR_SC_B<(outs GPR32V4:$rd), (ins GPR:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (or GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_OR_SC_B_ GPR:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_OR_SCI_B_ : RVInst_CV_OR_SCI_B<(outs GPR32V4:$rd), (ins uimm6:$Imm6, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (or GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_OR_SCI_B_ uimm6:$Imm6, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_XOR_H_ : RVInst_CV_XOR_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (xor GPR32V2:$rs2, GPR32V2:$rs1)),
	(CV_XOR_H_ GPR32V2:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_XOR_SC_H_ : RVInst_CV_XOR_SC_H<(outs GPR32V2:$rd), (ins GPR:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (xor GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_XOR_SC_H_ GPR:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_XOR_SCI_H_ : RVInst_CV_XOR_SCI_H<(outs GPR32V2:$rd), (ins uimm6:$Imm6, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (xor GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_XOR_SCI_H_ uimm6:$Imm6, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_XOR_B_ : RVInst_CV_XOR_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (xor GPR32V4:$rs2, GPR32V4:$rs1)),
	(CV_XOR_B_ GPR32V4:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_XOR_SC_B_ : RVInst_CV_XOR_SC_B<(outs GPR32V4:$rd), (ins GPR:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (xor GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_XOR_SC_B_ GPR:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_XOR_SCI_B_ : RVInst_CV_XOR_SCI_B<(outs GPR32V4:$rd), (ins uimm6:$Imm6, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (xor GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_XOR_SCI_B_ uimm6:$Imm6, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_AND_H_ : RVInst_CV_AND_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (and GPR32V2:$rs2, GPR32V2:$rs1)),
	(CV_AND_H_ GPR32V2:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_AND_SC_H_ : RVInst_CV_AND_SC_H<(outs GPR32V2:$rd), (ins GPR:$rs2, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (and GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector GPR:$rs2, (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_AND_SC_H_ GPR:$rs2, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_AND_SCI_H_ : RVInst_CV_AND_SCI_H<(outs GPR32V2:$rd), (ins uimm6:$Imm6, GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (and GPR32V2:$rs1, (build_vector (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0))), (i16 (vector_extract (build_vector (i16 (trunc (i32 uimm6:$Imm6))), (i16 (trunc (i32 0)))), (i32 0)))))),
	(CV_AND_SCI_H_ uimm6:$Imm6, GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_AND_B_ : RVInst_CV_AND_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (and GPR32V4:$rs2, GPR32V4:$rs1)),
	(CV_AND_B_ GPR32V4:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_AND_SC_B_ : RVInst_CV_AND_SC_B<(outs GPR32V4:$rd), (ins GPR:$rs2, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (and GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc GPR:$rs2)), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_AND_SC_B_ GPR:$rs2, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_AND_SCI_B_ : RVInst_CV_AND_SCI_B<(outs GPR32V4:$rd), (ins uimm6:$Imm6, GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (and GPR32V4:$rs1, (build_vector (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0))), (i8 (vector_extract (build_vector (i8 (trunc (i32 uimm6:$Imm6))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0))), (i8 (trunc (i32 0)))), (i32 0)))))),
	(CV_AND_SCI_B_ uimm6:$Imm6, GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_ABS_H_ : RVInst_CV_ABS_H<(outs GPR32V2:$rd), (ins GPR32V2:$rs1)>;

def : Pat<
	(v2i16 (xor (add GPR32V2:$rs1, (v2i16 (sra (v2i16 GPR32V2:$rs1), (v2i16 (build_vector (i16 (trunc (i32 15))), (i16 (trunc (i32 15)))))))), (v2i16 (sra (v2i16 GPR32V2:$rs1), (v2i16 (build_vector (i16 (trunc (i32 15))), (i16 (trunc (i32 15))))))))),
	(CV_ABS_H_ GPR32V2:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_ABS_B_ : RVInst_CV_ABS_B<(outs GPR32V4:$rd), (ins GPR32V4:$rs1)>;

def : Pat<
	(v4i8 (xor (add GPR32V4:$rs1, (v4i8 (sra (v4i8 GPR32V4:$rs1), (v4i8 (build_vector (i8 (trunc (i32 7))), (i8 (trunc (i32 7))), (i8 (trunc (i32 7))), (i8 (trunc (i32 7)))))))), (v4i8 (sra (v4i8 GPR32V4:$rs1), (v4i8 (build_vector (i8 (trunc (i32 7))), (i8 (trunc (i32 7))), (i8 (trunc (i32 7))), (i8 (trunc (i32 7))))))))),
	(CV_ABS_B_ GPR32V4:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTUP_H_ : RVInst_CV_DOTUP_H<(outs GPR:$rd), (ins GPR:$rs2, GPR:$rs1)>;

def : Pat<
	(i32 (add (mul (i32 (srl (i32 GPR:$rs2), (i32 (i32 16)))), (i32 (srl (i32 GPR:$rs1), (i32 (i32 16))))), (mul (and GPR:$rs2, (i32 65535)), (and GPR:$rs1, (i32 65535))))),
	(CV_DOTUP_H_ GPR:$rs2, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTUP_SC_H_ : RVInst_CV_DOTUP_SC_H<(outs GPR:$rd), (ins GPR:$rs2, GPR:$rs1)>;

def : Pat<
	(i32 (mul (add (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (and GPR:$rs1, (i32 65535))), (and GPR:$rs2, (i32 65535)))),
	(CV_DOTUP_SC_H_ GPR:$rs2, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTUP_SCI_H_ : RVInst_CV_DOTUP_SCI_H<(outs GPR:$rd), (ins uimm6:$Imm6, GPR:$rs1)>;

def : Pat<
	(i32 (mul (add (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (and GPR:$rs1, (i32 65535))), (i32 uimm6:$Imm6))),
	(CV_DOTUP_SCI_H_ uimm6:$Imm6, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTUP_B_ : RVInst_CV_DOTUP_B<(outs GPR:$rd), (ins GPR:$rs2, GPR:$rs1)>;

def : Pat<
	(i32 (add (add (add (mul (and (i32 (srl (i32 GPR:$rs2), (i32 (i32 8)))), (i32 255)), (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 8)))), (i32 255))), (mul (and GPR:$rs2, (i32 255)), (and GPR:$rs1, (i32 255)))), (mul (and (i32 (srl (i32 GPR:$rs2), (i32 (i32 16)))), (i32 255)), (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (i32 255)))), (mul (i32 (srl (i32 GPR:$rs2), (i32 (i32 24)))), (i32 (srl (i32 GPR:$rs1), (i32 (i32 24))))))),
	(CV_DOTUP_B_ GPR:$rs2, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTUP_SC_B_ : RVInst_CV_DOTUP_SC_B<(outs GPR:$rd), (ins GPR:$rs2, GPR:$rs1)>;

def : Pat<
	(i32 (add (add (add (mul (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 8)))), (i32 255)), (and GPR:$rs2, (i32 255))), (mul (and GPR:$rs2, (i32 255)), (and GPR:$rs1, (i32 255)))), (mul (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (i32 255)), (and GPR:$rs2, (i32 255)))), (mul (i32 (srl (i32 GPR:$rs1), (i32 (i32 24)))), (and GPR:$rs2, (i32 255))))),
	(CV_DOTUP_SC_B_ GPR:$rs2, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTUP_SCI_B_ : RVInst_CV_DOTUP_SCI_B<(outs GPR:$rd), (ins uimm6:$Imm6, GPR:$rs1)>;

def : Pat<
	(i32 (mul (add (add (add (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 8)))), (i32 255)), (and GPR:$rs1, (i32 255))), (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (i32 255))), (i32 (srl (i32 GPR:$rs1), (i32 (i32 24))))), (i32 uimm6:$Imm6))),
	(CV_DOTUP_SCI_B_ uimm6:$Imm6, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTUSP_H_ : RVInst_CV_DOTUSP_H<(outs GPR:$rd), (ins GPR:$rs2, GPR:$rs1)>;

def : Pat<
	(i32 (add (mul (i32 (sra (i32 GPR:$rs2), (i32 (i32 16)))), (i32 (srl (i32 GPR:$rs1), (i32 (i32 16))))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 16))))), (i32 (i32 16)))), (and GPR:$rs1, (i32 65535))))),
	(CV_DOTUSP_H_ GPR:$rs2, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTUSP_SC_H_ : RVInst_CV_DOTUSP_SC_H<(outs GPR:$rd), (ins GPR:$rs2, GPR:$rs1)>;

def : Pat<
	(i32 (mul (add (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (and GPR:$rs1, (i32 65535))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 16))))), (i32 (i32 16)))))),
	(CV_DOTUSP_SC_H_ GPR:$rs2, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTUSP_SCI_H_ : RVInst_CV_DOTUSP_SCI_H<(outs GPR:$rd), (ins uimm6:$Imm6, GPR:$rs1)>;

def : Pat<
	(i32 (mul (add (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (and GPR:$rs1, (i32 65535))), (i32 uimm6:$Imm6))),
	(CV_DOTUSP_SCI_H_ uimm6:$Imm6, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTUSP_B_ : RVInst_CV_DOTUSP_B<(outs GPR:$rd), (ins GPR:$rs2, GPR:$rs1)>;

def : Pat<
	(i32 (add (add (add (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 16))))), (i32 (i32 24)))), (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 8)))), (i32 255))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))), (and GPR:$rs1, (i32 255)))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 8))))), (i32 (i32 24)))), (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (i32 255)))), (mul (i32 (sra (i32 GPR:$rs2), (i32 (i32 24)))), (i32 (srl (i32 GPR:$rs1), (i32 (i32 24))))))),
	(CV_DOTUSP_B_ GPR:$rs2, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTUSP_SC_B_ : RVInst_CV_DOTUSP_SC_B<(outs GPR:$rd), (ins GPR:$rs2, GPR:$rs1)>;

def : Pat<
	(i32 (add (add (add (mul (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 8)))), (i32 255)), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24))))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))), (and GPR:$rs1, (i32 255)))), (mul (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (i32 255)), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))))), (mul (i32 (srl (i32 GPR:$rs1), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24))))))),
	(CV_DOTUSP_SC_B_ GPR:$rs2, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTUSP_SCI_B_ : RVInst_CV_DOTUSP_SCI_B<(outs GPR:$rd), (ins uimm6:$Imm6, GPR:$rs1)>;

def : Pat<
	(i32 (mul (add (add (add (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 8)))), (i32 255)), (and GPR:$rs1, (i32 255))), (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (i32 255))), (i32 (srl (i32 GPR:$rs1), (i32 (i32 24))))), (i32 uimm6:$Imm6))),
	(CV_DOTUSP_SCI_B_ uimm6:$Imm6, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTSP_H_ : RVInst_CV_DOTSP_H<(outs GPR:$rd), (ins GPR:$rs2, GPR:$rs1)>;

def : Pat<
	(i32 (add (mul (i32 (sra (i32 GPR:$rs2), (i32 (i32 16)))), (i32 (sra (i32 GPR:$rs1), (i32 (i32 16))))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 16))))), (i32 (i32 16)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 16))))), (i32 (i32 16))))))),
	(CV_DOTSP_H_ GPR:$rs2, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTSP_SC_H_ : RVInst_CV_DOTSP_SC_H<(outs GPR:$rd), (ins GPR:$rs2, GPR:$rs1)>;

def : Pat<
	(i32 (mul (add (i32 (sra (i32 GPR:$rs1), (i32 (i32 16)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 16))))), (i32 (i32 16))))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 16))))), (i32 (i32 16)))))),
	(CV_DOTSP_SC_H_ GPR:$rs2, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTSP_SCI_H_ : RVInst_CV_DOTSP_SCI_H<(outs GPR:$rd), (ins uimm6:$Imm6, GPR:$rs1)>;

def : Pat<
	(i32 (mul (add (i32 (sra (i32 GPR:$rs1), (i32 (i32 16)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 16))))), (i32 (i32 16))))), (i32 uimm6:$Imm6))),
	(CV_DOTSP_SCI_H_ uimm6:$Imm6, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTSP_B_ : RVInst_CV_DOTSP_B<(outs GPR:$rd), (ins GPR:$rs2, GPR:$rs1)>;

def : Pat<
	(i32 (add (add (add (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 16))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 16))))), (i32 (i32 24))))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 24))))), (i32 (i32 24)))))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 8))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 8))))), (i32 (i32 24)))))), (mul (i32 (sra (i32 GPR:$rs2), (i32 (i32 24)))), (i32 (sra (i32 GPR:$rs1), (i32 (i32 24))))))),
	(CV_DOTSP_B_ GPR:$rs2, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTSP_SC_B_ : RVInst_CV_DOTSP_SC_B<(outs GPR:$rd), (ins GPR:$rs2, GPR:$rs1)>;

def : Pat<
	(i32 (add (add (add (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 16))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24))))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 24))))), (i32 (i32 24)))))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 8))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))))), (mul (i32 (sra (i32 GPR:$rs1), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24))))))),
	(CV_DOTSP_SC_B_ GPR:$rs2, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "" in def CV_DOTSP_SCI_B_ : RVInst_CV_DOTSP_SCI_B<(outs GPR:$rd), (ins uimm6:$Imm6, GPR:$rs1)>;

def : Pat<
	(i32 (mul (add (add (add (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 16))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 24))))), (i32 (i32 24))))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 8))))), (i32 (i32 24))))), (i32 (sra (i32 GPR:$rs1), (i32 (i32 24))))), (i32 uimm6:$Imm6))),
	(CV_DOTSP_SCI_B_ uimm6:$Imm6, GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTUP_H_ : RVInst_CV_SDOTUP_H<(outs GPR:$rd_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (add (mul (and GPR:$rs2, (i32 65535)), (and GPR:$rs1, (i32 65535))), GPR:$rd), (mul (i32 (srl (i32 GPR:$rs2), (i32 (i32 16)))), (i32 (srl (i32 GPR:$rs1), (i32 (i32 16))))))),
	(CV_SDOTUP_H_ GPR:$rs2, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTUP_SC_H_ : RVInst_CV_SDOTUP_SC_H<(outs GPR:$rd_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (mul (add (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (and GPR:$rs1, (i32 65535))), (and GPR:$rs2, (i32 65535))), GPR:$rd)),
	(CV_SDOTUP_SC_H_ GPR:$rs2, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTUP_SCI_H_ : RVInst_CV_SDOTUP_SCI_H<(outs GPR:$rd_wb), (ins uimm6:$Imm6, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (mul (add (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (and GPR:$rs1, (i32 65535))), (i32 uimm6:$Imm6)), GPR:$rd)),
	(CV_SDOTUP_SCI_H_ uimm6:$Imm6, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTUP_B_ : RVInst_CV_SDOTUP_B<(outs GPR:$rd_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (add (add (add (mul (and GPR:$rs2, (i32 255)), (and GPR:$rs1, (i32 255))), GPR:$rd), (mul (and (i32 (srl (i32 GPR:$rs2), (i32 (i32 8)))), (i32 255)), (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 8)))), (i32 255)))), (mul (and (i32 (srl (i32 GPR:$rs2), (i32 (i32 16)))), (i32 255)), (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (i32 255)))), (mul (i32 (srl (i32 GPR:$rs2), (i32 (i32 24)))), (i32 (srl (i32 GPR:$rs1), (i32 (i32 24))))))),
	(CV_SDOTUP_B_ GPR:$rs2, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTUP_SC_B_ : RVInst_CV_SDOTUP_SC_B<(outs GPR:$rd_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (add (add (add GPR:$rd, (mul (and GPR:$rs2, (i32 255)), (and GPR:$rs1, (i32 255)))), (mul (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 8)))), (i32 255)), (and GPR:$rs2, (i32 255)))), (mul (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (i32 255)), (and GPR:$rs2, (i32 255)))), (mul (i32 (srl (i32 GPR:$rs1), (i32 (i32 24)))), (and GPR:$rs2, (i32 255))))),
	(CV_SDOTUP_SC_B_ GPR:$rs2, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTUP_SCI_B_ : RVInst_CV_SDOTUP_SCI_B<(outs GPR:$rd_wb), (ins uimm6:$Imm6, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (mul (add (add (add (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 8)))), (i32 255)), (and GPR:$rs1, (i32 255))), (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (i32 255))), (i32 (srl (i32 GPR:$rs1), (i32 (i32 24))))), (i32 uimm6:$Imm6)), GPR:$rd)),
	(CV_SDOTUP_SCI_B_ uimm6:$Imm6, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTUSP_H_ : RVInst_CV_SDOTUSP_H<(outs GPR:$rd_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (add (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 16))))), (i32 (i32 16)))), (and GPR:$rs1, (i32 65535))), GPR:$rd), (mul (i32 (sra (i32 GPR:$rs2), (i32 (i32 16)))), (i32 (srl (i32 GPR:$rs1), (i32 (i32 16))))))),
	(CV_SDOTUSP_H_ GPR:$rs2, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTUSP_SC_H_ : RVInst_CV_SDOTUSP_SC_H<(outs GPR:$rd_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (mul (add (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (and GPR:$rs1, (i32 65535))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 16))))), (i32 (i32 16))))), GPR:$rd)),
	(CV_SDOTUSP_SC_H_ GPR:$rs2, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTUSP_SCI_H_ : RVInst_CV_SDOTUSP_SCI_H<(outs GPR:$rd_wb), (ins uimm6:$Imm6, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (mul (add (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (and GPR:$rs1, (i32 65535))), (i32 uimm6:$Imm6)), GPR:$rd)),
	(CV_SDOTUSP_SCI_H_ uimm6:$Imm6, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTUSP_B_ : RVInst_CV_SDOTUSP_B<(outs GPR:$rd_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (add (add (add (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))), (and GPR:$rs1, (i32 255))), GPR:$rd), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 16))))), (i32 (i32 24)))), (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 8)))), (i32 255)))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 8))))), (i32 (i32 24)))), (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (i32 255)))), (mul (i32 (sra (i32 GPR:$rs2), (i32 (i32 24)))), (i32 (srl (i32 GPR:$rs1), (i32 (i32 24))))))),
	(CV_SDOTUSP_B_ GPR:$rs2, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTUSP_SC_B_ : RVInst_CV_SDOTUSP_SC_B<(outs GPR:$rd_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (add (add (add GPR:$rd, (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))), (and GPR:$rs1, (i32 255)))), (mul (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 8)))), (i32 255)), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))))), (mul (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (i32 255)), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))))), (mul (i32 (srl (i32 GPR:$rs1), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24))))))),
	(CV_SDOTUSP_SC_B_ GPR:$rs2, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTUSP_SCI_B_ : RVInst_CV_SDOTUSP_SCI_B<(outs GPR:$rd_wb), (ins uimm6:$Imm6, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (mul (add (add (add (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 8)))), (i32 255)), (and GPR:$rs1, (i32 255))), (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 16)))), (i32 255))), (i32 (srl (i32 GPR:$rs1), (i32 (i32 24))))), (i32 uimm6:$Imm6)), GPR:$rd)),
	(CV_SDOTUSP_SCI_B_ uimm6:$Imm6, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTSP_H_ : RVInst_CV_SDOTSP_H<(outs GPR:$rd_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (add (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 16))))), (i32 (i32 16)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 16))))), (i32 (i32 16))))), GPR:$rd), (mul (i32 (sra (i32 GPR:$rs2), (i32 (i32 16)))), (i32 (sra (i32 GPR:$rs1), (i32 (i32 16))))))),
	(CV_SDOTSP_H_ GPR:$rs2, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTSP_SC_H_ : RVInst_CV_SDOTSP_SC_H<(outs GPR:$rd_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (mul (add (i32 (sra (i32 GPR:$rs1), (i32 (i32 16)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 16))))), (i32 (i32 16))))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 16))))), (i32 (i32 16))))), GPR:$rd)),
	(CV_SDOTSP_SC_H_ GPR:$rs2, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTSP_SCI_H_ : RVInst_CV_SDOTSP_SCI_H<(outs GPR:$rd_wb), (ins uimm6:$Imm6, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (mul (add (i32 (sra (i32 GPR:$rs1), (i32 (i32 16)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 16))))), (i32 (i32 16))))), (i32 uimm6:$Imm6)), GPR:$rd)),
	(CV_SDOTSP_SCI_H_ uimm6:$Imm6, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTSP_B_ : RVInst_CV_SDOTSP_B<(outs GPR:$rd_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (add (add (add (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 24))))), (i32 (i32 24))))), GPR:$rd), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 16))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 16))))), (i32 (i32 24)))))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 8))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 8))))), (i32 (i32 24)))))), (mul (i32 (sra (i32 GPR:$rs2), (i32 (i32 24)))), (i32 (sra (i32 GPR:$rs1), (i32 (i32 24))))))),
	(CV_SDOTSP_B_ GPR:$rs2, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTSP_SC_B_ : RVInst_CV_SDOTSP_SC_B<(outs GPR:$rd_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (add (add (add GPR:$rd, (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 24))))), (i32 (i32 24)))))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 16))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))))), (mul (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 8))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24)))))), (mul (i32 (sra (i32 GPR:$rs1), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs2), (i32 (i32 24))))), (i32 (i32 24))))))),
	(CV_SDOTSP_SC_B_ GPR:$rs2, GPR:$rs1, GPR:$rd)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCodeGenOnly = 1, Constraints = "$rd = $rd_wb" in def CV_SDOTSP_SCI_B_ : RVInst_CV_SDOTSP_SCI_B<(outs GPR:$rd_wb), (ins uimm6:$Imm6, GPR:$rs1, GPR:$rd)>;

def : Pat<
	(i32 (add (mul (add (add (add (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 16))))), (i32 (i32 24)))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 24))))), (i32 (i32 24))))), (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 8))))), (i32 (i32 24))))), (i32 (sra (i32 GPR:$rs1), (i32 (i32 24))))), (i32 uimm6:$Imm6)), GPR:$rd)),
	(CV_SDOTSP_SCI_B_ uimm6:$Imm6, GPR:$rs1, GPR:$rd)>;

}
