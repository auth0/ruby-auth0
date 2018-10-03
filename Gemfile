source 'https://rubygems.org'

# Specify your gem's dependencies in auth0.gemspec
gemspec

group :development do
  gem 'terminal-notifier-guard', require: false unless ENV['TRAVIS']
  gem 'coveralls', require: false
  gem 'rubocop', require: false
  gem 'yard', require: false
end

group :test do
  gem 'webmock', require: false
  gem 'vcr', require: false
end
