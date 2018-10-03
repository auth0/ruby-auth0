require 'spec_helper'
describe Auth0::Api::V2::Emails do
  attr_reader :client

  before(:all) do
    @client = Auth0Client.new(v2_creds)

    begin
      VCR.use_cassette(
        'Auth0_Api_V2_Emails/delete_existing_provider'
      ) do
        client.delete_provider
      end
    rescue Auth0::NotFound
      puts 'no email provider to delete'
    end
  end

  let(:name) { 'mandrill' }
  let(:enabled) { true }
  let(:credentials) { {api_key: 'api_key'} }

  let(:settings) do
    {
      first_setting: 'first_setting_set',
      second_setting: 'second_setting_set'
    }
  end

  let(:body) do
    {
      name: name,
      enabled: enabled,
      credentials: credentials,
      settings: settings
    }
  end

  describe '.configure_provider', vcr: true do
    it 'should configure a new email provider' do
      begin
        expect(
          client.configure_provider(body).deep_symbolize_keys
        ).to include(body)
      rescue Auth0::Unsupported
        puts 'Email provider is already configured'
      end
    end
  end

  describe '.get_provider', vcr: true do
    it 'should get the existing email provider' do
      begin
        expect(client.get_provider.size).to be > 0
      rescue Auth0::NotFound
        'No email provider configured'
      end
    end

    context '#filters' do
      it 'should get the existing email provider with specific fields' do
        begin
          expect(
              client.get_provider(
                fields: [:name, :enabled, :credentials].join(','),
                include_fields: true
              )
          ).to include('name', 'enabled', 'credentials')
        rescue Auth0::NotFound
          'No email provider configured'
        end
      end

      it 'should get the existing email provider without specific fields' do
        begin
          expect(
              client.get_provider(
                fields: [:enabled].join(','),
                include_fields: false
              ).first
          ).to_not include('enabled')
        rescue Auth0::NotFound
          'No email provider configured'
        end
      end
    end
  end

  describe '.update_provider', vcr: true do
    let(:update_body) do
      {
        name: 'sendgrid',
        settings: {
          first_up_setting: 'first_up_setting_set',
          second_up_setting: 'second_up_setting_set'
        }.merge(settings),
        credentials: credentials
      }
    end

    it 'should update the existing email provider' do
      expect(
        client.update_provider(update_body).deep_symbolize_keys
      ).to include(update_body)
    end
  end

  describe '.delete_provider', vcr: true do
    it 'should delete the existing email provider without an error' do
      expect { client.delete_provider }.to_not raise_error
    end

    it 'should throw an error trying to get the email provider' do
      expect { client.get_provider }.to raise_error(Auth0::NotFound)
    end
  end
end
