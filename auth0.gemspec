# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "auth0/version"

Gem::Specification.new do |s|
  s.name        = "auth0"
  s.version     = Auth0::VERSION
  s.authors     = ["Auth0", "Ezequiel Morito", "Jose Romaniello"]
  s.email       = ["support@auth0.com"]
  s.homepage    = "https://github.com/auth0/ruby-auth0"
  s.summary     = %q{Ruby client library for the Auth0 platform.}
  s.description = %q{Ruby client library for the Auth0 platform.}

  s.rubyforge_project = "auth0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'httparty', '~> 0.13'

  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'

  s.license = 'MIT'
end
