source 'https://rubygems.org'

# Specify your gem's dependencies in auth0.gemspec
gemspec

group :development do
  gem 'coveralls', require: false
  gem 'rubocop', require: false
  gem 'terminal-notifier-guard', require: false unless ENV['TRAVIS']
  gem 'yard', require: false
end

group :test do
  gem 'vcr', require: false
  gem 'webmock', require: false
end
