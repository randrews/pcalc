require File.join(File.dirname(__FILE__),"..","lib","pcalc.rb")
require "fileutils"

describe "Parser" do

    def tree str
        PCalcParser.parse(PCalcLexer.lex(str))
    end

    it "should parse numbers" do
        tree("123.45").class.should_not==Dhaka::ParseErrorResult
        tree("-12").class.should_not==Dhaka::ParseErrorResult
    end

    it "should parse sums" do
        tree("1 + 2 + 3").class.should_not==Dhaka::ParseErrorResult
        tree("1 - -12 + 5").class.should_not==Dhaka::ParseErrorResult
    end

    it "should parse products" do
        tree("2*8 + 4/4").class.should_not==Dhaka::ParseErrorResult
    end
end
