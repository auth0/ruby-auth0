require 'spec_helper'
describe Auth0::Api::AuthenticationEndpoints do
  attr_reader :client, :test_user_email, :test_user_pwd, :test_user

  before(:all) do
    @client = Auth0Client.new(v2_creds)

    @test_user_email = "#{entity_suffix}-username-1@auth0.com"
    @test_user_pwd = '23kejn2jk3en2jke2jk3be2jk3ber'

    VCR.use_cassette('Auth0_Api_AuthenticationEndpoints/create_test_user') do
      @test_user ||= @client.signup(
        test_user_email,
        test_user_pwd
      )
    end
  end

  after(:all) do
    VCR.use_cassette('Auth0_Api_AuthenticationEndpoints/delete_test_user') do
      @client.delete_user('auth0|' + test_user['_id'])
    end
  end

  describe '.signup', vcr: true do
    it 'should signup a new user' do
      expect(test_user).to(include('_id', 'email'))
    end

    it 'should return the correct email address' do
      expect(test_user['email']).to eq test_user_email
    end
  end

  describe '.change_password', vcr: true do
    it 'should trigger a password reset' do
      expect(
        @client.change_password(test_user_email, '')
      ).to(include("We've just sent you an email to reset your password."))
    end
  end

  describe '.saml_metadata', vcr: true do
    it 'should retrieve SAML metadata' do
      expect(@client.saml_metadata).to(include('<EntityDescriptor'))
    end
  end

  describe '.wsfed_metadata', vcr: true do
    it 'should retrieve WSFED metadata' do
      expect(@client.wsfed_metadata).to(include('<EntityDescriptor'))
    end
  end

  describe '.userinfo', vcr: true do
    it 'should fail as not authorized' do
      expect do
        @client.userinfo('invalid_token')
      end.to raise_error Auth0::Unauthorized
    end

    it 'should return the userinfo' do
      tokens = @client.login(test_user_email, test_user_pwd, nil, nil)
      expect(@client.userinfo(tokens['access_token'])).to(
        include( 'email' => test_user_email )
      )
    end
  end
end
