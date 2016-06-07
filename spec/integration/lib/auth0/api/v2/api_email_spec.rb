require 'spec_helper'
describe Auth0::Api::V2::Emails do
  before(:all) do
    client = Auth0Client.new(v2_creds)
    begin
      client.delete_provider
    rescue
      puts 'no email provider to delete'
    end
  end

  let(:client) { Auth0Client.new(v2_creds) }
  let(:name) { 'mandrill' }
  let(:enabled) { true }
  let(:credentials) { { 'api_key' => 'api_key' } }
  let(:settings) { { 'first_setting' => 'first_setting_set', 'second_setting' => 'second_setting_set' } }
  let(:body) do
    { 'name' => name,
      'enabled' => enabled,
      'credentials' => credentials,
      'settings' => settings }
  end

  describe '.configure_provider' do
    let!(:email_provider) { client.configure_provider(body) }
    it do
      expect(email_provider).to include(
        'name' => name, 'enabled' => enabled, 'credentials' => credentials, 'settings' => settings)
    end
  end

  describe '.get_provider' do
    let(:provider) { client.get_provider }

    it { expect(provider.size).to be > 0 }

    context '#filters' do
      it do
        expect(
          client.get_provider(fields: [:name, :enabled, :credentials].join(','), include_fields: true)).to(
            include('name', 'enabled', 'credentials'))
      end
      it do
        expect(
          client.get_provider(fields: [:enabled].join(','), include_fields: false).first).to_not(include('enabled'))
      end
    end
  end

  describe '.update_provider' do
    let(:update_name) { 'sendgrid' }
    let(:update_settings) do
      { 'first_up_setting' => 'first_up_setting_set', 'second_up_setting' => 'second_up_setting_set' }
    end
    let(:update_body) do
      { 'name' => update_name,
        'settings' => update_settings }
    end
    it do
      expect(
        client.update_provider(update_body)).to(
          include(
            'name' => update_name, 'enabled' => enabled, 'credentials' => credentials, 'settings' => update_settings))
    end
  end

  describe '.delete_provider' do
    it { expect { client.delete_provider }.to_not raise_error }
    it { expect { client.get_provider }.to raise_error(Auth0::NotFound) }
  end
end
