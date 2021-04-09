require 'spec_helper'
describe Auth0::Api::V2::Branding do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Branding)
    dummy_instance.extend(Auth0::Mixins::Initializer)
    @instance = dummy_instance
  end

  context '.branding' do
    it { expect(@instance).to respond_to(:branding) }

    it 'is expected to call get /api/v2/branding' do
      expect(@instance).to receive(:get).with('/api/v2/branding')
      expect { @instance.branding }.not_to raise_error
    end

    it 'is expected to respond to a get_branding method' do
      expect(@instance).to respond_to(:get_branding)
    end
  end

  context '.patch_branding' do
    it { expect(@instance).to respond_to(:patch_branding) }
    it 'is expected to call post /api/v2/branding' do
      expect(@instance).to receive(:patch).with(
        '/api/v2/branding',
        template: 'Test'
      )
      expect { @instance.patch_branding({ template: 'Test' }) }.not_to raise_error
    end

    it 'is expected to respond to a get_branding method' do
      expect(@instance).to respond_to(:update_branding)
    end
  end

  context '.branding_templates_for_universal_login' do
    it { expect(@instance).to respond_to(:branding) }

    it 'is expected to call get /api/v2/branding/templates/universal-login' do
      expect(@instance).to receive(:get).with('/api/v2/branding/templates/universal-login')
      expect { @instance.branding_templates_for_universal_login }.not_to raise_error
    end

    it 'is expected to respond to a get_branding_templates_for_universal_login method' do
      expect(@instance).to respond_to(:get_branding_templates_for_universal_login)
    end
  end

  context '.put_branding_templates_for_universal_login' do
    it { expect(@instance).to respond_to(:put_branding_templates_for_universal_login) }
    it 'is expected to call put /api/v2/branding/templates/universal-login' do
      expect(@instance).to receive(:put).with(
        '/api/v2/branding/templates/universal-login', template: 'Template'
      )
      expect do
        @instance.put_branding_templates_for_universal_login(template: 'Template')
      end.not_to raise_error
    end
  end

  context '.delete_branding_templates_for_universal_login' do
    it { expect(@instance).to respond_to(:delete_branding_templates_for_universal_login) }
    it 'is expected to call delete /api/v2/branding/templates/universal-login' do
      expect(@instance).to receive(:delete).with('/api/v2/branding/templates/universal-login')
      expect { @instance.delete_branding_templates_for_universal_login() }.not_to raise_error
    end
  end
end
