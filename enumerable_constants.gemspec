# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "enumerable_constants/version"

Gem::Specification.new do |s|
  s.name        = "enumerable_constants"
  s.version     = EnumerableConstants::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chad Boyd"]
  s.email       = ["hoverlover@gmail.com"]
  s.homepage    = "http://genuitytech.com"
  s.summary     = %q{Provides the ability to enumerate over constants.}

  s.rubyforge_project = "enumerable_constants"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
