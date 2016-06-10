require 'spec_helper'
describe Auth0::Api::V2::ResourceServers do
  attr_reader :client, :resource_server

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    identifier = SecureRandom.uuid
    @resource_server = client.create_resource_server(identifier)
  end

  after(:all) do
    client.delete_resource_server(resource_server['id'])
  end

  describe '.resource_server' do
    it do
      expect(client.resource_server(resource_server['id'])).to(
        include('identifier' => resource_server['identifier'], 'id' => resource_server['id'],
                'signing_alg' => resource_server['signing_alg'],
                'token_lifetime' => resource_server['token_lifetime']))
    end
  end

  describe '.create_resource_server' do
    let(:name) { Faker::Lorem.word }
    let(:identifier) { SecureRandom.uuid }
    let(:signing_alg) { 'HS256' }
    let(:signing_secret) { Faker::Lorem.characters(16) }
    let(:token_lifetime) { rand(1000..3000) }
    let!(:resource_server) do
      client.create_resource_server(identifier, 'name' => name, 'signing_alg' => signing_alg,
                                                'signing_secret' => signing_secret,
                                                'token_lifetime' => token_lifetime)
    end
    it do
      expect(resource_server).to include('name' => name, 'identifier' => identifier, 'signing_alg' => signing_alg,
                                         'signing_secret' => signing_secret,
                                         'token_lifetime' => token_lifetime)
    end
    it { expect { client.delete_resource_server(resource_server['id']) }.to_not raise_error }
  end

  describe '.delete_resource_server' do
    it { expect { client.delete_resource_server(resource_server['id']) }.to_not raise_error }
  end
end
