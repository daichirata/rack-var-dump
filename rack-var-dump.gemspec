# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack/var_dump/version"

Gem::Specification.new do |s|
  s.name        = "rack-var-dump"
  s.version     = Rack::VarDump::VERSION
  s.authors     = ["Dach_h"]
  s.email       = ["bunny.hop.md@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{provides a method for debugging like var_dump() of php.}
  s.description = s.summary
  s.rubyforge_project = "rack-var-dump"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'awesome_print',         '= 1.0.2'

  s.add_development_dependency 'rake',      '>= 0.9.2.2'
  s.add_development_dependency "rack",      '>= 1.3.5'
  s.add_development_dependency 'rack-test', '>= 0.5.3'
  s.add_development_dependency 'rspec',     '>= 2.7.0'
end
