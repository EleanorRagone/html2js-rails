# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html2js/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "html2js-rails"
  spec.version       = Html2js::Rails::VERSION
  spec.authors       = ["pccr"]
  spec.email         = ["pcragone@gmail.com"]
  spec.description   = %q{Compile AngularJS templates to Javascript files}
  spec.summary       = %q{Compile AngularJS templates to Javascript files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency 'railties',      '>= 4.0.0.beta', '< 5.0'
  spec.add_runtime_dependency 'tilt', '~> 1.4.1'
  spec.add_runtime_dependency 'sprockets', '~> 2.9.3'
end
