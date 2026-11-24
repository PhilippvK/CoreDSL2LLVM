//=-- RISCVRegisterBank.td - Describe the RISC-V Banks -------*- tablegen -*-=//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
//
//===----------------------------------------------------------------------===//

/// General Purpose Registers: X.
def GPRBRegBank : RegisterBank<"GPRB", [GPR, GPR32V2, GPR32V4]>;

/// Floating Point Registers: F.
def FPRBRegBank : RegisterBank<"FPRB", [FPR64]>;

/// Vector Registers : V.
def VRBRegBank : RegisterBank<"VRB", [VRM8]>;

