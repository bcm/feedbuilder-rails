# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "feedbuilder-rails/version"

Gem::Specification.new do |s|
  s.name        = "feedbuilder-rails"
  s.version     = FeedBuilder::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brian Moseley"]
  s.email       = ["bcm@maz.org"]
  s.homepage    = ""
  s.summary     = %q{Rails helpers for feedbuilder}
  s.description = %q{Rails helpers for feedbuilder}

  s.rubyforge_project = "feedbuilder-rails"

  s.add_dependency 'actionpack', '>= 3.1.0'
  s.add_dependency 'activerecord', '>= 3.1.0'
  s.add_dependency 'feedbuilder'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
