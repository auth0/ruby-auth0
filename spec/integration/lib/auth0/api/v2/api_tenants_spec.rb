require 'spec_helper'
describe Auth0::Api::V2::Tenants do
  attr_reader :client, :body

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    @body = {
      'error_page' => {
        'html' => '',
        'show_log_link' => false,
        'url' => 'https://mycompany.org/error'
      },
      'friendly_name' => 'My Company',
      'picture_url' => 'https://mycompany.org/logo.png',
      'support_email' => 'support@mycompany.org',
      'support_url' => 'https://mycompany.org/support'
    }

    client.update_tenant_settings(body)
  end

  describe '.get_tenant_settings' do
    it { expect(client.get_tenant_settings).to include(body) }
    
    let(:tenant_setting_fields) {client.get_tenant_settings(fields: 'picture_url')}
    it { expect(tenant_setting_fields).to_not include({'friendly_name' => 'My Company'}) }
    it { expect(tenant_setting_fields).to include({'picture_url' => 'https://mycompany.org/logo.png'}) }
  end

  describe '.update_tenant_settings' do
    let(:tenant_name) { Faker::Company.name }
    let(:body_tenant) do
      { 'friendly_name' => tenant_name }
    end
    it { expect(client.update_tenant_settings(body_tenant)['friendly_name']).to include(tenant_name) }
  end
end
