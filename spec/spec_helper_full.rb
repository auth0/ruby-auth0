$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'coveralls'
Coveralls.wear!

require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
  add_filter "/spec/integration"
end

require 'rspec'
require 'rack/test'
require 'faker'
require 'auth0'
require 'pry'

Dir[("./lib/**/*.rb")].each { |f| require f }
Dir[("./spec/support/**/*.rb")].each { |f| require f }

def entity_suffix
  ENV["TRAVIS_BUILD_ID"] || "_local"
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Credentials
  config.after(:suite) do
    v2_client = Auth0Client.new({token: ENV["MASTER_JWT"], api_version: 2, domain: ENV["DOMAIN"]})
    v2_client
    .clients
    .select { |client| client["name"] != "DefaultApp" and not client["global"] and client["name"].end_with? entity_suffix }
    .each { |client| v2_client.delete_client(client["client_id"]) }
    v2_client
    .users
    .select { |user| user["email"].split("@").first.include? entity_suffix }
    .each { |user| v2_client.delete_user(user["user_id"])}
  end
end
