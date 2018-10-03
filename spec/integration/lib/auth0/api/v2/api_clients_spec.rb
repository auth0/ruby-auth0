require 'spec_helper'

describe Auth0::Api::V2::Clients do
  attr_reader :client, :test_client_name, :test_client

  before(:all) do
    @client ||= Auth0Client.new(v2_creds)
    @test_client_name = "TestClient-#{entity_suffix}"

    VCR.use_cassette('Auth0_Api_V2_Clients/create_test_client') do
      @test_client ||= client.create_client(
        test_client_name,
        custom_login_page_on: false,
        description: 'Client description'
      )
    end
  end

  describe '.create_client', vcr: true do
    it 'should raise an error with a missing client_id' do
      expect do
        client.create_client('', custom_login_page_on: false)
      end.to raise_error Auth0::MissingParameter
    end

    it 'should create a new client with the specified attributes' do
      expect(test_client).to(
        include(
          'name' => test_client_name,
          'custom_login_page_on' => false,
          'description' => 'Client description'
        )
      )
    end
  end
  
  describe '.clients', vcr: true do
    let(:clients) do
      client.clients
    end

    it 'should get at least one client' do
      expect(clients.size).to be > 0
    end

    context '#filters' do
      it 'should include the specified fields' do
        expect(client.clients(
          fields: [:name, :callbacks].join(',')
        ).first).to(include('name', 'callbacks'))
      end

      it 'should exclude fields not specified' do
        expect(client.clients(
          fields: [:callbacks].join(',')).first
        ).to_not(include('name'))
      end

      it 'should exclude the specified fields' do
        expect(client.clients(
          fields: [:callbacks].join(','),
          include_fields: false
        ).first).to_not(include('callbacks'))
      end

      it 'should paginate results' do
        results = client.clients(
          fields: :name,
          page: 0,
          per_page: 1
        )
        expect(results.first).to equal(results.last)
      end
    end
  end

  describe '.client', vcr: true do

    it 'should raise an error with a missing client_id' do
      expect do
        client.client('')
      end.to raise_error Auth0::MissingClientId
    end

    it 'should get the test client' do
      expect(
        client.client(test_client['client_id'])
      ).to include('client_id' => test_client['client_id'])
    end

    it 'should raise an error when passing an empty client_id' do
      expect { client.client '' }.to raise_error(Auth0::MissingClientId)
    end

    context '#filters' do
      let(:client_include) do
        client.client(
          test_client['client_id'],
          fields: [:name, :client_secret, :jwt_configuration].join(',')
        )
      end

      let(:client_not_include) do
        client.client(
          test_client['client_id'],
          fields: :jwt_configuration,
          include_fields: false
        )
      end

      it 'should include the specified fields' do
        expect(
          client_include
        ).to(include('name', 'client_secret', 'jwt_configuration'))
      end

      it 'should exclude and include fields properly' do
        expect(client_not_include).to(include('name', 'client_secret'))
        expect(client_not_include).to_not(include('jwt_configuration'))
      end
    end
  end

  describe '.patch_client', vcr: true do
    it 'should raise an error with a missing client_id' do
      expect do
        client.patch_client('', custom_login_page_on: false)
      end.to raise_error Auth0::MissingClientId
    end

    it 'should raise an error with a missing client_id' do
      expect do
        client.patch_client('__test_client_id__', '')
      end.to raise_error Auth0::MissingParameter
    end

    it 'should update the client with the correct attributes' do
      expect(
        client.patch_client(
          test_client['client_id'],
          custom_login_page_on: false,
          sso: true
        )
      ).to(
        include(
          'custom_login_page_on' => false,
          'sso' => true
        )
      )
    end
  end

  describe '.delete_client', vcr: true do
    it 'should raise an error with an empty client_id' do
      expect do
        client.delete_client ''
      end.to raise_error Auth0::MissingClientId
    end

    it 'should delete the test client without an error' do
      expect do
        client.delete_client(test_client['client_id'])
      end.to_not raise_error
    end
  end
end
