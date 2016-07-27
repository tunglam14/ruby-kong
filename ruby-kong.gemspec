# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby-kong/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-kong"
  spec.version       = RubyKong::VERSION
  spec.authors       = ["Dang Tung Lam"]
  spec.email         = ["dangtunglam14@gmail.com"]

  spec.summary       = "A Ruby client for the Kong API (https://getkong.org/)"
  spec.description   = "A Ruby client for the Kong API"
  spec.homepage      = "https://github.com/tunglam14/ruby-kong"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = " 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "unirest", '1.1.2'
end
