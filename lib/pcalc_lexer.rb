class PCalcLexerSpecification < Dhaka::LexerSpecification

    for_pattern('\+') { create_token "+" }
    for_pattern('\*') { create_token "*" }
    for_pattern('\/') { create_token "/" }
    for_pattern('-') { create_token "-" }
    for_pattern('%') { create_token "%" }

    for_pattern('\(') { create_token "(" }
    for_pattern('\)') { create_token ")" }

    for_pattern('-?\d+(\.\d+)?') { create_token "number" }

    for_pattern('\s+') { ; }
end

PCalcLexer = Dhaka::Lexer.new PCalcLexerSpecification
