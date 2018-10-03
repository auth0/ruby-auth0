require 'spec_helper'
require 'base64'
describe Auth0::Api::V2::DeviceCredentials do
  attr_reader :test_user, :client, :basic_client, :test_credential

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    test_user_name = "#{entity_suffix}-username"
    email = "#{entity_suffix}-#{test_user_name}@auth0.com"
    password = Faker::Internet.password

    VCR.use_cassette('Auth0_Api_V2_DeviceCredentials/create_test_user') do
      @test_user = client.create_user(
        test_user_name,
        'email' => email,
        'password' => password,
        'email_verified' => true,
        'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH
      )
    end


    basic_creds = {
      connection_id: Auth0::Api::AuthenticationEndpoints::UP_AUTH,
      user: email,
      password: password,
      authorization: 'Basic'
    }

    @basic_client = Auth0Client.new(v2_creds.merge(basic_creds))

    VCR.use_cassette('Auth0_Api_V2_DeviceCredentials/create_test_credential') do
      @test_credential = basic_client.create_device_credential(
        "#{test_user['name']}_phone_1",
        'dmFsdWU=',
        '68753A44-4D6F-1226-9C60-0050E4C00067',
        v2_creds[:client_id]
      )
    end

  end

  after(:all) do
    VCR.use_cassette('Auth0_Api_V2_DeviceCredentials/delete_test_user') do
      client.delete_user(test_user['user_id'])
    end

    VCR.use_cassette('Auth0_Api_V2_DeviceCredentials/delete_test_credential') do
      client.delete_device_credential(test_credential['id'])
    end
  end

  describe '.create_device_credential', vcr: true do
    it 'should create the test credentials' do
      expect(test_credential).to(
        include('id' => test_credential['id'])
      )
    end

    it 'should raise an error if the device_name is empty' do
      expect do
        basic_client.create_device_credential(
          '', 'value', 'device_id', 'client_id'
        )
      end.to raise_error Auth0::InvalidParameter
    end

    it 'should raise an error if the value is empty' do
      expect do
        basic_client.create_device_credential(
          'device_name', '', 'device_id', 'client_id'
        )
      end.to raise_error Auth0::InvalidParameter
    end

    it 'should raise an error if the device_id is empty' do
      expect do
        basic_client.create_device_credential(
          'device_name', 'value', '', 'client_id'
        )
      end.to raise_error Auth0::InvalidParameter
    end

    it 'should raise an error if the client_id is empty' do
      expect do
        basic_client.create_device_credential(
          'device_name', 'value', 'device_id', ''
        )
      end.to raise_error Auth0::InvalidParameter
    end
  end

  describe '.device_credentials', vcr: true do
    let(:device_credentials) do
      basic_client.device_credentials(v2_creds[:client_id])
    end

    it 'should have at least 1 entry' do
      expect(device_credentials.size).to be > 0
    end

    it 'should include the test credential' do
      expect(
        device_credentials.find do |cred|
          cred['id'] == test_credential['id']
        end).to_not be_empty
    end

    context '#filter_by_type' do
      it 'should exclude the test credential' do
        expect(
          basic_client.device_credentials(
            v2_creds[:client_id],
            type: 'refresh_token'
          )
        ).to be_empty
      end
    end
  end

  describe '.delete_device_credential', vcr: true do
    it 'should delete the test credential without an error' do
      expect do
        basic_client.delete_device_credential(test_credential['id'])
      end.to_not raise_error
    end
  end
end
