require 'spec_helper'
describe Auth0::Api::V2::Tickets do
  attr_reader :client, :test_user

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    test_user_name = "#{entity_suffix}-username"

    VCR.use_cassette('Auth0_Api_V2_Tickets/create_test_user') do
      @test_user = client.create_user(
        Auth0::Api::AuthenticationEndpoints::UP_AUTH,
        name: test_user_name,
        email: "#{entity_suffix}-#{test_user_name}@auth0.com",
        password: Faker::Internet.password
      )
    end
  end

  after(:all) do
    VCR.use_cassette('Auth0_Api_V2_Tickets/delete_test_user') do
      client.delete_user(test_user['user_id'])
    end
  end

  describe '.post_email_verification', vcr: true do
    it 'should create an email verification ticket' do
      expect(
        client.post_email_verification(
          test_user['user_id'],
          result_url: 'https://auth0.com/callback'
        )
      ).to include('ticket')
    end

    it 'should raise an error if the user id is empty' do
      expect do
        client.post_email_verification( '' )
      end.to raise_error Auth0::InvalidParameter, 'Must supply a valid user id to post an email verification'
    end

    it 'should raise an error if the identity supplied is not a Hash' do
      expect do
        client.post_email_verification( '', identity: 'not a hash')
      end.to raise_error Auth0::InvalidParameter, 'Must supply a valid user id to post an email verification'
    end
  end

  describe '.post_password_change', vcr: true do
    it 'should create a password change ticket' do
      expect(
        client.post_password_change(
          new_password: 'secret',
          user_id: test_user['user_id'],
          result_url: 'https://auth0.com/callback'
        )
      ).to include('ticket')
    end
  end
end
