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
        '/oauth/token', client_id: nil, client_secret: nil, grant_type: 'client_credentials'
      )
        .and_return('access_token' => 'AccessToken')
      expect(@instance).to receive(:post).with(
        '/oauth/token', client_id: nil, client_secret: nil, grant_type: 'client_credentials'
      )
      expect(@instance.obtain_access_token).to eql 'AccessToken'
    end
  end

  context '.obtain_access_token social' do
    it { expect(@instance).to respond_to(:obtain_access_token) }
    it "is expected to make post request to '/oauth/access_token'" do
      allow(@instance).to receive(:post).with(
        '/oauth/access_token', client_id: nil, access_token: 'access_token', connection: 'facebook', scope: 'openid'
      )
        .and_return('access_token' => 'AccessToken')
      expect(@instance).to receive(:post).with(
        '/oauth/access_token', client_id: nil, access_token: 'access_token', connection: 'facebook', scope: 'openid'
      )
      expect(@instance.obtain_access_token('access_token', 'facebook', 'openid')).to eql 'AccessToken'
    end
  end

  context '.login' do
    it { expect(@instance).to respond_to(:login) }
    it 'is expected to make post to /oauth/ro' do
      expect(@instance).to receive(:post).with(
        '/oauth/ro',
        client_id: nil, username: 'test@test.com',
        password: 'password', scope: 'openid', connection: 'Username-Password-Authentication',
        grant_type: 'password', id_token: nil, device: nil
      )
      @instance.login('test@test.com', 'password')
    end
    it { expect { @instance.login('', '') }.to raise_error 'Must supply a valid username' }
    it { expect { @instance.login('username', '') }.to raise_error 'Must supply a valid password' }
  end

  context '.signup' do
    it { expect(@instance).to respond_to(:signup) }
    it 'is expected to make post to /dbconnections/signup' do
      expect(@instance).to receive(:post).with(
        '/dbconnections/signup',
        client_id: nil, email: 'test@test.com',
        password: 'password', connection: 'User'
      )
      @instance.signup('test@test.com', 'password', 'User')
    end
    it { expect { @instance.signup('', '') }.to raise_error 'Must supply a valid email' }
    it { expect { @instance.signup('email', '') }.to raise_error 'Must supply a valid password' }
  end

  context '.change_password' do
    it { expect(@instance).to respond_to(:change_password) }
    it 'is expected to make post to /dbconnections/change_password' do
      expect(@instance).to receive(:post).with(
        '/dbconnections/change_password',
        client_id: nil, email: 'test@test.com',
        password: 'password', connection: 'User'
      )
      @instance.change_password('test@test.com', 'password', 'User')
    end
    it { expect { @instance.change_password('', '', '') }.to raise_error 'Must supply a valid email' }
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
        }
      )
      @instance.start_passwordless_email_flow('test@test.com', 'link', scope: 'scope', protocol: 'protocol')
    end
    it { expect { @instance.start_passwordless_email_flow('', '', '') }.to raise_error 'Must supply a valid email' }
  end

  context '.start_passwordless_sms_flow' do
    let(:phone_number) { Faker::PhoneNumber.cell_phone }
    it { expect(@instance).to respond_to(:start_passwordless_sms_flow) }
    it 'is expected to make post to /passwordless/start' do
      expect(@instance).to receive(:post).with(
        '/passwordless/start',
        client_id: nil,
        connection: 'sms',
        phone_number: phone_number
      )
      @instance.start_passwordless_sms_flow(phone_number)
    end
    it { expect { @instance.start_passwordless_sms_flow('') }.to raise_error 'Must supply a valid phone number' }
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
        scope: 'openid', grant_type: 'password'
      )
      @instance.phone_login(phone_number, code)
    end
    it { expect { @instance.phone_login('', '') }.to raise_error 'Must supply a valid phone number' }
    it { expect { @instance.phone_login('phone', '') }.to raise_error 'Must supply a valid code' }
  end

  context '.saml_metadata' do
    let(:client_id) { 'client-id' }
    it { expect(@instance).to respond_to(:saml_metadata) }
    it 'is expected to make post to /samlp/metadata/client-id' do
      expect(@instance).to receive(:get).with("/samlp/metadata/#{client_id}")
      @instance.saml_metadata(client_id)
    end
    it { expect { @instance.saml_metadata('') }.to raise_error 'Must supply a valid client_id' }
  end

  context '.wsfed_metadata' do
    it { expect(@instance).to respond_to(:wsfed_metadata) }
    it 'is expected to make post to /wsfed/FederationMetadata/2007-06/FederationMetadata.xml' do
      expect(@instance).to receive(:get).with('/wsfed/FederationMetadata/2007-06/FederationMetadata.xml')
      @instance.wsfed_metadata
    end
  end

  context '.authorization_url' do
    let(:redirect_url) { 'http://redirect.com' }
    it { expect(@instance).to respond_to(:authorization_url) }
    it 'is expected to return an authorization url' do
      expect(@instance.authorization_url(redirect_url).to_s).to eq(
        "https://#{@instance.domain}/authorize?response_type=code&redirect_url=#{redirect_url}"
      )
    end
    let(:additional_parameters) { { additional_parameters: { aparam1: 'test1' } } }
    it 'is expected to return an authorization url with additionalParameters' do
      expect(@instance.authorization_url(redirect_url, additional_parameters).to_s).to eq(
        "https://#{@instance.domain}/authorize?response_type=code&redirect_url=#{redirect_url}&aparam1=test1"
      )
    end
    let(:state) { { state: 'state1' } }
    it 'is expected to return an authorization url with additionalParameters' do
      expect(@instance.authorization_url(redirect_url, state).to_s).to eq(
        "https://#{@instance.domain}/authorize?response_type=code&redirect_url=#{redirect_url}&state=state1"
      )
    end
    it { expect { @instance.authorization_url('', '') }.to raise_error 'Must supply a valid redirect_uri' }
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
        client_id: nil,
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
        client_id: nil,
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
        client_id: nil,
        grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        id_token: 'id_token', target: '', scope: '',
        api_type: 'salesforce_api'
      )
      @instance.delegation('id_token', '', '', 'salesforce_api')
    end
    it 'allows to pass extra parameters' do
      expect(@instance).to receive(:post).with(
        '/delegation',
        client_id: nil,
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
    it { expect(@instance).to respond_to(:impersonate) }
    #     it "is expected to make post request to '/users/{user_id}/impersonate'" do
    #       expect(@instance).to receive(:post).with(
    #         "/users/#{user_id}/impersonate",
    #         protocol: 'oauth2',
    #         impersonator_id: impersonator_id, client_id: app_client_id,
    #         additionalParameters: {
    #           response_type: 'code', state: '',
    #           scope: 'openid', callback_url: '' })
    #       @instance.impersonate(user_id, app_client_id, impersonator_id, {})
    #     end
    it do
      expect { @instance.impersonate(user_id, {}) }.to raise_error(
        'Must supply client_secret'
      )
    end
    it { expect { @instance.impersonate('', '') }.to raise_error 'Must supply a valid user_id' }
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
    it { expect(@instance).to respond_to(:user_info) }
    it 'is expected to make post to /userinfo' do
      expect(@instance).to receive(:get).with('/userinfo')
      @instance.user_info
    end
  end

  context '.logout_url' do
    let(:return_to) { 'http://returnto.com' }
    it { expect(@instance).to respond_to(:logout_url) }
    it 'is expected to return a logout url' do
      expect(@instance.logout_url(return_to).to_s).to eq(
        "https://#{@instance.domain}/logout?returnTo=#{return_to}"
      )
    end
  end

  context '.samlp_url' do
    it { expect(@instance).to respond_to(:samlp_url) }
    it 'is expected to get the samlp url' do
      expect(@instance.samlp_url.to_s).to eq(
        "https://#{@instance.domain}/samlp/?connection=Username-Password-Authentication"
      )
    end
    it 'is expected to get the samlp url with fb connection' do
      expect(@instance.samlp_url('facebook').to_s).to eq(
        "https://#{@instance.domain}/samlp/?connection=facebook"
      )
    end
  end

  context '.wsfed_url' do
    it { expect(@instance).to respond_to(:wsfed_url) }
    it 'is expected to get the wsfed url' do
      expect(@instance.wsfed_url.to_s).to eq(
        "https://#{@instance.domain}/wsfed/?whr=Username-Password-Authentication"
      )
    end
    it 'is expected to get the wsfed url with fb connection' do
      expect(@instance.wsfed_url('facebook').to_s).to eq(
        "https://#{@instance.domain}/wsfed/?whr=facebook"
      )
    end
  end
end
