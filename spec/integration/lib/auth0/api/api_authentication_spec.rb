require 'spec_helper'
describe Auth0::Api::AuthenticationEndpoints do
  attr_reader :client, :impersonate_user, :impersonator_user

  before(:all) do
    client = Auth0Client.new(v2_creds)
    impersonate_username = Faker::Internet.user_name
    impersonate_email = "#{entity_suffix}#{Faker::Internet.safe_email(impersonate_username)}"
    password = Faker::Internet.password
    @impersonate_user = client.create_user(impersonate_username, 'email' => impersonate_email,
                                                                 'password' => password,
                                                                 'email_verified' => true,
                                                                 'connection' =>
                                                                  Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                                                 'app_metadata' => {})

    impersonator_username = Faker::Internet.user_name
    impersonator_email = "#{entity_suffix}#{Faker::Internet.safe_email(impersonator_username)}"
    @impersonator_user = client.create_user(impersonator_username, 'email' => impersonator_email,
                                                                   'password' => password,
                                                                   'email_verified' => true,
                                                                   'connection' =>
                                                                    Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                                                   'app_metadata' => {})
  end

  after(:all) do
    client = Auth0Client.new(v2_creds)
    client.delete_user(impersonate_user['user_id'])
    client.delete_user(impersonator_user['user_id'])
  end

  describe '.impersionation' do
    let(:global_client) { Auth0Client.new(v1_global_creds) }
    let(:impersonate_url) do
      global_client.impersonate(impersonate_user['user_id'], ENV['CLIENT_ID'], impersonator_user['user_id'], {})
    end
    it { expect(impersonate_url).to_not be_nil }
  end
end
