# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bruce-banner/version'

Gem::Specification.new do |gem|
  gem.name          = "bruce-banner"
  gem.version       = BruceBanner::VERSION
  gem.authors       = ["bjh"]
  gem.email         = ["bjh@fake.fake"]
  gem.description   = %q{wraps `puts' output with a banner}
  gem.summary       = %q{gem summary: I am a lazy bitch...hence the birth of this gem.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
