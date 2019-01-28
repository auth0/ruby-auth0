require 'spec_helper'
describe Auth0::Api::V2::ResourceServers do
  attr_reader :client, :test_server

  before(:all) do
    @client = Auth0Client.new(v2_creds)

    VCR.use_cassette('Auth0_Api_V2_ResourceServers/create_test_server') do
      @test_server = client.create_resource_server(
        'https://localhost.test/api/v1/',
        'name' => "TestServer-#{entity_suffix}",
        'signing_alg' => 'RS256',
        'signing_secret' => 'jPd1d0TWbg7pN9iPcXdtYtEIIGAk5zhmCi',
        'token_lifetime' => 123456
      )
    end
  end

  after(:all) do
    VCR.use_cassette('Auth0_Api_V2_ResourceServers/delete_test_server') do
      client.delete_resource_server(test_server['id'])
    end
  end

  describe '.resource_servers', vcr: true do
    let(:resource_servers) do
      client.resource_servers
    end

    it 'should return at least 1 result' do
      expect(resource_servers.size).to be > 0
    end

    it 'should get the test server' do
      expect(resource_servers).to include(test_server)
    end

    it 'should return the first page of one result' do
      results = client.resource_servers(
        page: 0,
        per_page: 1
      )
      expect(results.first).to equal(results.last)
    end
  end

  describe '.create_resource_server', vcr: true do
    it 'should raise an error if the identifier is empty' do
      expect do
        client.create_resource_server('')
      end.to raise_error Auth0::InvalidParameter
    end

    it 'should raise an error if the name includes an invalid char' do
      expect do
        client.create_resource_server(
          'https://localhost.test/api/v2/',
          name: '<ServerName'
        )
      end.to raise_error Auth0::InvalidParameter
    end

    it 'should raise an error if the name includes an invalid char' do
      expect do
        client.create_resource_server(
          'https://localhost.test/api/v2/',
          name: 'ServerName>'
        )
      end.to raise_error Auth0::InvalidParameter
    end

    it 'should create the test server' do
      expect(test_server).to(
        include(
          'name' => test_server['name'],
          'identifier' => test_server['identifier'],
          'signing_alg' => test_server['signing_alg'],
          'signing_secret' => test_server['signing_secret'],
          'token_lifetime' => test_server['token_lifetime']
        )
      )
    end
  end

  describe '.resource_server', vcr: true do
    it 'should raise an error if the id is empty' do
      expect do
        client.resource_server('')
      end.to raise_error Auth0::InvalidParameter
    end

    it 'should get the test server' do
      expect(
        client.resource_server(test_server['id'])
      ).to(
        include('identifier' => test_server['identifier'])
      )
    end
  end

    describe '.patch_client', vcr: true do
    it 'should raise an error with a missing client_id' do
      expect do
        client.patch_resource_server('', token_lifetime: 654321)
      end.to raise_error Auth0::InvalidParameter
    end

    it 'should raise an error with an empty body' do
      expect do
        client.patch_resource_server('__test_resource_server_id__', {})
      end.to raise_error Auth0::InvalidParameter
    end

    it 'should update the resource server with the correct attributes' do
      expect(
        client.patch_client(
          test_server['id'],
          token_lifetime: 654321,
        )
      ).to(
        include(
          'token_lifetime' => 654321,
        )
      )
    end
  end

  describe '.delete_resource_server', vcr: true do
    it 'should raise an error if the id is empty' do
      expect do
        client.delete_resource_server('')
      end.to raise_error Auth0::InvalidParameter
    end

    it 'should delete the test server without an error' do
      expect do
        client.delete_resource_server(test_server['id'])
      end.to_not raise_error
    end
  end

  
end
