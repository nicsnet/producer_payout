# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'producer_payout/version'

Gem::Specification.new do |spec|
  spec.name          = "producer_payout"
  spec.version       = ProducerPayout::VERSION
  spec.authors       = ["Nicola Sheldrick"]
  spec.email         = ["sheldr@gmail.com"]
  spec.description   = %q{Calculate the payout for a video producer.}
  spec.summary       = %q{video producer payouts}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activerecord'
  spec.add_dependency 'logger'
  spec.add_dependency 'yaml'
  spec.add_dependency 'sqlite3'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
