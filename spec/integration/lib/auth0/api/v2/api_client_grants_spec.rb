require 'spec_helper'
describe Auth0::Api::V2::ClientGrants do
  attr_reader :client, :client_id, :audience, :existing_grant, :scope

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    @client_id = v2_creds[:client_id]
    sleep 1
    @audience = "https://#{client.clients[0]['tenant']}.auth0.com/api/v2/"
    @scope = [Faker::Lorem.word]
    sleep 1
    @existing_grant = client.create_client_grant('client_id' => client_id, 'audience' => audience, 'scope' => scope)
  end

  after(:all) do
    grants = client.client_grants
    grants.each do |grant|
      sleep 1
      client.delete_client_grant(grant['id'])
    end
  end

  describe '.client_grants' do
    let(:client_grants) do
      sleep 1
      client.client_grants
    end

    it do
      sleep 1
      expect(client_grants.size).to be > 0
    end
    it do
      sleep 1
      expect(client_grants).to include(existing_grant)
    end
  end

  describe '.patch_client_grant' do
    let(:new_scope) { [Faker::Lorem.word] }
    it do
      sleep 1
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
      sleep 1
      expect { client.delete_client_grant(existing_grant['id']) }.to_not raise_error
    end
  end
end
