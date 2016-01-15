require 'spec_helper'
describe Auth0::Api::AuthenticationEndpoints do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::AuthenticationEndpoints)
    @instance = dummy_instance
  end

  context '.obtain_access_token' do
    it { expect(@instance).to respond_to(:obtain_access_token) }
    it "is expected to make post request to '/oauth/token'" do
      allow(@instance).to receive(:post).with(
        '/oauth/token', client_id: nil, client_secret: nil, grant_type: 'client_credentials')
        .and_return('access_token' => 'AccessToken')
      expect(@instance).to receive(:post).with(
        '/oauth/token', client_id: nil, client_secret: nil, grant_type: 'client_credentials')
      expect(@instance.obtain_access_token).to eql 'AccessToken'
    end
  end

  context '.obtain_access_token social' do
    it { expect(@instance).to respond_to(:obtain_access_token) }
    it "is expected to make post request to '/oauth/access_token'" do
      allow(@instance).to receive(:post).with(
        '/oauth/access_token', client_id: nil, access_token: 'access_token', connection: 'facebook', scope: 'openid')
        .and_return('access_token' => 'AccessToken')
      expect(@instance).to receive(:post).with(
        '/oauth/access_token', client_id: nil, access_token: 'access_token', connection: 'facebook', scope: 'openid')
      expect(@instance.obtain_access_token('access_token', 'facebook', 'openid')).to eql 'AccessToken'
    end
  end

  context '.delegation' do
    it { expect(@instance).to respond_to(:delegation) }
    it "is expected to make post request to '/delegation'" do
      expect(@instance).to receive(:post).with(
        '/delegation',
        client_id: nil,
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        id_token: 'token',
        target: 'target',
        scope: '',
        api_type: 'app')
      @instance.delegation('token', 'target', '')
    end
    it "is expected to make post request to '/delegation'
      with specified api_type" do
      expect(@instance).to receive(:post).with(
        '/delegation',
        client_id: nil,
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        id_token: '', target: '', scope: '',
        api_type: 'salesforce_api')
      @instance.delegation('', '', '', 'salesforce_api')
    end
    it 'allows to pass extra parameters' do
      expect(@instance).to receive(:post).with(
        '/delegation',
        client_id: nil,
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        id_token: '', target: '', scope: '', api_type: '',
        community_name: 'test-community', community_url: 'test-url')
      @instance.delegation(
        '', '', '', '',
        community_name: 'test-community', community_url: 'test-url')
    end
  end

  context '.refresh_delegation' do
    it { expect(@instance).to respond_to(:refresh_delegation) }
    it "is expected to make post request to '/delegation'" do
      expect(@instance).to receive(:post).with(
        '/delegation',
        client_id: nil,
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        refresh_token: '', target: '', api_type: '', scope: '',
        additional_parameter: 'parameter')
      @instance.refresh_delegation('', '', '', '', additional_parameter: 'parameter')
    end
  end

  context '.impersonate' do
    let(:user_id)         { 'some_user_id' }
    let(:app_client_id)   { 'some_app_client_id' }
    let(:impersonator_id) { 'some_impersonator_id' }

    it { expect(@instance).to respond_to(:impersonate) }
    it "is expected to make post request to '/users/{user_id}/impersonate'" do
      expect(@instance).to receive(:post).with(
        "/users/#{user_id}/impersonate",
        protocol: 'oauth2',
        impersonator_id: impersonator_id, client_id: app_client_id, ttl: 120,
        additionalParameters: {
          response_type: 'code', state: '',
          scope: 'openid', callback_url: '' })
      @instance.impersonate(user_id, app_client_id, impersonator_id, {})
    end
  end

  context '.login' do
    it { expect(@instance).to respond_to(:signup) }
    it 'is expected to make post to /oauth/ro' do
      expect(@instance).to receive(:post).with(
        '/oauth/ro',
        client_id: nil, username: 'test@test.com',
        password: 'password', connection: 'Username-Password-Authentication',
        scope: 'openid', grant_type: 'password', id_token: nil)
      @instance.login('test@test.com', 'password')
    end
  end

  context '.phone_login' do
    let(:phone_number) { Faker::PhoneNumber.cell_phone }
    let(:code) { Faker::Number.number(10) }
    it { expect(@instance).to respond_to(:phone_login) }
    it 'is expected to make post to /oauth/ro' do
      expect(@instance).to receive(:post).with(
        '/oauth/ro',
        client_id: nil, username: phone_number,
        password: code, connection: 'sms',
        scope: 'openid', grant_type: 'password')
      @instance.phone_login(phone_number, code)
    end
  end

  context '.unlink_user' do
    it { expect(@instance).to respond_to(:phone_login) }
    it 'is expected to make post to /unlink' do
      expect(@instance).to receive(:post).with('/unlink', access_token: 'access-token', user_id: 'user-id')
      @instance.unlink_user('access-token', 'user-id')
    end
  end

  context '.signup' do
    it { expect(@instance).to respond_to(:signup) }
    it 'is expected to make post to /dbconnections/signup' do
      expect(@instance).to receive(:post).with(
        '/dbconnections/signup',
        client_id: nil, email: 'test@test.com',
        password: 'password', connection: 'User')
      @instance.signup('test@test.com', 'password', 'User')
    end
  end
  context '.change_password' do
    it { expect(@instance).to respond_to(:change_password) }
    it 'is expected to make post to /dbconnections/change_password' do
      expect(@instance).to receive(:post).with(
        '/dbconnections/change_password',
        client_id: nil, email: 'test@test.com',
        password: 'password', connection: 'User')
      @instance.change_password('test@test.com', 'password', 'User')
    end
  end

  context '.start_passwordless_email_flow' do
    it { expect(@instance).to respond_to(:start_passwordless_email_flow) }
    it 'is expected to make post to /passwordless/start' do
      expect(@instance).to receive(:post).with(
        '/passwordless/start',
        client_id: nil,
        email: 'test@test.com',
        send: 'link',
        auth_params: {
          scope: 'scope',
          protocol: 'protocol'
        })
      @instance.start_passwordless_email_flow('test@test.com', 'link', scope: 'scope', protocol: 'protocol')
    end
  end

  context '.start_passwordless_sms_flow' do
    let(:phone_number) { Faker::PhoneNumber.cell_phone }
    it { expect(@instance).to respond_to(:start_passwordless_sms_flow) }
    it 'is expected to make post to /passwordless/start' do
      expect(@instance).to receive(:post).with(
        '/passwordless/start',
        client_id: nil,
        connection: 'sms',
        phone_number: phone_number)
      @instance.start_passwordless_sms_flow(phone_number)
    end
  end

  context '.token_info' do
    it { expect(@instance).to respond_to(:token_info) }
    it 'is expected to make post to /tokeinfo' do
      expect(@instance).to receive(:post).with('/tokeninfo', id_token: 'SomerandomToken')
      @instance.token_info('SomerandomToken')
    end
  end

  context '.user_info' do
    it { expect(@instance).to respond_to(:user_info) }
    it 'is expected to make post to /userinfo' do
      expect(@instance).to receive(:get).with('/userinfo')
      @instance.user_info
    end
  end

  context '.saml_metadata' do
    let(:client_id) { 'client-id' }
    it { expect(@instance).to respond_to(:saml_metadata) }
    it 'is expected to make post to /samlp/metadata/client-id' do
      expect(@instance).to receive(:get).with("/samlp/metadata/#{client_id}")
      @instance.saml_metadata(client_id)
    end
  end

  context '.wsfed_metadata' do
    it { expect(@instance).to respond_to(:wsfed_metadata) }
    it 'is expected to make post to /wsfed/FederationMetadata/2007-06/FederationMetadata.xml' do
      expect(@instance).to receive(:get).with('/wsfed/FederationMetadata/2007-06/FederationMetadata.xml')
      @instance.wsfed_metadata
    end
  end
end
