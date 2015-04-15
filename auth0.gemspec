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

  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'fuubar', '~> 2.0'
  s.add_development_dependency 'guard-rspec', '~> 4.5'
  s.add_development_dependency 'dotenv-rails', '~> 2.0'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'pry-nav', '~> 0.2.4'
  s.add_development_dependency 'rspec', '~> 3.1', '>= 3.1.0'
  s.add_development_dependency 'rack-test', '~> 0.6'
  s.add_development_dependency 'simplecov', '~> 0.9'
  s.add_development_dependency 'faker', '~> 1.4'
  s.add_development_dependency 'yard', '~> 0.8'
  s.add_development_dependency 'gem-release', '~> 0.7'
  s.license = 'MIT'
end
