require 'coveralls'
Coveralls.wear!

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/spec/integration'
end

require 'pry'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.include Credentials
  config.after(:suite) do
    puts "Cleaning up for #{entity_suffix}"
    v2_client = Auth0Client.new(
      token: ENV['MASTER_JWT'], api_version: 2, domain: ENV['DOMAIN']
    )
    v2_client
      .clients
      .select { |client| client['name'] != 'DefaultApp' && !client['global'] && client['name'].include?(entity_suffix) }
      .each { |client|
        sleep 1
        v2_client.delete_client(client['client_id'])
      }
    v2_client
      .users(q: "email:#{entity_suffix}*", fields: 'user_id', page: 0, per_page: 50)
      .each { |user|
        sleep 0.6
        v2_client.delete_user(user['user_id'])
      }
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
