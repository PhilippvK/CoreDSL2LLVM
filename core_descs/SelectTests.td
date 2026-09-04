let Predicates = [HasVendorXCValu] in {

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isBranch = 0, isTerminator = 0, isCodeGenOnly = 1, Constraints = "" in def SEXT_BIT23_ : RVInst_SEXT_BIT23<(outs GPR:$rd), (ins GPR:$rs1)>;

def : Pat<
	(i32 (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 8))))), (i32 (i32 31))))),
	(SEXT_BIT23_ GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isBranch = 0, isTerminator = 0, isCodeGenOnly = 1, Constraints = "" in def ZEXT_BIT23_ : RVInst_ZEXT_BIT23<(outs GPR:$rd), (ins GPR:$rs1)>;

def : Pat<
	(i32 (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 23)))), (i32 1))),
	(ZEXT_BIT23_ GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isBranch = 0, isTerminator = 0, isCodeGenOnly = 1, Constraints = "" in def ZEXT_UNALIGNED_BYTE_ : RVInst_ZEXT_UNALIGNED_BYTE<(outs GPR:$rd), (ins GPR:$rs1)>;

def : Pat<
	(i32 (and (i32 (srl (i32 GPR:$rs1), (i32 (i32 11)))), (i32 255))),
	(ZEXT_UNALIGNED_BYTE_ GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isBranch = 0, isTerminator = 0, isCodeGenOnly = 1, Constraints = "" in def SEXT_UNALIGNED_BYTE_ : RVInst_SEXT_UNALIGNED_BYTE<(outs GPR:$rd), (ins GPR:$rs1)>;

def : Pat<
	(i32 (i32 (sra (i32 (i32 (shl (i32 GPR:$rs1), (i32 (i32 13))))), (i32 (i32 24))))),
	(SEXT_UNALIGNED_BYTE_ GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isBranch = 0, isTerminator = 0, isCodeGenOnly = 1, Constraints = "" in def ZEXT_ALIGNED_WORD_ : RVInst_ZEXT_ALIGNED_WORD<(outs GPR:$rd), (ins GPR:$rs1)>;

def : Pat<
	(i32 (i32 (srl (i32 GPR:$rs1), (i32 (i32 16))))),
	(ZEXT_ALIGNED_WORD_ GPR:$rs1)>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isBranch = 0, isTerminator = 0, isCodeGenOnly = 1, Constraints = "" in def SEXT_ALIGNED_WORD_ : RVInst_SEXT_ALIGNED_WORD<(outs GPR:$rd), (ins GPR:$rs1)>;

def : Pat<
	(i32 (i32 (sra (i32 GPR:$rs1), (i32 (i32 16))))),
	(SEXT_ALIGNED_WORD_ GPR:$rs1)>;

}
