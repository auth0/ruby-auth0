require 'spec_helper'
describe Auth0::Api::V2::Tenants do
  attr_reader :client

  before(:all) do
    @client = Auth0Client.new(v2_creds)
  end

  let(:default_tenant_name) { 'Auth0' }

  describe '.get_tenant_settings', vcr: true do
    it 'should get the tenant settings' do
      expect(
        client.get_tenant_settings
      ).to include(
        'friendly_name' => default_tenant_name,
        'support_email' => 'support@auth0.org'
      )
    end
  end

  describe '.get_tenant_settings with specific fields', vcr: true do
    let(:tenant_setting_fields) do
      client.get_tenant_settings(fields: 'support_email')
    end

    it 'should include the field requested' do
      expect(
        tenant_setting_fields
      ).to include('support_email')
    end

    it 'should exclude a field not requested' do
      expect(
        tenant_setting_fields
      ).to_not include('friendly_name')
    end
  end

  describe '.update_tenant_settings', vcr: true do
    let(:changed_tenant_name) { "#{default_tenant_name}-CHANGED" }

    it 'should update the tenant settings with a new tenant name' do
      expect(
        client.update_tenant_settings(
          friendly_name: changed_tenant_name
        )['friendly_name']
      ).to include(changed_tenant_name)
    end

    it 'should revert the tenant name' do
      expect(
        client.update_tenant_settings(
          friendly_name: default_tenant_name
        )['friendly_name']
      ).to include(default_tenant_name)
    end
  end
end
