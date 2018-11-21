require 'spec_helper'
describe Auth0::Client do
  shared_examples 'invalid credentials' do |credentials, error|
    it "raise an error with credentials #{credentials}" do
      if error.nil?
        expect { Auth0Client.new(credentials) }.to raise_error
      else
        expect { Auth0Client.new(credentials) }.to raise_error(error)
      end
    end
  end

  it_should_behave_like 'invalid credentials', {
    namespace: 'samples.auth0.com'
  }, Auth0::InvalidCredentials

  it_should_behave_like 'invalid credentials', {
    namespace: 'samples.auth0.com', client_id: 'client_id'
  }, Auth0::InvalidCredentials

  it_should_behave_like 'invalid credentials', {
    namespace: 'samples.auth0.com', client_secret: 'secret'
  }, Auth0::InvalidCredentials

  it_should_behave_like 'invalid credentials', {
    namespace: 'samples.auth0.com', api_version: 2
  }, Auth0::InvalidCredentials

  it_should_behave_like 'invalid credentials', {}, Auth0::InvalidApiNamespace

  it_should_behave_like 'invalid credentials', {
    api_version: 2
  }, Auth0::InvalidApiNamespace

  it_should_behave_like 'invalid credentials', {
    api_version: 1
  }, Auth0::InvalidApiNamespace

  it_should_behave_like 'invalid credentials', {
    client_id: 'client_id', client_secret: 'secret'
  }, Auth0::InvalidApiNamespace

  it_should_behave_like 'invalid credentials', {
    api_version: 2, token: 'token'
  }, Auth0::InvalidApiNamespace

  let(:token) { ENV['MASTER_JWT'] }
  let(:v2_credentials) { { domain: ENV['DOMAIN'] } }

  shared_examples 'valid credentials' do
    it { expect { Auth0Client.new(credentials) }.to_not raise_error }
  end

  it_should_behave_like 'valid credentials' do
    let(:credentials) { v2_credentials.merge(token: token) }
  end

  it_should_behave_like 'valid credentials' do
    let(:credentials) { v2_credentials.merge(access_token: ENV['MASTER_JWT']) }
  end

  context 'client headers' do
    let(:client) { Auth0::Client.new(v2_credentials.merge(access_token: 'abc123', domain: 'myhost.auth0.com')) }
    let(:headers) { client.headers }
    let(:telemetry) do
      JSON.parse(Base64::urlsafe_decode64(headers['Auth0-Client']))
    end

    it 'has the correct headers present' do
      expect(headers.keys.sort).to eql(['Auth0-Client', 'Authorization', 'Content-Type'])
    end

    it 'uses the correct access token' do
      expect(headers['Authorization']).to eql 'Bearer abc123'
    end

    it 'is always json' do
      expect(headers['Content-Type']).to eql 'application/json'
    end

    it 'should include the correct name in telemetry data' do
      expect(telemetry['name']).to eq('ruby-auth0')
    end

    it 'should include the correct version in telemetry data' do
      expect(telemetry['version']).to eq(Auth0::VERSION)
    end

    it 'should include the correct env in telemetry data' do
      expect(telemetry['env']['ruby']).to eq(RUBY_VERSION)
    end
  end
end
