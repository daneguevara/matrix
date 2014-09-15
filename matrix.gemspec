# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matrix/version'

Gem::Specification.new do |spec|
  spec.name          = 'matrix'
  spec.version       = Matrix::VERSION
  spec.authors       = ['Dane Guevara']
  spec.email         = ['rainerdane.guevara@gmail.com']
  spec.summary       = %q{Solution to HackerRank matrix challenege.}
  spec.description   = %q{Classes used to build a network of cities, roads, and machines to find the minimum cost to isolate machines.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_runtime_dependency 'activesupport', '~> 4.1.6'
end
