require 'spec_helper'
require 'timecop'

describe Auth0::Api::AuthenticationEndpoints do
  let(:client_id) { 'test-client-id' }
  let(:client_secret) { 'test-client-secret' }
  let(:api_identifier) { 'test-audience' }
  let(:domain) { 'samples.auth0.com' }

  let(:client_secret_config) { { 
    domain: domain,
    client_id: client_id,
    client_secret: client_secret,
    token: 'test',
    api_identifier: api_identifier
  } }

  let(:client_assertion_config) { { 
    domain: domain,
    client_id: client_id,
    client_assertion_signing_key: client_assertion_signing_key_pair[:private_key],
    client_assertion_signing_alg: 'RS256',
    token: 'test',
    api_identifier: api_identifier
  } }

  let(:client_assertion_signing_key_pair) do
    rsa_private = OpenSSL::PKey::RSA.generate 2048

    { 
      public_key: rsa_private.public_key,
      private_key: rsa_private
    }
  end

  let(:client_secret_instance) { DummyClassForTokens.send(:include, described_class).new(client_secret_config) }
  let(:client_assertion_instance) { DummyClassForTokens.send(:include, described_class).new(client_assertion_config) }
  let(:time_now) { Time.now }

  before :each do
    Timecop.freeze(time_now)
  end

  after :each do
    Timecop.return
  end
  
  context 'AuthenticationEndponts' do
    context 'api_token' do
      it 'requests a new token using client_secret' do
        expect(RestClient::Request).to receive(:execute).with(hash_including(
          method: :post,
          url: 'https://samples.auth0.com/oauth/token',
          payload: {
            grant_type: 'client_credentials',
            client_id: client_id,
            audience: api_identifier,
            client_secret: client_secret
          }.to_json
        ))
        .and_return(StubResponse.new({ 
          "access_token" => "test_response", 
          "expires_in" => 86400,
          "scope" => "scope"}, 
          true, 
          200))

        result = client_secret_instance.send :api_token, audience: api_identifier
        
        expect(result).to be_a_kind_of(Auth0::ApiToken)
        expect(result.access_token).not_to be_nil
        expect(result.scope).not_to be_nil
        expect(result.expires_in).not_to be_nil
      end

      it 'requests a new token using client_assertion' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
          ))

          payload = JSON.parse(arg[:payload], { symbolize_names: true })
          
          expect(payload[:client_secret]).to be_nil
          expect(payload[:client_assertion]).not_to be_nil
          expect(payload[:client_assertion_type]).to eq(Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE)

          StubResponse.new({ 
            "access_token" => "test_response", 
            "expires_in" => 86400,
            "scope" => "scope"}, 
            true, 
            200)
        end

        result = client_assertion_instance.send :api_token, audience: api_identifier
        
        expect(result).to be_a_kind_of(Auth0::ApiToken)
        expect(result.access_token).not_to be_nil
        expect(result.scope).not_to be_nil
        expect(result.expires_in).not_to be_nil
      end
    end

    context 'exchange_auth_code_for_tokens' do
      it 'requests a new token using client_secret' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          )

          expect(JSON.parse(arg[:payload], { symbolize_names: true })).to eq({
            grant_type: 'authorization_code',
            client_id: client_id,
            client_secret: client_secret,
            code: 'the_auth_code',
            redirect_uri: nil
          })
        
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        result = client_secret_instance.send :exchange_auth_code_for_tokens, 'the_auth_code'
        
        expect(result).to be_a_kind_of(Auth0::AccessToken)
        expect(result.id_token).not_to be_nil
        expect(result.access_token).not_to be_nil
        expect(result.expires_in).not_to be_nil
      end

      it 'requests a new token using client_assertion' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token',
            )
          )

          payload = JSON.parse arg[:payload], symbolize_names: true

          expect(payload[:client_secret]).to be_nil
          expect(payload[:client_assertion]).not_to be_nil
          expect(payload[:client_assertion_type]).to eq Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
        
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        result = client_assertion_instance.send :exchange_auth_code_for_tokens, 'the_auth_code'
        
        expect(result).to be_a_kind_of(Auth0::AccessToken)
        expect(result.id_token).not_to be_nil
        expect(result.access_token).not_to be_nil
        expect(result.expires_in).not_to be_nil
      end
    end

    context 'exchange_refresh_token' do
      it 'exchanges the refresh token using a client secret' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          )

          expect(JSON.parse(arg[:payload], { symbolize_names: true })).to eq({
            grant_type: 'refresh_token',
            client_id: client_id,
            client_secret: client_secret,
            refresh_token: 'the_refresh_token'
          })
        
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        result = client_secret_instance.send :exchange_refresh_token, 'the_refresh_token'
        
        expect(result).to be_a_kind_of(Auth0::AccessToken)
        expect(result.id_token).not_to be_nil
        expect(result.access_token).not_to be_nil
        expect(result.expires_in).not_to be_nil
      end

      it 'exchanges the refresh token using client_assertion' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          )

          payload = JSON.parse arg[:payload], symbolize_names: true

          expect(payload[:grant_type]).to eq('refresh_token')
          expect(payload[:refresh_token]).to eq('the_refresh_token')
          expect(payload[:client_secret]).to be_nil
          expect(payload[:client_assertion]).not_to be_nil
          expect(payload[:client_assertion_type]).to eq Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
        
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        result = client_assertion_instance.send :exchange_refresh_token, 'the_refresh_token'
        
        expect(result).to be_a_kind_of(Auth0::AccessToken)
        expect(result.id_token).not_to be_nil
        expect(result.access_token).not_to be_nil
        expect(result.expires_in).not_to be_nil
      end
    end

    context 'exchange_sms_otp_for_tokens' do
      it 'requests the tokens using an OTP from SMS' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          )

          payload = JSON.parse arg[:payload], symbolize_names: true

          expect(payload[:grant_type]).to eq 'http://auth0.com/oauth/grant-type/passwordless/otp'
          expect(payload[:username]).to eq 'phone_number'
          expect(payload[:realm]).to eq 'sms'
          expect(payload[:otp]).to eq 'code'
          expect(payload[:client_id]).to eq client_id
          expect(payload[:client_secret]).to eq client_secret
          expect(payload[:scope]).to eq 'openid profile email'
          expect(payload[:audience]).to be_nil
          
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        result = client_secret_instance.send :exchange_sms_otp_for_tokens, 'phone_number', 'code'

        expect(result).to be_a_kind_of(Auth0::AccessToken)
        expect(result.id_token).not_to be_nil
        expect(result.access_token).not_to be_nil
        expect(result.expires_in).not_to be_nil
      end

      it 'requests the tokens using OTP from SMS, and overrides scope and audience' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          )

          payload = JSON.parse arg[:payload], symbolize_names: true

          expect(payload[:scope]).to eq 'openid'
          expect(payload[:audience]).to eq api_identifier
          
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        result = client_secret_instance.send(:exchange_sms_otp_for_tokens, 'phone_number', 'code',
          audience: api_identifier,
          scope: 'openid'
        )

        expect(result).to be_a_kind_of(Auth0::AccessToken)
        expect(result.id_token).not_to be_nil
        expect(result.access_token).not_to be_nil
        expect(result.expires_in).not_to be_nil
      end

      it 'requests the tokens using an OTP from SMS using client assertion' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          )

          payload = JSON.parse arg[:payload], symbolize_names: true

          expect(payload[:grant_type]).to eq 'http://auth0.com/oauth/grant-type/passwordless/otp'
          expect(payload[:client_secret]).to be_nil
          expect(payload[:client_assertion]).not_to be_nil
          expect(payload[:client_assertion_type]).to eq Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
          
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        client_assertion_instance.send :exchange_sms_otp_for_tokens, 'phone_number', 'code'
      end
    end

    context 'exchange_email_otp_for_tokens' do
      it 'requests the tokens using email OTP' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          )

          payload = JSON.parse arg[:payload], symbolize_names: true

          expect(payload[:grant_type]).to eq 'http://auth0.com/oauth/grant-type/passwordless/otp'
          expect(payload[:username]).to eq 'email_address'
          expect(payload[:realm]).to eq 'email'
          expect(payload[:otp]).to eq 'code'
          expect(payload[:client_id]).to eq client_id
          expect(payload[:client_secret]).to eq client_secret
          expect(payload[:scope]).to eq 'openid profile email'
          expect(payload[:audience]).to be_nil
          
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        result = client_secret_instance.send :exchange_email_otp_for_tokens, 'email_address', 'code'

        expect(result).to be_a_kind_of(Auth0::AccessToken)
        expect(result.id_token).not_to be_nil
        expect(result.access_token).not_to be_nil
        expect(result.expires_in).not_to be_nil
      end

      it 'requests the tokens using OTP from email, and overrides scope and audience' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          )

          payload = JSON.parse arg[:payload], symbolize_names: true

          expect(payload[:scope]).to eq 'openid'
          expect(payload[:audience]).to eq api_identifier
          
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        client_secret_instance.send(:exchange_email_otp_for_tokens, 'email_address', 'code',
          audience: api_identifier,
          scope: 'openid'
        )
      end

      it 'requests the tokens using OTP from email using client assertion' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          )

          payload = JSON.parse arg[:payload], symbolize_names: true

          expect(payload[:grant_type]).to eq 'http://auth0.com/oauth/grant-type/passwordless/otp'
          expect(payload[:client_secret]).to be_nil
          expect(payload[:client_assertion]).not_to be_nil
          expect(payload[:client_assertion_type]).to eq Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
          
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        client_assertion_instance.send(:exchange_email_otp_for_tokens, 'email_address', 'code',
          audience: api_identifier,
          scope: 'openid'
        )
      end
    end

    context 'login_with_resource_owner' do
      it 'logs in using a client secret' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          )

          expect(JSON.parse(arg[:payload], { symbolize_names: true })).to eq({
            username: 'the_username',
            password: 'the_password',
            grant_type: 'password', 
            client_id: client_id,
            client_secret: client_secret,
            realm: nil,
            audience: nil,
            scope: 'openid'
          })
        
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        result = client_secret_instance.send :login_with_resource_owner, 'the_username', 'the_password'
        
        expect(result).to be_a_kind_of(Auth0::AccessToken)
        expect(result.id_token).not_to be_nil
        expect(result.access_token).not_to be_nil
        expect(result.expires_in).not_to be_nil
      end

      it 'logs in using a client secret, realm and audience' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          )

          expect(JSON.parse(arg[:payload], { symbolize_names: true })).to eq({
            username: 'the_username',
            password: 'the_password',
            grant_type: 'http://auth0.com/oauth/grant-type/password-realm',
            client_id: client_id,
            client_secret: client_secret,
            realm: 'my-realm',
            audience: api_identifier,
            scope: 'openid'
          })
        
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        result = client_secret_instance.send :login_with_resource_owner, 'the_username', 'the_password', realm: 'my-realm', audience: api_identifier
        
        expect(result).to be_a_kind_of(Auth0::AccessToken)
        expect(result.id_token).not_to be_nil
        expect(result.access_token).not_to be_nil
        expect(result.expires_in).not_to be_nil
      end

      it 'logs in using client assertion' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          )

          payload = JSON.parse arg[:payload], symbolize_names: true

          expect(payload[:grant_type]).to eq('password')          
          expect(payload[:client_secret]).to be_nil
          expect(payload[:client_assertion]).not_to be_nil
          expect(payload[:client_assertion_type]).to eq Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
        
          StubResponse.new({ 
            "id_token" => "id_token",
            "access_token" => "test_access_token", 
            "expires_in" => 86400}, 
            true,
            200)
        end

        result = client_assertion_instance.send :login_with_resource_owner, 'the_username', 'the_password'
        
        expect(result).to be_a_kind_of(Auth0::AccessToken)
        expect(result.id_token).not_to be_nil
        expect(result.access_token).not_to be_nil
        expect(result.expires_in).not_to be_nil
      end
    end

    context 'start_passwordless_email_flow' do
      it 'starts passwordless flow using a client secret' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/passwordless/start'
            )
          )

          expect(JSON.parse(arg[:payload], { symbolize_names: true })).to eq({
            email: 'email@test.com',
            send: 'link',
            authParams: {},
            connection: 'email',
            client_id: client_id,
            client_secret: client_secret
          })
        
          StubResponse.new({}, true, 200)
        end

        client_secret_instance.send :start_passwordless_email_flow, 'email@test.com'
      end

      it 'starts passwordless email flow using client assertion' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/passwordless/start'
            )
          )

          payload = JSON.parse arg[:payload], symbolize_names: true

          expect(payload[:client_secret]).to be_nil
          expect(payload[:client_assertion]).not_to be_nil
          expect(payload[:client_assertion_type]).to eq Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
        
          StubResponse.new({}, true, 200)
        end

        client_assertion_instance.send :start_passwordless_email_flow, 'email@test.com'
      end
    end

    context 'start_passwordless_sms_flow' do
      it 'starts passwordless flow using a client secret' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/passwordless/start'
            )
          )

          expect(JSON.parse(arg[:payload], { symbolize_names: true })).to eq({
            phone_number: '123456789',
            connection: 'sms',
            client_id: client_id,
            client_secret: client_secret
          })
        
          StubResponse.new({}, true, 200)
        end

        client_secret_instance.send :start_passwordless_sms_flow, '123456789'
      end

      it 'starts passwordless email flow using client assertion' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/passwordless/start'
            )
          )

          payload = JSON.parse arg[:payload], symbolize_names: true

          expect(payload[:client_secret]).to be_nil
          expect(payload[:client_assertion]).not_to be_nil
          expect(payload[:client_assertion_type]).to eq Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
        
          StubResponse.new({}, true, 200)
        end

        client_assertion_instance.send :start_passwordless_sms_flow, '123456789'
      end
    end

    context 'pushed_authorization_request', focus: true do
      it 'sends the request as a form post' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg[:url]).to eq('https://samples.auth0.com/oauth/par')
          expect(arg[:method]).to eq(:post)
          
          expect(arg[:payload]).to eq({
            client_id: client_id,
            client_secret: client_secret,
            connection: nil,
            organization: nil,
            invitation: nil,
            redirect_uri: nil,
            response_type: 'code',
            scope: nil,
            state: nil
          })

          StubResponse.new({}, true, 200)
        end

        client_secret_instance.send :pushed_authorization_request
      end

      it 'sends the request as a form post with all known overrides' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg[:url]).to eq('https://samples.auth0.com/oauth/par')
          expect(arg[:method]).to eq(:post)
          
          expect(arg[:payload]).to eq({
            client_id: client_id,
            client_secret: client_secret,
            connection: 'google-oauth2',
            organization: 'org_id',
            invitation: 'http://invite.url',
            redirect_uri: 'http://localhost:3000',
            response_type: 'id_token',
            scope: 'openid',
            state: 'random_value'
          })

          StubResponse.new({}, true, 200)
        end

        client_secret_instance.send(:pushed_authorization_request,
          response_type: 'id_token',
          redirect_uri: 'http://localhost:3000',
          organization: 'org_id',
          invitation: 'http://invite.url',
          scope: 'openid',
          state: 'random_value',
          connection: 'google-oauth2')
      end

      it 'sends the request as a form post using client assertion' do
        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg[:url]).to eq('https://samples.auth0.com/oauth/par')
          expect(arg[:method]).to eq(:post)
          expect(arg[:payload][:client_secret]).to be_nil
          expect(arg[:payload][:client_assertion]).not_to be_nil
          expect(arg[:payload][:client_assertion_type]).to eq Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
  
          StubResponse.new({}, true, 200)
        end
  
        client_assertion_instance.send :pushed_authorization_request
      end
    end
  end
end