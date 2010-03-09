require "rubygems"
 
SPEC=Gem::Specification.new do |s|
  s.name = "pcalc"
  s.version = File.read(File.join(File.dirname(__FILE__), "VERSION"))
  s.date = ""
  s.author = "Ross Andrews"
  s.email = "randrews@geekfu.org"
  s.homepage = "http://geekfu.org"
  s.platform = Gem::Platform::RUBY
  s.summary = "Simple calculator that compiles to PIR"
  s.description = <<-STR
A simple calculator / equation parser that compiles to Parrot bytecode, as a way to learn Parrot
STR

  s.rubyforge_project="pcalc"

  s.files = ["VERSION"] + Dir["lib/**/*.rb"]
  s.executables=["pcalc"]
  s.has_rdoc=false
 
  s.add_dependency("dhaka")
end
