class PCalcGrammar < Dhaka::Grammar
    precedences do
        left %w| * / % |
        left %w| + - |
    end

    for_symbol Dhaka::START_SYMBOL_NAME do
        start %w| Expression |
    end

    for_symbol 'Expression' do
        multiply %w| Term * Expression |
        divide %w| Term / Expression |
        modulus %w| Term % Expression |
        add %w| Term + Expression |
        subtract %w| Term - Expression |
        one_term %w| Term |
    end

    for_symbol 'Term' do
        number %w| number |
        parens %w| ( Expression ) |
    end
end

PCalcParser = Dhaka::Parser.new PCalcGrammar
