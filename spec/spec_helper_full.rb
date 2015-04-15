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

Dir[("./lib/**/*.rb")].each { |f| require f }
Dir[("./spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include  Rack::Test::Methods
  config.include Credentials
  config.after(:suite) do
    v2_client = Auth0Client.new({token: ENV["MASTER_JWT"], api_version: 2, namespace: ENV["NAMESPACE"]})
    v2_client
    .clients
    .select { |client| client["name"] != "DefaultApp" and not client["global"] }
    .each { |client| v2_client.delete_client(client["client_id"]) }
    v2_client.delete_users
  end
end
