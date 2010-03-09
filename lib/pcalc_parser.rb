class PCalcGrammar < Dhaka::Grammar
    precedences do
        left %w| * / % |
        left %w| + - |
    end

    for_symbol Dhaka::START_SYMBOL_NAME do
        start %w| Expression |
    end

    for_symbol 'Expression' do
        number %w| number |
        multiply %w| number * Expression |
        divide %w| number / Expression |
        modulus %w| number % Expression |
        add %w| number + Expression |
        subtract %w| number - Expression |
        parens %w| ( Expression ) |
    end
end

PCalcParser = Dhaka::Parser.new PCalcGrammar
