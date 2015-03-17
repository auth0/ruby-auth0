require 'dotenv'
Dotenv.load
$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
  add_filter "/spec/integration"
end
require 'rspec'
require 'rack/test'
require 'byebug'
require 'auth0'
Dir[("./lib/**/*.rb")].each { |f| require f }
Dir[("./spec/support/**/*.rb")].each { |f| require f }
RSpec.configure do |config|
  config.include	Rack::Test::Methods
  config.include Credentials
#  config.fail_fast = true
end
