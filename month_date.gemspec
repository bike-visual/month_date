# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'month_date/version'

Gem::Specification.new do |spec|
  spec.name          = "month_date"
  spec.version       = MonthDate::VERSION
  spec.authors       = ["ctxhou"]
  spec.email         = ["vjack070707@gmail.com"]
  spec.summary       = %q{Quickly get the specific date of month}
  spec.description   = %q{More easy way to get some dates in ruby.}
  spec.homepage      = "https://github.com/ctxhou/month_date"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
