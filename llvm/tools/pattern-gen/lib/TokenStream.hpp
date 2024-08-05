#pragma once
#include <string>
#include <optional>
#include <map>
#include "Token.hpp"

struct TokenStream
{
    const std::string path;
    const std::string src;
    size_t i = 0;
    int lineNumber = 1;

  private:
    std::optional<Token> peekToken;
    std::map<std::string_view, uint32_t> strings =
    { // initialize with keywords
        std::make_pair("if", 0),
        std::make_pair("else", 1),
        std::make_pair("while", 2),
        std::make_pair("for", 3),
        std::make_pair("operands", 4),
        std::make_pair("encoding", 5),
        std::make_pair("assembly", 6),
        std::make_pair("behavior", 7),
        std::make_pair("extends", 8),
        std::make_pair("functions", 9),
        std::make_pair("instructions", 10),
        std::make_pair("signed", 11),
        std::make_pair("unsigned", 12),
        std::make_pair("extern", 13),
        std::make_pair("void", 14),
    };
    const size_t NUM_KEYWORDS = strings.size();

  public:
    TokenStream (std::string&& srcPath);
    Token Pop();
    Token Peek();
};
