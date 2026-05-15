source 'https://rubygems.org'

# Specify your gem's dependencies in auth0.gemspec
gemspec

group :development do
  gem 'terminal-notifier-guard', require: false unless ENV['CIRCLECI']
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'webmock', require: false
  gem 'vcr', require: false
  gem 'simplecov-cobertura'
  gem 'timecop', require: false
  gem 'pp'
end
