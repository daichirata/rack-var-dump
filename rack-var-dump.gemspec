# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack/var_dump/version"

Gem::Specification.new do |s|
  s.name        = "rack-var-dump"
  s.version     = Rack::VarDump::VERSION
  s.authors     = ["Dach_h"]
  s.email       = ["bunny.hop.md@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{rack-var-dump provides a method for debugging like var_dump() of php.}
  s.description = s.summary
  s.rubyforge_project = "rack-var-dump"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rack"
  s.add_development_dependency 'rake', '~> 0.9.2.2'
  s.add_development_dependency 'rdoc', '~> 3.11'
  # s.add_runtime_dependency "rest-client"
end
