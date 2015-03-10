$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end
require 'rspec'
require 'rack/test'
require 'webmock/rspec'
require 'byebug'
require 'auth0'
Dir[("./lib/**/*.rb")].each { |f| require f }
Dir[("./spec/support/**/*.rb")].each { |f| require f }
RSpec.configure do |config|
  config.include	WebMock::API
  config.include	Rack::Test::Methods
#  config.fail_fast = true
end
