#!/usr/bin/env rake
require 'bundler/gem_tasks'

begin
  require 'rubocop/rake_task'

  require 'rspec/core/rake_task'

  desc 'Run Rubocop'
  RuboCop::RakeTask.new(:rubocop)

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

  desc 'Run unit and integration tests'
  task test: [:spec, :integration]

  task default: [:rubocop, :test]
rescue LoadError
  puts 'Load Error - No RSpec'
end
