require 'pry'
require 'rack/test'
require 'faker'
require 'auth0'

require 'simplecov'
SimpleCov.start

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'dotenv'
Dotenv.load

require 'webmock/rspec'
WebMock.allow_net_connect!

require 'vcr'
VCR.configure do |config|
  # Uncomment the line below to record new VCR cassettes.
  # When this is commented out, VCR will reject all outbound HTTP calls.
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.configure_rspec_metadata!
  config.hook_into :webmock
  config.filter_sensitive_data('CLIENT_SECRET') { ENV['CLIENT_SECRET'] }
  config.filter_sensitive_data('API_TOKEN') { ENV['MASTER_JWT'] }

  ENV['DOMAIN'] = 'auth0-sdk-tests.auth0.com'
  ENV['CLIENT_ID'] = '2cnWuug6zaFX1j0ge1P99jAUn0F4XSuI'
end

$LOAD_PATH.unshift File.expand_path('..', __FILE__)
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

Dir['./lib/*.rb'].each { |f| require f }
Dir['./lib/api/**/*.rb'].each { |f| require f }
Dir['./spec/support/**/*.rb'].each { |f| require f }
Dir['./spec/support/*.rb'].each { |f| require f }

require 'rspec'
RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.include Credentials
end

def wait(time, increment = 5, elapsed_time = 0, &block)
  yield
rescue RSpec::Expectations::ExpectationNotMetError => e
  raise e if elapsed_time >= time
  sleep increment
  wait(time, increment, elapsed_time + increment, &block)
end

def entity_suffix
  'rubytest'
end

puts "Entity suffix is #{entity_suffix}"