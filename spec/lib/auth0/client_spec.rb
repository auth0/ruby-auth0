require 'spec_helper'

describe Auth0::Client do
  shared_examples_for 'v1 API client' do
    it { should be_a Auth0::Api::V1 }
    it { should be_a Auth0::Api::V1::Users }
    it { should be_a Auth0::Api::V1::Connections }
    it { should be_a Auth0::Api::V1::Clients }
    it { should be_a Auth0::Api::V1::Rules }
    it { should be_a Auth0::Api::V1::Logs }
    it { should_not be_a Auth0::Api::V2 }
    it { should_not be_a Auth0::Api::V2::Clients }
    it { should_not be_a Auth0::Api::V2::Users }
    it { should_not be_a Auth0::Api::V2::Jobs }
    it { should_not be_a Auth0::Api::V2::Stats }
    it { should_not be_a Auth0::Api::V2::Blacklists }
  end

  shared_examples_for 'v2 API client' do
    it { should be_a Auth0::Api::V2 }
    it { should be_a Auth0::Api::V2::Clients }
    it { should be_a Auth0::Api::V2::Users }
    it { should be_a Auth0::Api::V2::Stats }
    it { should be_a Auth0::Api::V2::Jobs }
    it { should be_a Auth0::Api::V2::Blacklists }
    it { should_not be_a Auth0::Api::V1 }
    it { should_not be_a Auth0::Api::V1::Users }
    it { should_not be_a Auth0::Api::V1::Connections }
    it { should_not be_a Auth0::Api::V1::Clients }
    it { should_not be_a Auth0::Api::V1::Rules }
    it { should_not be_a Auth0::Api::V1::Logs }
  end

  shared_examples_for 'authentication API client' do
    it { should be_a Auth0::Api::AuthenticationEndpoints }
  end

  let(:domain) { 'samples.auth0.com' }
  let(:client_id) { 'client_id' }
  let(:client_secret) { 'client_secret' }
  let(:jwt) { 'Header.Payload.Signature' }
  let(:access_token) { 'token' }

  describe 'V1 client' do
    before :each do
      allow_any_instance_of(Auth0::Api::AuthenticationEndpoints).to receive(:obtain_access_token).and_return 'token'
    end

    context 'with namespace' do
      let(:subject) do
        Auth0::Client.new(client_id: 'client_id', client_secret: 'client_secret', namespace: 'samples.auth0.com')
      end

      it_should_behave_like 'v1 API client'
      it_should_behave_like 'authentication API client'
    end

    context 'with domain' do
      let(:subject) do
        Auth0::Client.new(client_id: 'client_id', client_secret: 'client_secret', domain: 'samples.auth0.com')
      end

      it_should_behave_like 'v1 API client'
      it_should_behave_like 'authentication API client'
    end

    context 'with version' do
      let(:subject) do
        Auth0::Client.new(
          client_id: 'client_id',
          client_secret: 'client_secret',
          domain: 'samples.auth0.com',
          api_version: 1
        )
      end
      it_should_behave_like 'v1 API client'
      it_should_behave_like 'authentication API client'
    end
  end

  describe 'V2 client' do
    before :each do
      expect_any_instance_of(Auth0::Api::AuthenticationEndpoints).not_to receive(:obtain_access_token)
    end

    context 'with namespace' do
      let(:subject) { Auth0::Client.new(protocols: 'v2', access_token: 'access_token', namespace: 'samples.auth0.com') }
      it_should_behave_like 'v2 API client'
      it_should_behave_like 'authentication API client'
    end

    context 'with domain' do
      let(:subject) { Auth0::Client.new(protocols: 'v2', access_token: 'access_token', domain: 'samples.auth0.com') }
      it_should_behave_like 'v2 API client'
      it_should_behave_like 'authentication API client'
    end

    context 'with version' do
      let(:subject) { Auth0::Client.new(api_version: 2, access_token: 'access_token', domain: 'samples.auth0.com') }
      it_should_behave_like 'v2 API client'
      it_should_behave_like 'authentication API client'
    end
  end
end
