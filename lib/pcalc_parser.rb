class PCalcGrammar < Dhaka::Grammar
    for_symbol Dhaka::START_SYMBOL_NAME do
        start %w| Expression |
    end

    for_symbol 'Expression' do
        one_term %w| Term |
        parens %w| ( Expression ) |
        add %w| Term + Expression |
        subtract %w| Term - Expression |
    end

    for_symbol 'Term' do
        number %w| number |
        multiply %w| number * Term |
        divide %w| number / Term |
        modulus %w| number % Term |
    end
end

PCalcParser = Dhaka::Parser.new PCalcGrammar
