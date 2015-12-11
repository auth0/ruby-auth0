require 'spec_helper'
describe Auth0::Api::V2::Tickets do
  attr_reader :client, :user

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    username = Faker::Internet.user_name
    email = "#{entity_suffix}#{Faker::Internet.safe_email(username)}"
    password = Faker::Internet.password
    connection = 'Username-Password-Authentication'
    @user = client.create_user(username,  'email' => email,
                                          'password' => password,
                                          'email_verified' => false,
                                          'connection' => connection,
                                          'app_metadata' => {})
  end

  after(:all) do
    client.delete_user(user['user_id'])
  end

  describe '.post_email_verification' do
    let(:body_email) do
      {
        'result_url' => 'http://myapp.com/callback',
        'user_id' => user['user_id']
      }
    end
    let(:email_verification) { client.post_email_verification(body_email) }
    it { expect(email_verification).to include('ticket') }
  end

  describe '.post_password_change' do
    let(:body_password) do
      {
        'result_url' => 'http://myapp.com/callback',
        'user_id' => user['user_id'],
        'new_password' => 'secret'
      }
    end
    let(:password_change) { client.post_password_change(body_password) }
    it { expect(password_change).to include('ticket') }
  end
end
