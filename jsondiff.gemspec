# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jsondiff/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["François de Metz"]
  gem.email         = ["francois@2metz.fr"]
  gem.description   = %q{Generate a JSON Patch from 2 ruby hash}
  gem.summary       = %q{}
  gem.homepage      = "https://github.com/francois2metz/jsondiff"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.name          = "jsondiff"
  gem.require_paths = ["lib"]
  gem.version       = JsonDiff::VERSION

  gem.add_development_dependency "rspec", "~> 3.12.0"
end
