require 'spec_helper'
require 'timecop'

describe Auth0::Mixins::TokenManagement do
  let(:client_id) { 'test-client-id' }
  let(:client_secret) { 'test-client-secret' }
  let(:api_identifier) { 'test-audience' }
  let(:domain) { 'samples.auth0.com' }

  let(:payload) { {
    grant_type: 'client_credentials',
    client_id: client_id,
    client_secret: client_secret,
    audience: api_identifier
  } }

  let(:params) { { 
    domain: domain,
    client_id: client_id,
    client_secret: client_secret,
    api_identifier: api_identifier
  } }

  let(:instance) { DummyClassForTokens.send(:include, described_class).new(params) }
  let(:time_now) { Time.now }

  before :each do
    Timecop.freeze(time_now)
  end

  after :each do
    Timecop.return
  end

  context 'get_token' do
    it 'renews the token if there is no token set' do
      expect(RestClient::Request).to receive(:execute).with(hash_including(
        method: :post,
        url: 'https://samples.auth0.com/oauth/token',
        payload: payload.to_json
      ))
      .and_return(StubResponse.new({ 
        "access_token" => "test", 
        "expires_in" => 86400}, 
        true, 
        200))

      instance.send(:get_token)

      expect(instance.instance_variable_get('@token')).to eq('test')
      expect(instance.instance_variable_get('@token_expires_at')).to eq(time_now.to_i + 86400)
    end

    it 'does not renew the token if the expiry time has not been reached' do
      params[:token] = 'test-token'
      params[:token_expires_at] = time_now.to_i + 86400

      expect(RestClient::Request).not_to receive(:execute).with(hash_including(
        method: :post,
        url: 'https://samples.auth0.com/oauth/token',
      ))

      instance.send(:get_token)

      expect(instance.instance_variable_get('@token')).to eq('test-token')
      expect(instance.instance_variable_get('@token_expires_at')).to eq(time_now.to_i + 86400)
    end

    it 'renews the token if within 10 seconds of the expiry' do
      params[:token] = 'test-token'
      params[:token_expires_at] = time_now.to_i + 5

      expect(RestClient::Request).to receive(:execute).with(hash_including(
        method: :post,
        url: 'https://samples.auth0.com/oauth/token',
        payload: payload.to_json
      ))
      .and_return(StubResponse.new({ 
        "access_token" => "renewed_token", 
        "expires_in" => 86400}, 
        true, 
        200))

      instance.send(:get_token)

      expect(instance.instance_variable_get('@token')).to eq('renewed_token')
      expect(instance.instance_variable_get('@token_expires_at')).to eq(time_now.to_i + 86400)
    end

    it 'renews the token if past the expiry' do
      params[:token] = 'test-token'
      params[:token_expires_at] = time_now.to_i - 10

      expect(RestClient::Request).to receive(:execute).with(hash_including(
        method: :post,
        url: 'https://samples.auth0.com/oauth/token',
        payload: payload.to_json
      ))
      .and_return(StubResponse.new({ 
        "access_token" => "renewed_token", 
        "expires_in" => 86400}, 
        true, 
        200))

      instance.send(:get_token)

      expect(instance.instance_variable_get('@token')).to eq('renewed_token')
      expect(instance.instance_variable_get('@token_expires_at')).to eq(time_now.to_i + 86400)
    end

    it 'does not renew existing token if no token_expires_at' do
      params[:token] = 'test-token'

      expect(RestClient::Request).not_to receive(:execute).with(hash_including(
        method: :post,
        url: 'https://samples.auth0.com/oauth/token',
      ))

      instance.send(:get_token)

      expect(instance.instance_variable_get('@token')).to eq('test-token')
      expect(instance.instance_variable_get('@token_expires_at')).to be_nil
    end
  end
end