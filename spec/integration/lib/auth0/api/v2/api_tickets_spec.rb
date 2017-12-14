require 'spec_helper'
describe Auth0::Api::V2::Tickets do
  attr_reader :client, :user

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    username = Faker::Internet.user_name
    email = "#{entity_suffix}#{Faker::Internet.safe_email(username)}"
    password = Faker::Internet.password
    sleep 1
    @user = client.create_user(username,  'email' => email,
                                          'password' => password,
                                          'email_verified' => false,
                                          'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                          'app_metadata' => {})
  end

  after(:all) do
    sleep 1
    client.delete_user(user['user_id'])
  end

  describe '.post_email_verification' do
    let(:email_verification) do
      sleep 1
      client.post_email_verification(user['user_id'], result_url: 'http://myapp.com/callback')
    end
    it do
      sleep 1
      expect(email_verification).to include('ticket')
    end
  end

  describe '.post_password_change' do
    let(:password_change) do
      sleep 1
      client.post_password_change(new_password: 'secret', user_id: user['user_id'],
                                  result_url: 'http://myapp.com/callback')
    end
    it do
      sleep 1
      expect(password_change).to include('ticket')
    end
  end
end
