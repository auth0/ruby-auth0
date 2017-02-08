require 'spec_helper'

describe Auth0::Client do
  shared_examples_for 'v2 API client' do
    it { should be_a Auth0::Api::V2 }
    it { should be_a Auth0::Api::V2::Clients }
    it { should be_a Auth0::Api::V2::Users }
    it { should be_a Auth0::Api::V2::Stats }
    it { should be_a Auth0::Api::V2::Jobs }
    it { should be_a Auth0::Api::V2::Blacklists }
  end

  shared_examples_for 'authentication API client' do
    it { should be_a Auth0::Api::AuthenticationEndpoints }
  end

  let(:domain) { 'samples.auth0.com' }
  let(:client_id) { 'client_id' }
  let(:client_secret) { 'client_secret' }
  let(:access_token) { 'token' }

  describe 'V1 client' do
    context 'deprecated' do
      it 'is expected to raise error' do
        expect do
          Auth0::Client.new(protocols: 'v1', client_id: 'client_id', client_secret: 'client_secret',
                            namespace: 'samples.auth0.com')
        end.to raise_error(Auth0::InvalidApiNamespace)
      end
    end
  end

  describe 'V2 client' do
    before :each do
      expect_any_instance_of(Auth0::Api::AuthenticationEndpoints).not_to receive(:obtain_access_token)
    end

    context 'with namespace' do
      let(:subject) { Auth0::Client.new(access_token: 'access_token', namespace: 'samples.auth0.com') }
      it_should_behave_like 'v2 API client'
      it_should_behave_like 'authentication API client'
    end

    context 'with domain' do
      let(:subject) { Auth0::Client.new(access_token: 'access_token', domain: 'samples.auth0.com') }
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
