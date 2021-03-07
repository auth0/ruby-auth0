require 'spec_helper'

describe Auth0::Client do
  shared_examples_for 'v2 API client' do
    it { should be_a Auth0::Api::V2 }
    it { should be_a Auth0::Api::V2::Blacklists }
    it { should be_a Auth0::Api::V2::Clients }
    it { should be_a Auth0::Api::V2::ClientGrants }
    it { should be_a Auth0::Api::V2::Connections }
    it { should be_a Auth0::Api::V2::DeviceCredentials }
    it { should be_a Auth0::Api::V2::Emails }
    it { should be_a Auth0::Api::V2::Jobs }
    it { should be_a Auth0::Api::V2::Logs }
    it { should be_a Auth0::Api::V2::ResourceServers }
    it { should be_a Auth0::Api::V2::Rules }
    it { should be_a Auth0::Api::V2::Stats }
    it { should be_a Auth0::Api::V2::Tenants }
    it { should be_a Auth0::Api::V2::Tickets }
    it { should be_a Auth0::Api::V2::UserBlocks }
    it { should be_a Auth0::Api::V2::Users }
    it { should be_a Auth0::Api::V2::UsersByEmail }
  end

  shared_examples_for 'Authentication API client' do
    it { should be_a Auth0::Api::AuthenticationEndpoints }
  end

  let(:domain) { 'samples.auth0.com' }
  let(:client_id) { '__test_client_id__' }
  let(:client_secret) { '__test_client_secret__' }
  let(:access_token) { '__test_access_token__' }
  let(:organization) { '__test_organization__'}

  describe 'V2 client with token' do

    before :each do
      expect_any_instance_of(Auth0::Api::AuthenticationEndpoints)
        .not_to receive(:obtain_access_token)
    end

    context 'and namespace' do
      let(:subject) do
        Auth0::Client.new(
          access_token: access_token,
          namespace: domain
        )
      end
      it_should_behave_like 'v2 API client'
      it_should_behave_like 'Authentication API client'
    end

    context 'and domain' do
      let(:subject) do
        Auth0::Client.new(
          access_token: access_token,
          domain: domain
        )
      end
      it_should_behave_like 'v2 API client'
      it_should_behave_like 'Authentication API client'
    end

    context 'and version' do
      let(:subject) do
        Auth0::Client.new(
          api_version: 2,
          access_token: access_token,
          domain: domain
        )
      end
      it_should_behave_like 'v2 API client'
      it_should_behave_like 'Authentication API client'
    end

    context 'with token' do
      let(:subject) do
        Auth0::Client.new(
          api_version: 2,
          token: access_token,
          domain: domain
        )
      end
      it_should_behave_like 'v2 API client'
      it_should_behave_like 'Authentication API client'
    end

    context 'with token and client_secret' do
      let(:subject) do
        Auth0::Client.new(
          token: access_token,
          domain: domain,
          client_secret: client_secret,
        )
      end
      it_should_behave_like 'v2 API client'
      it_should_behave_like 'Authentication API client'
    end
  end

  describe 'V2 client without token' do
    context 'should try to get an API token' do
      before do
        stub_api_token
      end

      let(:subject) do
        Auth0::Client.new(
          domain: domain,
          client_id: client_id,
          client_secret: client_secret,
        )
      end
      it_should_behave_like 'v2 API client'
      it_should_behave_like 'Authentication API client'
    end

    context 'when try to get an API tokenwith api_identifier' do
      let(:api_identifier) { 'https://samples.api_identifier/api/v2/' }

      before do
        stub_api_token_with_api_identifier 
      end

      let(:subject) do
        Auth0::Client.new(
          domain: domain,
          client_id: client_id,
          client_secret: client_secret,
          api_identifier: api_identifier
        )
      end

      it_should_behave_like 'v2 API client'
      it_should_behave_like 'Authentication API client'  
    end

    context 'when try to get an API tokenwith organization' do
      before do
        stub_api_token_with_organization
      end

      let(:subject) do
        Auth0::Client.new(
          domain: domain,
          client_id: client_id,
          client_secret: client_secret,
          organization: organization
        )
      end
      it_should_behave_like 'v2 API client'
      it_should_behave_like 'Authentication API client'
    end

    context 'should fail if' do

      it 'does not have a client_secret' do
        expect do
          Auth0::Client.new(
            domain: domain,
            client_id: client_id,
          )
        end.to raise_error('Must supply a valid API token')
      end
    end
  end

  def stub_api_token
    stub_request(:post, "https://#{domain}/oauth/token")
      .with(
        body: hash_including(
          {
            grant_type: 'client_credentials',
            client_id: client_id,
            client_secret: client_secret,
            audience: "https://#{domain}/api/v2/"
          }
        )
      )
      .to_return(
        headers: { 'Content-Type' => 'application/json' },
        body: '{"access_token":"__test_access_token__"}',
        status: 200
      )
  end

  def stub_api_token_with_api_identifier
    stub_request(:post, "https://#{domain}/oauth/token")
      .with(
        body: hash_including(
          {
            grant_type: 'client_credentials',
            client_id: client_id,
            client_secret: client_secret,
            audience: api_identifier
          }
        )
      )
      .to_return(
        headers: { 'Content-Type' => 'application/json' },
        body: '{"access_token":"__test_access_token__"}',
        status: 200
      )
  end

  def stub_api_token_with_organization
    stub_request(:post, "https://#{domain}/oauth/token")
      .with(
        body: hash_including(
          {
            grant_type: 'client_credentials',
            client_id: client_id,
            client_secret: client_secret,
            organization: organization
          }
        )
      )
      .to_return(
        headers: { 'Content-Type' => 'application/json' },
        body: '{"access_token":"__test_access_token__"}',
        status: 200
      )
  end
end
