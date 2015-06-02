# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'calculator/version'

Gem::Specification.new do |spec|
  spec.name          = 'calculator'
  spec.version       = Calculator::VERSION
  spec.authors       = ['John Kelly']
  spec.email         = ['john@johnkellycode.com']
  spec.summary       = 'A calculator to be used for problem solving.'
  spec.description   = 'Being used to solve Math problems since 2014.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
end
