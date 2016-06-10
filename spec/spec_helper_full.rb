$LOAD_PATH.unshift File.expand_path('..', __FILE__)
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'coveralls'
Coveralls.wear!

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/spec/integration'
end

require 'rspec'
require 'rack/test'
require 'faker'
require 'auth0'
require 'pry'

Dir['./lib/**/*.rb'].each { |f| require f }
Dir['./spec/support/**/*.rb'].each { |f| require f }

def entity_suffix
  (ENV['TRAVIS_JOB_ID'] || 'local').delete('_')
end

puts "Entity suffix is #{entity_suffix}"

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.include Rack::Test::Methods
  config.include Credentials
  config.after(:suite) do
    puts "Cleaning up for #{entity_suffix}"
    v2_client = Auth0Client.new(
      token: ENV['MASTER_JWT'], api_version: 2, domain: ENV['DOMAIN'])
    v2_client
      .clients
      .select { |client| client['name'] != 'DefaultApp' && !client['global'] && client['name'].include?(entity_suffix) }
      .each { |client| v2_client.delete_client(client['client_id']) }
    v2_client
      .users
      .select { |user| user['email'].split('@').first.include? entity_suffix }
      .each { |user| v2_client.delete_user(user['user_id']) }
    puts "Finished cleaning up for #{entity_suffix}"
  end
end

def wait(time, increment = 5, elapsed_time = 0, &block)
  yield
rescue RSpec::Expectations::ExpectationNotMetError => e
  raise e if elapsed_time >= time
  sleep increment
  wait(time, increment, elapsed_time + increment, &block)
end
