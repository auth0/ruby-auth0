require 'spec_helper'
describe Auth0::Api::V2::ClientGrants do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::ClientGrants)
    @instance = dummy_instance
  end
  context '.client_grants' do
    it { expect(@instance).to respond_to(:client_grants) }
    it { expect(@instance).to respond_to(:get_all_client_grants) }
    it 'is expected to send get request to /api/v2/client_grants/' do
      expect(@instance).to receive(:get).with('/api/v2/client-grants')
      expect { @instance.client_grants }.not_to raise_error
    end
  end

  context '.create_client_grant' do
    it { expect(@instance).to respond_to(:create_client_grant) }
    it 'is expected to send post to /api/v2/client-grants' do
      expect(@instance).to receive(:post).with('/api/v2/client-grants', opt: 'test body')
      expect { @instance.create_client_grant(opt: 'test body') }.not_to raise_error
    end
  end

  context '.delete_client_grant' do
    it { expect(@instance).to respond_to(:delete_client_grant) }
    it 'is expected to send delete to /api/v2/client-grants/1' do
      expect(@instance).to receive(:delete).with('/api/v2/client-grants/1')
      expect { @instance.delete_client_grant('1') }.not_to raise_error
    end
    it { expect { @instance.delete_client_grant('') }.to raise_error 'Must specify a client grant id' }
  end

  context '.patch_client_grant' do
    it { expect(@instance).to respond_to(:patch_client_grant) }
    it { expect(@instance).to respond_to(:update_client_grant) }
    it 'is expected to send patch to /api/v2/client-grants/1' do
      expect(@instance).to receive(:patch).with('/api/v2/client-grants/1', 'test body')
      expect { @instance.patch_client_grant('1', 'test body') }.not_to raise_error
    end
    it { expect { @instance.patch_client_grant('', nil) }.to raise_error 'Must specify a client grant id' }
    it { expect { @instance.patch_client_grant('some', nil) }.to raise_error 'Must specify a valid body' }
  end
end
