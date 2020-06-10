# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
require 'spec_helper'
describe Auth0::Api::AuthenticationEndpoints do
  UP_AUTH = 'Username-Password-Authentication'.freeze

  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::AuthenticationEndpoints)

    @instance = dummy_instance
  end

  subject { @instance }

  context '.api_token' do
    it { expect(@instance).to respond_to(:api_token) }
    it "is expected to POST to '/oauth/token'" do
      allow(@instance).to receive(:post).with(
        '/oauth/token',
        grant_type: 'client_credentials',
        client_id: @instance.client_id,
        client_secret: @instance.client_secret,
        audience: @instance.audience
      ).and_return('access_token' => 'AccessToken')

      expect(@instance.api_token.token).to eql 'AccessToken'
    end

    it "is expected to POST to '/oauth/token' with a custom audience" do
      allow(@instance).to receive(:post).with(
        '/oauth/token',
        grant_type: 'client_credentials',
        client_id: @instance.client_id,
        client_secret: @instance.client_secret,
        audience: '__test_audience__'
      ).and_return('access_token' => 'AccessToken')

      expect(
        @instance.api_token(audience: '__test_audience__').token
      ).to eql 'AccessToken'
    end
  end

  context '.obtain_access_token' do
    it { expect(@instance).to respond_to(:obtain_access_token) }
    it "is expected to make post request to '/oauth/token'" do
      allow(@instance).to receive(:post).with(
        '/oauth/token', client_id: @instance.client_id, client_secret: @instance.client_secret, grant_type: 'client_credentials'
      )
                                        .and_return('access_token' => 'AccessToken')

      expect(@instance).to receive(:post).with(
        '/oauth/token', client_id: @instance.client_id, client_secret: @instance.client_secret, grant_type: 'client_credentials'
      )
      expect(@instance.obtain_access_token).to eql 'AccessToken'
    end
  end

  context '.obtain_access_token social' do
    it { expect(@instance).to respond_to(:obtain_access_token) }
    it "is expected to make post request to '/oauth/access_token'" do
      allow(@instance).to receive(:post).with(
        '/oauth/access_token', client_id: @instance.client_id, access_token: 'access_token', connection: 'facebook',
                               scope: 'openid'
      )
                                        .and_return('access_token' => 'AccessToken')
      expect(@instance).to receive(:post).with(
        '/oauth/access_token', client_id: @instance.client_id, access_token: 'access_token', connection: 'facebook',
                               scope: 'openid'
      )
      expect(@instance.obtain_access_token('access_token', 'facebook', 'openid')).to eql 'AccessToken'
    end
  end

  context '.obtain_user_tokens' do
    it { expect(@instance).to respond_to(:obtain_user_tokens) }
    it "is expected to make post request to '/oauth/token'" do
      allow(@instance).to receive(:post).with(
        '/oauth/token', client_id: @instance.client_id, client_secret: @instance.client_secret, grant_type: 'authorization_code',
                        connection: 'facebook', code: 'code', scope: 'openid', redirect_uri: 'uri'
      )
                                        .and_return('user_tokens' => 'UserToken')
      expect(@instance).to receive(:post).with(
        '/oauth/token', client_id: @instance.client_id, client_secret: @instance.client_secret, grant_type: 'authorization_code',
                        connection: 'facebook', code: 'code', scope: 'openid', redirect_uri: 'uri'
      )
      expect(@instance.obtain_user_tokens('code', 'uri')['user_tokens']).to eq 'UserToken'
    end
    it { expect { @instance.obtain_user_tokens('', '') }.to raise_error 'Must supply a valid code' }
    it { expect { @instance.obtain_user_tokens('code', '') }.to raise_error 'Must supply a valid redirect_uri' }
  end

  context '.exchange_auth_code_for_tokens' do
    it { is_expected.to respond_to(:exchange_auth_code_for_tokens) }

    it 'is expected to make post request to /oauth/token with default params' do
      allow(@instance).to receive(:post).with(
        '/oauth/token',
        client_id: @instance.client_id,
        client_secret: @instance.client_secret,
        grant_type: 'authorization_code',
        code: '__test_auth_code__',
        redirect_uri: nil
      ).and_return('access_token' => 'AccessToken')

      is_expected.to receive(:post).with(
        '/oauth/token',
        client_id: @instance.client_id,
        client_secret: @instance.client_secret,
        grant_type: 'authorization_code',
        code: '__test_auth_code__',
        redirect_uri: nil
      )

      expect(
        @instance.exchange_auth_code_for_tokens(
          '__test_auth_code__'
        )['access_token']
      ).to eq 'AccessToken'
    end

    it 'is expected to make post request to /oauth/token with custom params' do
      allow(@instance).to receive(:post).with(
        '/oauth/token',
        grant_type: 'authorization_code',
        client_id: '_test_custom_client_id__',
        client_secret: '_test_custom_client_secret__',
        code: '__test_auth_code__',
        redirect_uri: '__test_redirect_uri__'
      ).and_return('access_token' => 'AccessToken')

      is_expected.to receive(:post).with(
        '/oauth/token',
        grant_type: 'authorization_code',
        client_id: '_test_custom_client_id__',
        client_secret: '_test_custom_client_secret__',
        code: '__test_auth_code__',
        redirect_uri: '__test_redirect_uri__'
      )

      expect(
        @instance.exchange_auth_code_for_tokens(
          '__test_auth_code__',
          redirect_uri: '__test_redirect_uri__',
          client_id: '_test_custom_client_id__',
          client_secret: '_test_custom_client_secret__'
        )['access_token']
      ).to eq 'AccessToken'
    end

    it 'is expected to raise an error when the code is empty' do
      expect do
        @instance.exchange_auth_code_for_tokens(nil)
      end.to raise_error 'Must provide an authorization code'
    end
  end

  context '.exchange_refresh_token' do
    it { is_expected.to respond_to(:exchange_refresh_token) }

    it 'is expected to make post request to /oauth/token with default params' do
      allow(@instance).to receive(:post).with(
        '/oauth/token',
        grant_type: 'refresh_token',
        client_id: @instance.client_id,
        client_secret: @instance.client_secret,
        refresh_token: '__test_refresh_token__'
      ).and_return('access_token' => 'AccessToken')

      is_expected.to receive(:post).with(
        '/oauth/token',
        grant_type: 'refresh_token',
        client_id: @instance.client_id,
        client_secret: @instance.client_secret,
        refresh_token: '__test_refresh_token__'
      )

      expect(
        @instance.exchange_refresh_token(
          '__test_refresh_token__'
        )['access_token']
      ).to eq 'AccessToken'
    end

    it 'is expected to make post request to /oauth/token with custom params' do
      allow(@instance).to receive(:post).with(
        '/oauth/token',
        grant_type: 'refresh_token',
        client_id: '_test_custom_client_id__',
        client_secret: '_test_custom_client_secret__',
        refresh_token: '__test_refresh_token__'
      ).and_return('access_token' => 'AccessToken')

      is_expected.to receive(:post).with(
        '/oauth/token',
        grant_type: 'refresh_token',
        client_id: '_test_custom_client_id__',
        client_secret: '_test_custom_client_secret__',
        refresh_token: '__test_refresh_token__'
      )

      expect(
        @instance.exchange_refresh_token(
          '__test_refresh_token__',
          client_id: '_test_custom_client_id__',
          client_secret: '_test_custom_client_secret__'
        )['access_token']
      ).to eq 'AccessToken'
    end

    it 'is expected to raise an error when the refresh_token is empty' do
      expect do
        @instance.exchange_refresh_token(nil)
      end.to raise_error 'Must provide a refresh token'
    end
  end

  context '.login_with_resource_owner' do
    it 'should respond to the login_with_resource_owner method' do
      expect(@instance).to respond_to(:login_with_resource_owner)
    end

    it 'should make post to /oauth/token with default params' do
      allow(@instance).to receive(:post).with(
        '/oauth/token',
        username: 'test@test.com',
        password: 'test12345',
        client_id: @instance.client_id,
        client_secret: @instance.client_secret,
        realm: nil,
        audience: nil,
        scope: 'openid',
        grant_type: 'password'
      ).and_return('access_token' => 'AccessToken')

      expect(
        @instance.login_with_resource_owner('test@test.com', 'test12345').token
      ).to eq 'AccessToken'
    end

    it 'should make post to /oauth/token with custom params' do
      allow(@instance).to receive(:post).with(
        '/oauth/token',
        username: 'test@test.com',
        password: 'test12345',
        client_id: '__custom_client_id__',
        client_secret: '__custom_client_secret_',
        realm: '__custom_realm__',
        audience: '__custom_audience__',
        scope: 'openid email',
        grant_type: 'http://auth0.com/oauth/grant-type/password-realm'
      ).and_return('access_token' => 'AccessToken')

      expect(
        @instance.login_with_resource_owner(
          'test@test.com',
          'test12345',
          client_id: '__custom_client_id__',
          client_secret: '__custom_client_secret_',
          realm: '__custom_realm__',
          audience: '__custom_audience__',
          scope: 'openid email'
        ).token
      ).to eq 'AccessToken'
    end

    it 'should raise an error with a blank username' do
      expect do
        @instance.login_with_resource_owner('', 'password')
      end.to raise_error 'Must supply a valid login_name'
    end

    it 'should raise an error with a blank password' do
      expect do
        @instance.login_with_resource_owner('username', '')
      end.to raise_error 'Must supply a valid password'
    end
  end

  context '.login' do
    it { expect(@instance).to respond_to(:login) }
    it 'is expected to make post to /oauth/token' do
      expect(@instance).to receive(:post).with(
        '/oauth/token',
        client_id: @instance.client_id,
        username: 'test@test.com',
        client_secret: @instance.client_secret,
        password: 'test12345', scope: 'openid', connection: 'Username-Password-Authentication',
        grant_type: 'password', id_token: nil, device: nil
      )
      @instance.login('test@test.com', 'test12345')
    end
    it { expect { @instance.login('', '') }.to raise_error 'Must supply a valid username' }
    it { expect { @instance.login('username', '') }.to raise_error 'Must supply a valid password' }
  end

  # Auth0::API::AuthenticationEndpoints.signup
  context '.signup' do
    it { expect(@instance).to respond_to(:signup) }

    it 'is expected to make a post request to /dbconnections/signup' do
      expect(@instance).to receive(:post).with(
        '/dbconnections/signup',
        client_id: @instance.client_id,
        email: 'test@test.com',
        password: 'password',
        connection: 'User'
      )
      @instance.signup('test@test.com', 'password', 'User')
    end

    it 'is expected to raise an error with an empty email' do
      expect do
        @instance.signup('', '')
      end.to raise_error 'Must supply a valid email'
    end

    it 'is expected to raise an error with an empty password' do
      expect do
        @instance.signup('email', '')
      end.to raise_error 'Must supply a valid password'
    end
  end

  # Auth0::API::AuthenticationEndpoints.change_password
  context '.change_password' do
    it { expect(@instance).to respond_to(:change_password) }

    it 'is expected to make post to /dbconnections/change_password' do
      expect(@instance).to receive(:post).with(
        '/dbconnections/change_password',
        client_id: @instance.client_id,
        email: 'test@test.com',
        password: 'password',
        connection: 'User'
      )
      @instance.change_password('test@test.com', 'password', 'User')
    end

    it 'is expected to raise an error with an empty email' do
      expect do
        @instance.change_password('', '', '')
      end.to raise_error 'Must supply a valid email'
    end
  end

  # Auth0::API::AuthenticationEndpoints.start_passwordless_email_flow
  context '.start_passwordless_email_flow' do
    it { expect(@instance).to respond_to(:start_passwordless_email_flow) }

    it 'is expected to make post to /passwordless/start' do
      expect(@instance).to receive(:post).with(
        '/passwordless/start',
        client_id: @instance.client_id,
        client_secret: @instance.client_secret,
        connection: 'email',
        email: 'test@test.com',
        send: 'code',
        authParams: {
          scope: 'scope',
          protocol: 'protocol'
        }
      )
      @instance.start_passwordless_email_flow(
        'test@test.com',
        'code',
        scope: 'scope',
        protocol: 'protocol'
      )
    end

    it 'is expected to raise an error with an empty email' do
      expect do
        @instance.start_passwordless_email_flow('', '', '')
      end.to raise_error 'Must supply a valid email'
    end
  end

  # Auth0::API::AuthenticationEndpoints.start_passwordless_sms_flow
  context '.start_passwordless_sms_flow' do
    let(:phone_number) { Faker::PhoneNumber.cell_phone }

    it { expect(@instance).to respond_to(:start_passwordless_sms_flow) }

    it 'is expected to make post to /passwordless/start' do
      expect(@instance).to receive(:post).with(
        '/passwordless/start',
        client_id: @instance.client_id,
        client_secret: @instance.client_secret,
        connection: 'sms',
        phone_number: phone_number
      )
      @instance.start_passwordless_sms_flow(phone_number)
    end

    it 'is expected to raise an error with an empty phone number' do
      expect do
        @instance.start_passwordless_sms_flow('')
      end.to raise_error 'Must supply a valid phone number'
    end
  end

  context '.phone_login' do
    let(:phone_number) { Faker::PhoneNumber.cell_phone }
    let(:code) { Faker::Number.number(10) }
    it { expect(@instance).to respond_to(:phone_login) }
    it 'is expected to make post to /oauth/ro' do
      expect(@instance).to receive(:post).with(
        '/oauth/ro',
        client_id: @instance.client_id, username: phone_number,
        password: code, connection: 'sms',
        scope: 'openid', grant_type: 'password'
      )
      @instance.phone_login(phone_number, code)
    end
    it { expect { @instance.phone_login('', '') }.to raise_error 'Must supply a valid phone number' }
    it { expect { @instance.phone_login('phone', '') }.to raise_error 'Must supply a valid code' }
  end

  # Auth0::API::AuthenticationEndpoints.saml_metadata
  context '.saml_metadata' do
    it { expect(@instance).to respond_to(:saml_metadata) }

    it 'is expected to make post to SAMLP metadata endpoint' do
      expect(@instance).to receive(:get).with(
        "/samlp/metadata/#{@instance.client_id}"
      )
      @instance.saml_metadata
    end
  end

  # Auth0::API::AuthenticationEndpoints.wsfed_metadata
  context '.wsfed_metadata' do
    it { expect(@instance).to respond_to(:wsfed_metadata) }

    it 'is expected to make post to WS-Fed metadata endpoint' do
      expect(@instance).to receive(:get).with(
        '/wsfed/FederationMetadata/2007-06/FederationMetadata.xml'
      )
      @instance.wsfed_metadata
    end
  end

  context '.token_info' do
    it { expect(@instance).to respond_to(:token_info) }
    it 'is expected to make post to /tokeinfo' do
      expect(@instance).to receive(:post).with('/tokeninfo', id_token: 'SomerandomToken')
      @instance.token_info('SomerandomToken')
    end
    it { expect { @instance.token_info('') }.to raise_error 'Must supply a valid id_token' }
  end

  context '.refresh_delegation' do
    it { expect(@instance).to respond_to(:refresh_delegation) }
    it "is expected to make post request to '/delegation'" do
      expect(@instance).to receive(:post).with(
        '/delegation',
        client_id: @instance.client_id,
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        refresh_token: 'id_token', target: '', api_type: '', scope: '',
        additional_parameter: 'parameter'
      )
      @instance.refresh_delegation('id_token', '', '', '', additional_parameter: 'parameter')
    end
    it { expect { @instance.refresh_delegation('', '', '', '') }.to raise_error 'Must supply a valid token to refresh' }
  end

  context '.delegation' do
    it { expect(@instance).to respond_to(:delegation) }
    it "is expected to make post request to '/delegation'" do
      expect(@instance).to receive(:post).with(
        '/delegation',
        client_id: @instance.client_id,
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        id_token: 'token',
        target: 'target',
        scope: '',
        api_type: 'app'
      )
      @instance.delegation('token', 'target', '')
    end
    it "is expected to make post request to '/delegation'
      with specified api_type" do
      expect(@instance).to receive(:post).with(
        '/delegation',
        client_id: @instance.client_id,
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        id_token: 'id_token', target: '', scope: '',
        api_type: 'salesforce_api'
      )
      @instance.delegation('id_token', '', '', 'salesforce_api')
    end
    it 'allows to pass extra parameters' do
      expect(@instance).to receive(:post).with(
        '/delegation',
        client_id: @instance.client_id,
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        id_token: 'id_token', target: '', scope: '', api_type: '',
        community_name: 'test-community', community_url: 'test-url'
      )
      @instance.delegation(
        'id_token', '', '', '',
        community_name: 'test-community', community_url: 'test-url'
      )
    end
    it { expect { @instance.delegation('', nil, nil, nil) }.to raise_error 'Must supply a valid id_token' }
  end

  context '.impersonate' do
    let(:user_id) { 'some_user_id' }
    let(:impersonator_id) { 'some_other_user_id' }
    let(:app_client_id) { 'app_client_id' }
    it { expect(@instance).to respond_to(:impersonate) }
    it do
      expect { @instance.impersonate('', app_client_id, impersonator_id, {}) }.to raise_error(
        'Must supply a valid user_id'
      )
    end
    it do
      expect { @instance.impersonate(user_id, app_client_id, '', {}) }.to raise_error(
        'Must supply a valid impersonator_id'
      )
    end
    it do
      expect { @instance.impersonate(user_id, '', impersonator_id, {}) }.to raise_error(
        'Must supply a valid app_client_id'
      )
    end
  end

  context '.unlink_user' do
    it { expect(@instance).to respond_to(:unlink_user) }
    it 'is expected to make post to /unlink' do
      expect(@instance).to receive(:post).with('/unlink', access_token: 'access-token', user_id: 'user-id')
      @instance.unlink_user('access-token', 'user-id')
    end
    it { expect { @instance.unlink_user('', '') }.to raise_error 'Must supply a valid access_token' }
    it { expect { @instance.unlink_user('token', '') }.to raise_error 'Must supply a valid user_id' }
  end

  context '.user_info' do
    it { is_expected.to respond_to(:user_info) }
    it 'is expected to make post to /userinfo' do
      is_expected.to receive(:get).with('/userinfo')
      subject.user_info
    end
  end

  context '.userinfo' do
    it { is_expected.to respond_to(:user_info) }
    it 'is expected to make a GET request to /userinfo' do
      is_expected.to receive(:get).with('/userinfo', {}, { 'Authorization' => 'Bearer access-token' })
      subject.userinfo 'access-token'
    end
  end

  context '.authorization_url' do
    let(:redirect_uri) { 'http://redirect.com' }
    it { expect(@instance).to respond_to(:authorization_url) }
    it 'is expected to return an authorization url' do
      expect(@instance.authorization_url(redirect_uri).to_s).to eq(
        "https://#{@instance.domain}/authorize?client_id=#{@instance.client_id}&response_type=code&"\
        'redirect_uri=http%3A%2F%2Fredirect.com'
      )
    end
    let(:additional_parameters) { { additional_parameters: { aparam1: 'test1' } } }
    it 'is expected to return an authorization url with additionalParameters' do
      expect(@instance.authorization_url(redirect_uri, additional_parameters).to_s).to eq(
        "https://#{@instance.domain}/authorize?client_id=#{@instance.client_id}&response_type=code&"\
        'redirect_uri=http%3A%2F%2Fredirect.com&aparam1=test1'
      )
    end
    let(:state) { { state: 'state1' } }
    it 'is expected to return an authorization url with additionalParameters' do
      expect(@instance.authorization_url(redirect_uri, state).to_s).to eq(
        "https://#{@instance.domain}/authorize?client_id=#{@instance.client_id}&response_type=code&"\
        'redirect_uri=http%3A%2F%2Fredirect.com&state=state1'
      )
    end
    let(:connection) { { connection: 'connection-1' } }
    it 'is expected to return an authorization url with additionalParameters' do
      expect(@instance.authorization_url(redirect_uri, connection).to_s).to eq(
        "https://#{@instance.domain}/authorize?client_id=#{@instance.client_id}&response_type=code&"\
        'connection=connection-1&redirect_uri=http%3A%2F%2Fredirect.com'
      )
    end
    it { expect { @instance.authorization_url('', '') }.to raise_error 'Must supply a valid redirect_uri' }
  end

  # Auth0::API::AuthenticationEndpoints.logout_url
  context '.logout_url' do
    let(:return_to) { 'http://returnto.com' }

    it { expect(@instance).to respond_to(:logout_url) }

    it 'is expected to return a logout url' do
      expect(@instance.logout_url(return_to).to_s).to eq(
        "https://#{@instance.domain}/v2/logout?" \
          'returnTo=http%3A%2F%2Freturnto.com'
      )
    end

    it 'is expected to return a logout url with a client ID' do
      expect(@instance.logout_url(return_to, include_client: true).to_s).to eq(
        "https://#{@instance.domain}/v2/logout" \
          "?returnTo=http%3A%2F%2Freturnto.com&client_id=#{@instance.client_id}"
      )
    end

    it 'is expected to return a logout url with federated parameter' do
      expect(@instance.logout_url(return_to, federated: true).to_s).to eq(
        "https://#{@instance.domain}/v2/logout?" \
          'returnTo=http%3A%2F%2Freturnto.com&federated=1'
      )
    end
  end

  # Auth0::API::AuthenticationEndpoints.samlp_url
  context '.samlp_url' do
    it { expect(@instance).to respond_to(:samlp_url) }

    it 'is expected to get the samlp url' do
      expect(@instance.samlp_url.to_s).to eq(
        "https://#{@instance.domain}/samlp/#{@instance.client_id}" \
          '?connection=Username-Password-Authentication'
      )
    end

    it 'is expected to get the samlp url with fb connection' do
      expect(@instance.samlp_url('facebook').to_s).to eq(
        "https://#{@instance.domain}/samlp/#{@instance.client_id}" \
          '?connection=facebook'
      )
    end
  end

  # Auth0::API::AuthenticationEndpoints.wsfed_url
  context '.wsfed_url' do
    it { expect(@instance).to respond_to(:wsfed_url) }

    it 'is expected to get the wsfed url' do
      expect(@instance.wsfed_url.to_s).to eq(
        "https://#{@instance.domain}/wsfed/#{@instance.client_id}" \
          "?whr=#{UP_AUTH}"
      )
    end

    it 'is expected to get the wsfed url with fb connection' do
      expect(@instance.wsfed_url('facebook').to_s).to eq(
        "https://#{@instance.domain}/wsfed/#{@instance.client_id}?whr=facebook"
      )
    end

    it 'is expected to get the wsfed url with wctx' do
      expect(@instance.wsfed_url(UP_AUTH, { wctx: 'wctx_test' }).to_s).to eq(
        "https://#{@instance.domain}/wsfed/#{@instance.client_id}" \
          "?whr=#{UP_AUTH}&wctx=wctx_test"
      )
    end

    it 'is expected to get the wsfed url with wtrealm and wreply' do
      expect(@instance.wsfed_url(
        UP_AUTH,
        {
          wtrealm: 'wtrealm_test',
          wreply: 'wreply_test'
        }
      ).to_s).to eq(
        "https://#{@instance.domain}/wsfed/?whr=#{UP_AUTH}" \
          '&wtrealm=wtrealm_test&wreply=wreply_test'
      )
    end
  end

  # Auth0::API::AuthenticationEndpoints.validate_id_token
  context '.validate_id_token' do
    it { expect(@instance).to respond_to(:validate_id_token) }

    it 'is expected not to raise an error with default values' do
      stub_request(:get, 'https://test.auth0.com/.well-known/jwks.json').to_return(body: JWKS_RESPONSE_1.to_json)
      token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6InRlc3Qta2V5LTEifQ.eyJpc3MiOiJodHRwczovL3Rlc3QuYXV0aDAuY29tLyIsInN1YiI6ImF1dGgwfDEyMzQ1Njc4OSIsImF1ZCI6WyJfX3Rlc3RfYXVkaWVuY2VfXyIsIl9fdGVzdF9jbGllbnRfaWRfXyJdLCJleHAiOjI1MzgzMDExNDYsImlhdCI6MTU4NzU5MjU2MSwiYXpwIjoiX190ZXN0X2NsaWVudF9pZF9fIn0.X35Hfa1C9RtuJIj7Eky2iO4elY9XqCDRy8ieFAft63vGds9vhP38x8QHbJifmLs6vDEOySKfJMWhklp3oaXm6Tk6gyUQEaliW_pXUgZt8C3Xo125R8BMCDQeVJg8Abevbg6FpHpYztWpQuI609tmpoTczx7pXMmAneg6e4LNYvvtzaFD_0M0cxtjkm4OcevCJszNBru3tdXwRynkGbMYeXgoa_FumAshRvIvh-4dtkyNWsepo5IVTvixxF3FVoFaXOOycmFXh9gxOppG4lvE78AFB9AQ9LNS-DNhcXszbPs9KHMrg2bqhSL8Razqd3m2a1MXkdLMBD5DY499MVnb5w'

      expect { @instance.validate_id_token(token) }.to_not raise_exception
    end

    it 'is expected not to raise an error with custom values' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1ZXIiLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsiYXVkaWVuY2UiLCJhbm90aGVyX2F1ZGllbmNlIl0sImV4cCI6MjUzODMwMTE0NiwiaWF0IjoxNTg3NTkyNTYxLCJub25jZSI6Im5vbmNlIiwiYXpwIjoiYXVkaWVuY2UiLCJhdXRoX3RpbWUiOjE1ODc2Nzg5NjF9.u39qTvuUmbzj5jsXjATXxjxJt0u064G1IAumoi18gm0'

      expect do
        @instance.validate_id_token(token,
                                    algorithm: Auth0::Algorithm::HS256.secret('secret'),
                                    leeway: 100,
                                    nonce: 'nonce',
                                    max_age: 2538301146,
                                    issuer: 'issuer',
                                    audience: 'audience')
      end.to_not raise_exception
    end
  end
end
# rubocop:enable Metrics/BlockLength
