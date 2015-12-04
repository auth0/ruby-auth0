require 'spec_helper'
describe Auth0::Api::V2::Emails do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Emails)
    @instance = dummy_instance
  end

  context '.get_email' do
    it { expect(@instance).to respond_to(:get_provider) }
    it 'expect client to send get to /api/v2/emails/provider with fields' do
      expect(@instance).to receive(:get).with('/api/v2/emails/provider', fields: 'some', include_fields: true)
      expect { @instance.get_provider(fields: 'some', include_fields: true) }.not_to raise_error
    end
    it 'expect client to send get to /api/v2/emails/provider with empty fields' do
      expect(@instance).to receive(:get).with('/api/v2/emails/provider', fields: nil, include_fields: nil)
      expect { @instance.get_provider }.not_to raise_error
    end
  end
  context '.configure_email' do
    it { expect(@instance).to respond_to(:configure_provider) }
    it 'expect client to send post to /api/v2/emails/provider' do
      expect(@instance).to receive(:post).with('/api/v2/emails/provider', 'test body')
      expect { @instance.configure_provider('test body') }.not_to raise_error
    end
  end
  context '.delete_email' do
    it { expect(@instance).to respond_to(:delete_provider) }
    it 'expect client to send delete to /api/v2/emails/provider' do
      expect(@instance).to receive(:delete).with('/api/v2/emails/provider')
      expect { @instance.delete_provider }.not_to raise_error
    end
  end
  context '.patch_email' do
    it { expect(@instance).to respond_to(:update_provider) }
    it 'expect client to send patch to /api/v2/emails/provider' do
      expect(@instance).to receive(:patch).with('/api/v2/emails/provider', 'test body')
      expect { @instance.update_provider('test body') }.not_to raise_error
    end
  end
end
