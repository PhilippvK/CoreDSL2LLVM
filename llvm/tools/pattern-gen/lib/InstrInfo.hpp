#pragma once
#include "llvm/ADT/SmallVector.h"
#include <array>
#include <cassert>
#include <cstdint>
#include <optional>
#include <string>
#include <string_view>
#include <vector>

struct CDSLInstr {
  struct FieldFrag {
    uint8_t idx; // index into Field array
    uint8_t len;
    uint8_t dstOffset;
    uint8_t srcOffset;
    uint64_t val;
  };

  enum FieldType {
    CONST = 0,
    NON_CONST = 1,
    SIGNED = 2,
    SIGNED_REG = 4,
    IMM = 8,
    REG = 16,
    IN = 32,
    OUT = 64,
    IS_32_BIT = 128,
    BRANCH_OFFS = 256,
    UNROLL_IMM = 512,
  };

  struct Field {
    uint8_t len;
    uint64_t constV;
    std::string_view ident;
    uint32_t identIdx;
    FieldType type;
    std::string llvm_type;
    // Set only on semantic specializations produced by [[is_unroll_imm]].
    std::optional<int64_t> fixedImm;
    bool isFixedImm() const { return fixedImm.has_value(); }
  };

  uint8_t size;
  std::string name;
  std::string llvm_instr;
  std::string mnemonic;
  std::string argString;

  llvm::SmallVector<Field, 4> fields;
  llvm::SmallVector<FieldFrag, 8> frags;

  CDSLInstr() = default;
  CDSLInstr(const CDSLInstr &) = default;
  CDSLInstr(CDSLInstr &&) = default;

  CDSLInstr(std::string name) : name(name) {
    std::string mnemonic = name;
    std::replace(mnemonic.begin(), mnemonic.end(), '_', '.');
    std::transform(mnemonic.begin(), mnemonic.end(), mnemonic.begin(),
                   [](unsigned char c) { return std::tolower(c); });
    this->mnemonic = mnemonic;
  }
};

std::string EncodingToTablgen(CDSLInstr const &instr);
void PrintInstrsAsTableGen(std::vector<CDSLInstr> const &instrs,
                           std::ostream &ostream);
