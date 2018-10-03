require 'spec_helper'
describe Auth0::Api::V2::ClientGrants do
  attr_reader :client, :test_client_grant, :test_client

  before(:all) do
    @client = Auth0Client.new(v2_creds)

    VCR.use_cassette('Auth0_Api_V2_ClientGrants/create_test_client') do
      @test_client = client.create_client(
        "ClientGrantTestClient-#{entity_suffix}"
      )
    end

    VCR.use_cassette('Auth0_Api_V2_ClientGrants/create_test_client_grant') do
      @test_client_grant = client.create_client_grant(
        'client_id' => test_client['client_id'],
        'audience' => "https://#{test_client['tenant']}.auth0.com/api/v2/",
        'scope' => ['test:scope']
      )
    end

  end

  after(:all) do
    VCR.use_cassette('Auth0_Api_V2_ClientGrants/delete_test_client') do
      client.delete_client(test_client['client_id'])
    end

    VCR.use_cassette('Auth0_Api_V2_ClientGrants/delete_test_client_grant') do
      client.delete_client_grant(test_client_grant['id'])
    end
  end

  describe '.client_grants', vcr: true do
    let(:client_grants) do
      client.client_grants
    end

    it 'should return at least 1 result' do
      expect(client_grants.size).to be > 0
    end

    it 'should return the test client grant' do
      expect(client_grants).to include(test_client_grant)
    end

    it 'should return the first page of one result' do
      results = client.client_grants(
        page: 0,
        per_page: 1
      )
      expect(results.first).to equal(results.last)
      expect(results.first).to eq(test_client_grant)
    end
  end

  describe '.patch_client_grant', vcr: true do
    it 'should update the test client grant' do
      expect(
        client.patch_client_grant(
          test_client_grant['id'],
          'scope' => ['new:scope']
        )
      ).to(include('scope' => ['new:scope']))
    end
  end

  describe '.delete_client_grant', vcr: true do
    it 'should delete the test client grant' do
      expect do
        client.delete_client_grant(test_client_grant['id'])
      end.to_not raise_error
    end
  end
end
