require File.join(File.dirname(__FILE__),"..","lib","pcalc.rb")
require "fileutils"

describe "Evaluator" do
    before :each do
        @pwd = FileUtils.pwd
        @scratch = File.join(File.dirname(__FILE__),"scratch")
        FileUtils.mkdir @scratch
        FileUtils.cd @scratch
    end

    after :each do
        FileUtils.cd @pwd
        FileUtils.rm_rf @scratch
    end

    def evaluate expr
        File.open("temp.pir","w") do |f|
            f.puts PCalcEvaluator.evaluate(expr)
        end
        `parrot temp.pir`.to_f
    end

    it "should evaluate numbers" do
        evaluate("4").should==4
    end

    it "should evaluate sums" do
        evaluate("4.2 + 3.8 - 6 + -2").should==4
    end

    it "should evaluate products" do
        evaluate("2*3*4/6").should==4
    end

    it "should handle parentheses" do
        evaluate("3*(5+6)").should==33
    end

    it "should handle precedence" do
        evaluate("2+3*5").should==17
    end
end
