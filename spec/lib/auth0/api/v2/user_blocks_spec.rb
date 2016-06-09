require 'spec_helper'
describe Auth0::Api::V2::UserBlocks do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::UserBlocks)
    @instance = dummy_instance
  end

  context '.user_blocks' do
    it { expect(@instance).to respond_to(:user_blocks) }
    it 'is expected to call /api/v2/user-blocks?identifier=Test' do
      expect(@instance).to receive(:get).with('/api/v2/user-blocks?identifier=Test')
      expect { @instance.user_blocks('Test') }.not_to raise_error
    end
    it 'expect client to raise an error when calling with empty identifier' do
      expect { @instance.user_blocks(nil) }.to raise_error('Must specify a valid identifier')
    end
  end

  context '.delete_user_blocks' do
    it { expect(@instance).to respond_to(:delete_user_blocks) }
    it 'is expected to call /api/v2/user-blocks?identifier=Test' do
      expect(@instance).to receive(:delete).with('/api/v2/user-blocks?identifier=Test')
      expect { @instance.delete_user_blocks('Test') }.not_to raise_error
    end
    it 'expect client to raise an error when calling with empty identifier' do
      expect { @instance.delete_user_blocks(nil) }.to raise_error('Must specify a valid identifier')
    end
  end

  context '.user_blocks_by_id' do
    it { expect(@instance).to respond_to(:user_blocks_by_id) }
    it 'is expected to call /api/v2/user-blocks/Test' do
      expect(@instance).to receive(:get).with('/api/v2/user-blocks/Test')
      expect { @instance.user_blocks_by_id('Test') }.not_to raise_error
    end
    it 'expect client to raise an error when calling with empty identifier' do
      expect { @instance.user_blocks_by_id(nil) }.to raise_error('Must specify a valid identifier')
    end
  end

  context '.delete_user_blocks_by_id' do
    it { expect(@instance).to respond_to(:delete_user_blocks_by_id) }
    it 'is expected to call /api/v2/user-blocks/Test' do
      expect(@instance).to receive(:delete).with('/api/v2/user-blocks/Test')
      expect { @instance.delete_user_blocks_by_id('Test') }.not_to raise_error
    end
    it 'expect client to raise an error when calling with empty identifier' do
      expect { @instance.delete_user_blocks_by_id(nil) }.to raise_error('Must specify a valid identifier')
    end
  end
end
