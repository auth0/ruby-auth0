require 'spec_helper'
describe Auth0::Api::V2::Rules do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Rules)
    dummy_instance.extend(Auth0::Mixins::Initializer)
    @instance = dummy_instance
  end

  context '.rules' do
    it { expect(@instance).to respond_to(:rules) }
    it 'is expected to call get /api/v2/rules' do
      expect(@instance).to receive(:get).with(
        '/api/v2/rules', enabled: nil, fields: nil, include_fields: nil, stage: nil
      )
      expect { @instance.rules }.not_to raise_error
    end
  end

  context '.rule' do
    it { expect(@instance).to respond_to(:rule) }
    it 'is expected to call get /api/v2/rules/test' do
      expect(@instance).to receive(:get).with(
        '/api/v2/rules/test', fields: nil, include_fields: nil
      )
      expect { @instance.rule('test') }.not_to raise_error
    end
    it 'expect to raise an error when calling with empty rule id' do
      expect { @instance.rule(nil) }.to raise_error 'Must supply a valid rule id'
    end
  end

  context '.create_rule' do
    it { expect(@instance).to respond_to(:create_rule) }
    it 'is expected to call post /api/v2/rules' do
      expect(@instance).to receive(:post).with(
        '/api/v2/rules',
        name: 'test', script: 'script', order: 'order', enabled: false, stage: 'login_success'
      )
      expect { @instance.create_rule('test', 'script', 'order', false) }.not_to raise_error
    end
    it 'expect to raise an error when calling with empty name' do
      expect { @instance.create_rule(nil, 'script') }.to raise_error 'Must supply a valid name'
    end
    it 'expect to raise an error when calling with empty script' do
      expect { @instance.create_rule('test', nil) }.to raise_error 'Must supply a valid script'
    end
  end
  context '.update_rule' do
    it { expect(@instance).to respond_to(:update_rule) }
    it 'is expected to call put /api/v2/rules/test' do
      expect(@instance).to receive(:patch).with(
        '/api/v2/rules/test', script: 'script', order: 'order', enabled: true, stage: 'some_stage'
      )
      expect do
        @instance.update_rule('test', script: 'script', order: 'order', enabled: true, stage: 'some_stage')
      end.not_to raise_error
    end
    it 'expect to raise an error when calling with empty rule id' do
      expect { @instance.update_rule(nil, 'test') }.to raise_error 'Must supply a valid rule id'
    end
  end
  context '.delete_rule' do
    it { expect(@instance).to respond_to(:delete_rule) }
    it 'is expected to call delete /api/v2/rules/test' do
      expect(@instance).to receive(:delete).with('/api/v2/rules/test')
      expect { @instance.delete_rule('test') }.not_to raise_error
    end
    it 'expect to raise an error when calling with empty rule id' do
      expect { @instance.delete_rule(nil) }.to raise_error 'Must supply a valid rule id'
    end
  end
end
