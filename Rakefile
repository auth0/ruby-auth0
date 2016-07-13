#!/usr/bin/env rake
require 'bundler/gem_tasks'

begin
  require 'rubocop/rake_task'

  require 'rspec/core/rake_task'

  desc 'Run Rubocop'
  RuboCop::RakeTask.new(:rubocop)

  require 'yard'
  DOC_FILES = ['lib/auth0/api/v2/*.rb', 'lib/auth0/api/authentication_endpoints.rb'].freeze

  desc 'Build Documentation'
  YARD::Rake::YardocTask.new(:documentation) do |t|
    t.files = DOC_FILES
    t.options = ['-p', 'doc_config/templates']
  end

  desc 'Publish SDK documentation'
  task :publish do
    sh 'rake documentation'
    sh 'cp -R doc /tmp/ruby-auth0-doc'
    sh 'git checkout gh-pages'
    sh 'cp -R /tmp/ruby-auth0-doc/* .'
    sh 'rm -rf /tmp/ruby-auth0-doc'
    sh 'git add .'
    sh 'git commit -am "Rebuild documentation"'
    sh 'git push origin gh-pages'
    sh 'git checkout master'
  end

  desc 'Run Integration Tests'
  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = FileList["spec/integration/**/*#{ENV['PATTERN']}*_spec.rb"]
  end

  desc 'Run Unit Tests'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = FileList["spec/lib/auth0/**/*#{ENV['PATTERN']}*_spec.rb"]
  end

  desc 'Run All Suites'
  RSpec::Core::RakeTask.new(:all)

  task default: [:rubocop, :spec]
rescue LoadError
  puts 'Load Error - No RSpec'
end
