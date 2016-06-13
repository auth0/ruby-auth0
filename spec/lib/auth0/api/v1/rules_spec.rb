require 'spec_helper'
describe Auth0::Api::V1::Rules do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V1::Rules)
    dummy_instance.extend(Auth0::Mixins::Initializer)
    @instance = dummy_instance
  end

  context '.rules' do
    it { expect(@instance).to respond_to(:rules) }
    it 'is expected to call get /api/rules' do
      expect(@instance).to receive(:get).with('/api/rules')
      expect { @instance.rules }.not_to raise_error
    end
  end

  context '.create_rule' do
    it { expect(@instance).to respond_to(:create_rule) }
    it 'is expected to call post /api/rules' do
      expect(@instance).to receive(:post).with(
        '/api/rules',
        name: 'test', script: 'script', order: 'order', status: 'status'
      )
      expect { @instance.create_rule('test', 'script', 'order', 'status') }.not_to raise_error
    end
  end
  context '.update_rule' do
    it { expect(@instance).to respond_to(:update_rule) }
    it 'is expected to call put /api/rules/test' do
      expect(@instance).to receive(:put).with('/api/rules/test', script: 'script', order: 'order', status: 'status')
      expect { @instance.update_rule('test', 'script', 'order', 'status') }.not_to raise_error
    end
  end
  context '.delete_rule' do
    it { expect(@instance).to respond_to(:delete_rule) }
    it 'is expected to call delete /api/rules/test' do
      expect(@instance).to receive(:delete).with('/api/rules/test')
      expect { @instance.delete_rule('test') }.not_to raise_error
    end
  end
end
