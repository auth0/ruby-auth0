require 'spec_helper'
describe Auth0::Api::V2::ClientGrants do
  attr_reader :client, :client_id, :audience, :existing_grant, :scope, :existing_client

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    @client_id = v2_creds[:client_id]
    @existing_client = client.create_client("client-grant-test-#{entity_suffix}")
    @audience = "https://#{client.clients[0]['tenant']}.auth0.com/api/v2/"
    @scope = [Faker::Lorem.word]
    @existing_grant = client.create_client_grant(
      'client_id' => existing_client['client_id'],
      'audience' => audience,
      'scope' => scope
    )
  end

  after(:all) do
    grants = client.client_grants
    grants.each do |grant|
      client.delete_client_grant(grant['id'])
    end
  end

  describe '.client_grants' do
    let(:client_grants) do
      client.client_grants
    end

    it 'is expected to have a result' do
      expect(client_grants.size).to be > 0
    end

    it 'is expected to match the created grant' do
      expect(client_grants).to include(existing_grant)
    end

    it 'is expected to return the first page of one result' do
      results = client.client_grants(
        page: 0,
        per_page: 1
      )
      expect(results.first).to equal(results.last)
      expect(results.first).to eq(existing_grant)
    end
  end

  describe '.patch_client_grant' do
    let(:new_scope) { [Faker::Lorem.word] }
    it do
      expect(
        client.patch_client_grant(
          existing_grant['id'],
          'scope' => new_scope
        )
      ).to(include('scope' => new_scope))
    end
  end

  describe '.delete_client_grant' do
    it do
      expect { client.delete_client_grant(existing_grant['id']) }.to_not raise_error
    end
  end
end
