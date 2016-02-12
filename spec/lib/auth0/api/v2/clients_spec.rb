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
      expect(@instance).to receive(:get).with('/api/v2/clients', fields: nil, include_fields: nil)
      expect { @instance.clients }.not_to raise_error
    end
    it 'is expected to send get request to /api/v2/clients?fields=name' do
      expect(@instance).to receive(:get).with('/api/v2/clients', include_fields: true, fields: [:name])
      expect { @instance.clients(fields: [:name], include_fields: true) }.not_to raise_error
    end
  end
  context '.client' do
    it { expect(@instance).to respond_to(:client) }
    it 'is expected to send get request to /api/v2/clients/1' do
      expect(@instance).to receive(:get).with('/api/v2/clients/1', fields: nil, include_fields: nil)
      expect { @instance.client(1) }.not_to raise_error
    end
    it 'is expected to send get request to /api/v2/clients?fields=name&include_fields=true' do
      expect(@instance).to receive(:get).with('/api/v2/clients/1', include_fields: true, fields: [:name])
      expect { @instance.client(1, include_fields: true, fields: [:name]) }.not_to raise_error
    end
    it { expect { @instance.client('') }.to raise_error 'Must specify a client id' }
  end

  context '.create_client' do
    it { expect(@instance).to respond_to(:create_client) }
    it 'is expected to send post to /api/v2/clients' do
      expect(@instance).to receive(:post).with('/api/v2/clients', name: 'name', opt: 'opt')
      expect { @instance.create_client('name', name: '/name1', opt: 'opt') }.not_to raise_error
    end
    it { expect { @instance.create_client('') }.to raise_error 'Must specify a valid client name' }
  end
  context '.delete_client' do
    it { expect(@instance).to respond_to(:delete_client) }
    it 'is expected to send delete to /api/v2/clients/1' do
      expect(@instance).to receive(:delete).with('/api/v2/clients/1')
      expect { @instance.delete_client('1') }.not_to raise_error
    end
    it { expect { @instance.delete_client('') }.to raise_error 'Must specify a client id' }
  end

  context '.patch_client' do
    it { expect(@instance).to respond_to(:patch_client) }
    it 'is expected to send patch to /api/v2/clients/1' do
      expect(@instance).to receive(:patch).with('/api/v2/clients/1', fields: 'fields')
      expect { @instance.patch_client('1', fields: 'fields') }.not_to raise_error
    end
    it { expect { @instance.patch_client('', nil) }.to raise_error 'Must specify a client id' }
    it { expect { @instance.patch_client('some', nil) }.to raise_error 'Must specify a valid body' }
  end
end
