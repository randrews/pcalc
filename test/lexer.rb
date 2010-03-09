require File.join(File.dirname(__FILE__),"..","lib","pcalc.rb")
require "fileutils"

describe "Lexer" do
    def tokens str
        t=[]
        PCalcLexer.lex(str).each do |token|
            t << token
        end
        t
    end

    it "should recognize the operators" do
        t = tokens "( ) * / + - %"

        t[0].symbol_name.should=="("
        t[1].symbol_name.should==")"
        t[2].symbol_name.should=="*"
        t[3].symbol_name.should=="/"
        t[4].symbol_name.should=="+"
        t[5].symbol_name.should=="-"
        t[6].symbol_name.should=="%"
    end

    it "should recognize numbers" do
        t=tokens("1 -2 1.3 -1.3 1.456")
        t[0..4].map{|x| x.value}.should==%w{1 -2 1.3 -1.3 1.456}
        t[0..4].map{|x| x.symbol_name}.should==['number']*5
    end
end
