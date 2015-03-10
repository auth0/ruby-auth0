# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "auth0/version"

Gem::Specification.new do |s|
  s.name        = "auth0"
  s.version     = Auth0::VERSION
  s.authors     = ["Auth0", "Jose Romaniello", "Ivan Petroe", "Patrik Ragnarsson"]
  s.email       = ["support@auth0.com"]
  s.homepage    = "https://github.com/auth0/ruby-auth0"
  s.summary     = %q{Auth0 API Client}
  s.description = %q{Ruby client library for the Auth0 API.}

  s.rubyforge_project = "auth0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'httparty', '~> 0.13'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 3.1.0', '>= 3.1.0'
  s.add_development_dependency 'rack-test', '~> 0'
  s.add_development_dependency 'simplecov', '~> 0'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'byebug', '~> 0'
  s.add_development_dependency 'faker', '~> 0'
  s.add_development_dependency 'yard', '~> 0'
  s.license = 'MIT'
end
