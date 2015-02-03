# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "gem-home"
  spec.version       = "0.0.2"
  spec.authors       = ["Ryan"]
  spec.email         = ["ryan@mazondo.com"]
  spec.summary       = "Adds convenience methods to the gem command"
  spec.description   = "gem home `gem-name`, gem docs `gem-name`, gem issues `gem-name`"
  spec.homepage      = "https://github.com/mazondo/gem-home"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "webmock", "~> 1.20.4"
end
