require 'spec_helper'
describe Auth0::Api::V2::Clients do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Clients)
    @instance = dummy_instance
  end
  context '.clients' do
    it { expect(@instance).to respond_to(:clients) }
    it { expect(@instance).to respond_to(:get_clients) }
    it 'is expected to send get request to /api/v2/clients/' do
      expect(@instance).to receive(:get).with('/api/v2/clients', {})
      expect { @instance.clients }.not_to raise_error
    end
    it 'is expected to send get request to /api/v2/clients?fields=name&exclude_fields=false' do
      expect(@instance).to receive(:get).with('/api/v2/clients', { exclude_fields: false, fields: [:name] })
      expect { @instance.clients(exclude_fields: false, fields: [:name]) }.not_to raise_error
    end
  end
  context '.client' do
    it { expect(@instance).to respond_to(:client) }
    it 'is expected to send get request to /api/v2/clients/1' do
      expect(@instance).to receive(:get).with('/api/v2/clients/1', {})
      expect { @instance.client(1) }.not_to raise_error
    end
    it 'is expected to send get request to /api/v2/clients?fields=name&exclude_fields=false' do
      expect(@instance).to receive(:get).with('/api/v2/clients/1', exclude_fields: false, fields: [:name])
      expect { @instance.client(1, exclude_fields: false, fields: [:name]) }.not_to raise_error
    end
  end

  context '.create_client' do
    it { expect(@instance).to respond_to(:create_client) }
    it 'is expected to send post to /api/v2/clients' do
      expect(@instance).to receive(:post).with('/api/v2/clients', name: 'name', opt: 'opt')
      expect { @instance.create_client('name', name: '/name1', opt: 'opt') }.not_to raise_error
    end
  end
  context '.delete_client' do
    it { expect(@instance).to respond_to(:delete_client) }
    it 'is expected to send delete to /api/v2/clients/1' do
      expect(@instance).to receive(:delete).with('/api/v2/clients/1')
      expect { @instance.delete_client('1') }.not_to raise_error
    end
  end

  context '.patch_client' do
    it { expect(@instance).to respond_to(:patch_client) }
    it 'is expected to send patch to /api/v2/clients/1' do
      expect(@instance).to receive(:patch).with('/api/v2/clients/1', fields: 'fields')
      expect { @instance.patch_client('1', fields: 'fields') }.not_to raise_error
    end
  end
end
