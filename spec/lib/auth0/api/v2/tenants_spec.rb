require 'spec_helper'
describe Auth0::Api::V2::Tenants do
  before :all do
    @instance = DummyClass.new.extend(Auth0::Api::V2::Tenants)
  end

  context '.get_tenant_settings' do
    it { expect(@instance).to respond_to(:get_tenant_settings) }
    it 'expect client to send post to /api/v2/tenants/settings with fields' do
      expect(@instance).to receive(:get).with('/api/v2/tenants/settings', fields: 'field', include_fields: true)
      expect { @instance.get_tenant_settings(fields: 'field') }.not_to raise_error
    end
  end
  context '.update_tenant_settings' do
    it { expect(@instance).to respond_to(:update_tenant_settings) }
    it 'expect client to send post to /api/v2/tenants/settings with body' do
      expect(@instance).to receive(:patch).with('/api/v2/tenants/settings', 'test body')
      expect { @instance.update_tenant_settings('test body') }.not_to raise_error
    end
    it 'expect client to rasie error when calling with empty body' do
      expect { @instance.update_tenant_settings(nil) }.to raise_error(
        'Must supply a valid body to update tenant settings'
      )
    end
  end
end
