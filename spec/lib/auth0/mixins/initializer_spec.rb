require 'spec_helper'
require 'timecop'

class MockClass
  attr_reader :token
  include Auth0::Mixins::Initializer
  include Auth0::Mixins::HTTPProxy
  include Auth0::Mixins::Headers
  include Auth0::Mixins::TokenManagement
end

describe Auth0::Mixins::Initializer do
  let(:params) { { namespace: 'samples.auth0.com' } }
  let(:instance) { DummyClassForProxy.send(:include, described_class).new(params) }
  let(:time_now) { Time.now }
  
  let(:client_assertion_signing_key_pair) do
    rsa_private = OpenSSL::PKey::RSA.generate 2048

    { 
      public_key: rsa_private.public_key,
      private_key: rsa_private
    }
  end

  context 'api v2' do
    it 'sets retry_count when passed' do
      params[:token] = '123'
      params[:retry_count] = 10

      expect(instance.instance_variable_get('@retry_count')).to eq(10)
    end
  end

  context 'token initialization' do
    before do
      params[:api_version] = 2
      Timecop.freeze(time_now)
    end

    after do
      Timecop.return
    end

    it 'sets token when access_token is passed' do
      params[:access_token] = '123'

      expect(instance.instance_variable_get('@token')).to eq('123')
    end

    it 'sets token when token is passed' do
      params[:token] = '123'

      expect(instance.instance_variable_get('@token')).to eq('123')
    end

    context 'with a client secret' do
      it 'fetches a token if none was given' do
        params[:client_id] = client_id = 'test_client_id'
        params[:client_secret] = client_secret = 'test_client_secret'
        params[:api_identifier] = api_identifier = 'test'

        payload = {
          grant_type: 'client_credentials',
          client_id: client_id,
          client_secret: client_secret,
          audience: api_identifier
        }  

        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to(match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          ))

          expect(JSON.parse(arg[:payload], { symbolize_names: true })).to eq(payload)
          
          StubResponse.new({ 
          "access_token" => "test", 
          "expires_in" => 86400}, 
          true, 
          200)
        end

        expect(instance.instance_variable_get('@token')).to eq('test')
        expect(instance.instance_variable_get('@token_expires_at')).to eq(time_now.to_i + 86400)
      end
    end

    context 'with a client assertion signing key', focus: true do
      it 'fetches a token if none was given' do
        client_assertion_signing_key_pair => {private_key:}
        params[:client_id] = client_id = 'test_client_id'
        params[:api_identifier] = api_identifier = 'test'
        params[:client_assertion_signing_key] = private_key

        expect(RestClient::Request).to receive(:execute) do |arg|
          expect(arg).to(match(
            include(
              method: :post,
              url: 'https://samples.auth0.com/oauth/token'
            )
          ))

          payload = JSON.parse(arg[:payload], { symbolize_names: true })
          
          expect(payload[:grant_type]).to eq 'client_credentials'
          expect(payload[:client_id]).to eq client_id
          expect(payload[:audience]).to eq api_identifier
          expect(payload[:client_secret]).to be_nil
          expect(payload[:client_assertion]).not_to be_nil
          expect(payload[:client_assertion_type]).to eq Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
          
          StubResponse.new({ 
          "access_token" => "test", 
          "expires_in" => 86400}, 
          true, 
          200)
        end

        expect(instance.instance_variable_get('@token')).to eq('test')
        expect(instance.instance_variable_get('@token_expires_at')).to eq(time_now.to_i + 86400)
      end
    end

    it "doesn't get a new token if one was supplied using 'token'" do
      params[:token] = 'access-token'

      expect(RestClient::Request).not_to receive(:execute).with(hash_including(
          method: :post,
          url: 'https://samples.auth0.com/oauth/token',
      ))

      expect(instance.instance_variable_get('@token')).to eq('access-token')
      expect(instance.instance_variable_get('@token_expires_at')).to eq(Time.now.to_i + 3600)
    end

    it "doesn't get a new token if one was supplied using 'access_token'" do
      params[:access_token] = 'access-token'

      expect(RestClient::Request).not_to receive(:execute).with(hash_including(
          method: :post,
          url: 'https://samples.auth0.com/oauth/token',
      ))

      expect(instance.instance_variable_get('@token')).to eq('access-token')
      expect(instance.instance_variable_get('@token_expires_at')).to eq(Time.now.to_i + 3600)
    end

    it 'can supply token_expires_at option' do
      params[:token] = 'access-token'
      params[:token_expires_at] = time_now.to_i + 300

      expect(RestClient::Request).not_to receive(:execute).with(hash_including(
          method: :post,
          url: 'https://samples.auth0.com/oauth/token',
      ))

      expect(instance.instance_variable_get('@token')).to eq('access-token')
      expect(instance.instance_variable_get('@token_expires_at')).to eq(time_now.to_i + 300)
    end

    it 'throws if no token or credentials were given' do
      params[:client_id] = 'test-client-id'
      expect { instance }.to raise_error(Auth0::InvalidCredentials)
    end
  end
end
