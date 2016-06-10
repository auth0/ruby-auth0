require 'spec_helper'
describe Auth0::Api::V2::ResourceServers do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::ResourceServers)
    dummy_instance.extend(Auth0::Mixins::Initializer)
    @instance = dummy_instance
  end

  context '.resource_server' do
    it { expect(@instance).to respond_to(:resource_server) }
    it 'is expected to call get /api/v2/resource-servers/test' do
      expect(@instance).to receive(:get).with('/api/v2/resource-servers/test')
      expect { @instance.resource_server('test') }.not_to raise_error
    end
    it 'expect to raise an error when calling with empty resource server id' do
      expect { @instance.resource_server(nil) }.to raise_error 'Must supply a valid resource server id'
    end
  end

  context '.create_resource_server' do
    it { expect(@instance).to respond_to(:create_resource_server) }
    it 'is expected to call post /api/v2/resource-servers' do
      expect(@instance).to receive(:post).with(
        '/api/v2/resource-servers',
        identifier: 'test',
        name: 'name',
        signing_alg: 'signing_alg',
        signing_secret: 'signing_secret',
        token_lifetime: 'token_lifetime',
        scopes: 'scopes')

      @instance.create_resource_server('test', name: 'name',
                                               signing_alg: 'signing_alg',
                                               signing_secret: 'signing_secret',
                                               token_lifetime: 'token_lifetime',
                                               scopes: 'scopes')
    end
    it 'expect to raise an error when calling with empty identifier' do
      expect { @instance.create_resource_server(nil) }.to raise_error 'Must supply a valid resource server id'
    end
    it 'expect to raise an error when name contains < or > characters' do
      expect { @instance.create_resource_server('test', name: '<') }.to raise_error(
        'Name must contain at least one character. Does not allow "<" or ">"')
      expect { @instance.create_resource_server('test', name: '>') }.to raise_error(
        'Name must contain at least one character. Does not allow "<" or ">"')
    end
  end

  context '.delete_resource_server' do
    it { expect(@instance).to respond_to(:delete_resource_server) }
    it 'is expected to call delete /api/v2/resource-server/test' do
      expect(@instance).to receive(:delete).with('/api/v2/resource-servers/test')
      expect { @instance.delete_resource_server('test') }.not_to raise_error
    end
    it 'expect to raise an error when calling with empty resource server identifier' do
      expect { @instance.delete_resource_server(nil) }.to raise_error 'Must supply a valid resource server id'
    end
  end
end
