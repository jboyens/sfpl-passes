# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sfpl-passes/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["JR Boyens"]
  gem.email         = ["jboyens@fooninja.org"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "sfpl-passes"
  gem.require_paths = ["lib"]
  gem.version       = SFPL::Passes::VERSION

  gem.add_dependency "mechanize", "~> 2.3"
  gem.add_dependency "activesupport", "~> 3.2"

  gem.add_development_dependency "webmock", "~> 1.8.0"
  gem.add_development_dependency "rspec", "~> 2.8"
  gem.add_development_dependency "awesome_print", "~> 1.0.2"
end
