# -*- encoding: utf-8 -*-
require File.expand_path('../lib/validates_nested_uniqueness/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kyle Stevens"]
  gem.email         = ["kstevens715@gmail.com"]
  gem.description   = %q{Validates uniqueness of has_many children}
  gem.summary       = %q{Validates uniqueness of has_many children}
  gem.homepage      = "http://github.com/kstevens715/validates_nested_uniqueness"

  gem.files         = Dir.glob('lib/**/*.rb')
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "validates_nested_uniqueness"
  gem.require_paths = ["lib"]
  gem.version       = ValidatesNestedUniqueness::VERSION
  gem.add_development_dependency "rspec"
  gem.add_runtime_dependency "activemodel"
end
