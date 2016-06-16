require 'spec_helper'
require 'base64'
describe Auth0::Api::V2::DeviceCredentials do
  attr_reader :user, :user_client, :basic_client, :existing_device_credentials

  before(:all) do
    client = Auth0Client.new(v2_creds)
    username = Faker::Internet.user_name
    email = "#{entity_suffix}#{Faker::Internet.safe_email(username)}"
    password = Faker::Internet.password
    @user = client.create_user(username,  'email' => email,
                                          'password' => password,
                                          'email_verified' => true,
                                          'connection' => Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                                          'app_metadata' => {})

    basic_creds = { connection_id: Auth0::Api::AuthenticationEndpoints::UP_AUTH,
                    user: email,
                    password: password,
                    authorization: 'Basic' }

    @basic_client = Auth0Client.new(v2_creds.merge(basic_creds))
    @existing_device_credentials = basic_client.create_device_credential(
      "#{user['name']}_phone_1",
      'dmFsdWU=',
      '68753A44-4D6F-1226-9C60-0050E4C00067',
      ENV['CLIENT_ID']
    )
  end

  after(:all) do
    # Workaround to prevent instance constructor from overwritting class variable (header)
    # TODO: fix instance / class isssue from aut0 proxy and remove line below.
    client = Auth0Client.new(v2_creds)
    client.delete_user(user['user_id'])
  end

  describe '.device_credentials' do
    let(:device_credentials) { basic_client.device_credentials(ENV['CLIENT_ID']) }
    it { expect(device_credentials.size).to be > 0 }
    it { expect(device_credentials.find { |cred| cred['id'] == existing_device_credentials['id'] }).to_not be_empty }
    context '#filter_by_type' do
      let(:filtered_device_credentials) { basic_client.device_credentials(ENV['CLIENT_ID'], type: 'refresh_token') }
      it do
        expect(filtered_device_credentials.find do |cred|
                 cred['id'] == existing_device_credentials['id']
               end).to eq nil
      end
    end
  end

  describe '.create_device_credential' do
    let!(:new_credentials) do
      basic_client.create_device_credential(
        "#{user['name']}_phone_2",
        'dmFsdWU=',
        '68753A44-4D6F-1226-9C60-0050E4C00067',
        ENV['CLIENT_ID']
      )
    end
    it do
      expect(basic_client.device_credentials(ENV['CLIENT_ID'])
        .find { |cred| cred['id'] == new_credentials['id'] }).to_not be_empty
    end
  end

  describe '.delete_device_credential' do
    it { expect { basic_client.delete_device_credential(existing_device_credentials['id']) }.to_not raise_error }
  end
end
