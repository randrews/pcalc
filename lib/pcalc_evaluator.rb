require File.join(File.dirname(__FILE__), "pcalc_parser.rb")

class PCalcEvaluator < Dhaka::Evaluator
    self.grammar = PCalcGrammar

    attr_accessor :str

    # Returns a unique register number each time it's called
    def reg
        @reg ||= 0
        @reg += 1
    end

    define_evaluation_rules do
        for_start do
            @str = StringIO.new
            @stack = []
            @str.puts ".sub foo"
            evaluate child_nodes[0]
            @str.puts "  print $N#{@stack.pop}"
            @str.puts ".end"
        end

        for_number do
            r = reg
            @str.puts "  set $N#{r}, #{child_nodes[0].token.value}"
            @stack.push r
        end

        for_parens do
            evaluate child_nodes[1]
        end

        {   "multiply"=>"mul",
            "modulus"=>"mod",
            "divide"=>"div",
            "add"=>"add",
            "subtract"=>"sub"}.each do |name, opcode|

            send "for_#{name}" do
                evaluate child_nodes[2]
                right = @stack.pop

                evaluate child_nodes[0]
                left = @stack.pop

                @str.puts "  #{opcode} $N#{left}, $N#{left}, $N#{right}"
                @stack.push left
            end
        end
    end

    def self.evaluate query
        evaluate_tree(PCalcParser.
                      parse(PCalcLexer.
                            lex(query)))
    end

    def self.evaluate_tree tree
        ev=PCalcEvaluator.new
        ev.evaluate(tree)
        ev.str.string
    end
end
