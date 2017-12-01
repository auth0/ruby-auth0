require 'spec_helper'
describe Auth0::Api::V2::ClientGrants do
  attr_reader :client, :client_id, :audience, :existing_grant, :scope

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    @client_id = v2_creds[:client_id]
    @audience = "https://#{client.clients[0]['tenant']}.auth0.com/api/v2/"
    @scope = [Faker::Lorem.word]
    @existing_grant = client.create_client_grant('client_id' => client_id, 'audience' => audience, 'scope' => scope)
  end

  after(:all) do
    grants = client.client_grants
    grants.each do |grant|
      client.delete_client_grant(grant['id'])
    end
  end

  describe '.client_grants' do
    let(:client_grants) { client.client_grants }

    it { expect(client_grants.size).to be > 0 }
    it { expect(client_grants).to include(existing_grant) }
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
    it { expect { client.delete_client_grant(existing_grant['id']) }.to_not raise_error }
  end
end
