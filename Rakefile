require 'fileutils'

task :default => :test

task :clean do
    files=Dir["**/*~"]
    puts "Removing #{files.size} Emacs temp file#{(files.size==1?'':'s')}"
    files.each do |tmp|
        FileUtils.rm tmp
    end

    puts "Removing built gem"
    `rm -f *.gem`
end

task :test do
    exec "spec --color test/*.rb"
end

task :gem do
    `rm -f pcalc-*.gem`
    `gem build pcalc.gemspec`
end

task :install=>:gem do
    `gem install --force pcalc-*.gem`
end

task :parse do
    expr=ENV['EXPR'] or 
        raise "No query specified: try 'rake parse EXPR=\"whatever\"'"
    filename=ENV['FILENAME'] || 'parse.dot'
    
    require File.join(File.dirname(__FILE__),'lib','pcalc.rb')
    
    tree = PCalcParser.parse(PCalcLexer.lex(expr))
    puts tree.inspect if tree.is_a? Dhaka::ParseErrorResult
    
    File.open(filename, 'w') do |file|
        file << tree.to_dot
    end
    `dot -Tpng -o#{filename}.png #{filename}`
    `rm #{filename}`
end
