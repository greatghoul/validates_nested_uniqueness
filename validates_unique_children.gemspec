# -*- encoding: utf-8 -*-
require File.expand_path('../lib/validates_unique_children/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kyle Stevens"]
  gem.email         = ["kstevens715@gmail.com"]
  gem.description   = %q{Validates uniqueness of has_many children}
  gem.summary       = %q{Validates uniqueness of has_many children}
  gem.homepage      = "http://github.com/kstevens715/validates_unique_children"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "validates_unique_children"
  gem.require_paths = ["lib"]
  gem.version       = ValidatesUniqueChildren::VERSION
  gem.add_development_dependency "rspec"
end
