require 'spec_helper'
describe Auth0::Api::V1::Connections do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V1::Connections)
    dummy_instance.extend(Auth0::Mixins::Initializer)
    @instance = dummy_instance
  end

  context '.connections' do
    it { expect(@instance).to respond_to(:connections) }
    it { expect(@instance).to respond_to(:get_connections) }
    it 'is expected to send get request to /api/connections' do
      expect(@instance).to receive(:get).with('/api/connections')
      expect { @instance.connections }.not_to raise_error
    end
  end

  context '.connection' do
    it { expect(@instance).to respond_to(:connection) }
    it 'it is expected to send get request to /api/connections/RandomConnectionName' do
      expect(@instance).to receive(:get).with('/api/connections/RandomConnectionName')
      expect { @instance.connection('RandomConnectionName') }.not_to raise_error
    end
  end

  context '.delete_connection' do
    it { expect(@instance).to respond_to(:delete_connection) }
    it 'it is expected to send delete request to /api/connections/RandomConnectionName' do
      expect(@instance).to receive(:delete).with('/api/connections/RandomConnectionName')
      expect { @instance.delete_connection('RandomConnectionName') }.not_to raise_error
    end
  end

  context '.create_connection' do
    it { expect(@instance).to respond_to(:create_connection) }
    it 'is expected to send post to /api/connections' do
      params = { name:     'Some Test name',
                 strategy: 'Unpredictable',
                 options: {
                   tenant_domain: 'google.com',
                   domain_aliases: 'test.google.com,auth0.com'
                 } }
      expect(@instance).to receive(:post).with('/api/connections', params)
      expect do
        @instance.create_connection(
          'Some Test name',
          'Unpredictable',
          'google.com',
          'test.google.com,auth0.com'
        )
      end.not_to raise_error
    end
  end
  context '.update_connection' do
    it { expect(@instance).to respond_to(:update_connection) }
    it 'is expected to send put to /api/connections/TestName' do
      params = { status: false,
                 options: {
                   tenant_domain: 'google.com'
                 } }
      expect(@instance).to receive(:put).with('/api/connections/TestName', params)
      expect { @instance.update_connection('TestName', 'google.com', false) }.not_to raise_error
    end
  end
end
