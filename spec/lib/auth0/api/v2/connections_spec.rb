require 'spec_helper'
describe Auth0::Api::V2::Connections do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Connections)
    @instance = dummy_instance
  end

  context '.connections' do
    it { expect(@instance).to respond_to(:connections) }
    it { expect(@instance).to respond_to(:get_connections) }

    it 'is expected to call /api/v2/connections' do
      expect(@instance).to receive(:get).with(
        '/api/v2/connections',
        strategy: nil,
        fields: nil,
        include_fields: true
      )
      expect { @instance.connections }.not_to raise_error
    end
  end

  context '.create_connection' do
    it { expect(@instance).to respond_to(:connection) }
    it { expect(@instance).to respond_to(:create_connection) }

    it 'is expected to call /api/v2/connections' do
      body = double
      expect(@instance).to receive(:post).with('/api/v2/connections', body)
      expect { @instance.create_connection(body) }.not_to raise_error
    end

    it 'is expected to raise an error when calling with empty body' do
      expect(@instance).not_to receive(:post)
      expect { @instance.create_connection(nil) }.to raise_error 'Must specify a body to create a connection'
    end
  end

  context '.connection' do
    it { expect(@instance).to respond_to(:connection) }
    it 'is expected to call get request to /api/v2/connection/connectionId' do
      expect(@instance).to receive(:get).with('/api/v2/connections/connectionId', fields: nil, include_fields: true)
      expect { @instance.connection('connectionId') }.not_to raise_error
    end
    it 'is expected raise an error when calling with empty id' do
      expect(@instance).not_to receive(:get)
      expect { @instance.connection(nil) }.to raise_error 'Must supply a valid connection id'
    end
  end

  context '.delete_connection' do
    it { expect(@instance).to respond_to(:delete_connection) }
    it 'is expected to call delete to /api/v2/connections/connectionId' do
      expect(@instance).to receive(:delete).with('/api/v2/connections/connectionId')
      @instance.delete_connection('connectionId')
    end

    it 'is expected raise an error when calling with empty id' do
      expect(@instance).not_to receive(:delete)
      expect { @instance.delete_connection(nil) }.to raise_error 'Must supply a valid connection id'
    end
  end

  context '.delete_connection_user' do
    it { expect(@instance).to respond_to(:delete_connection_user) }
    it 'is expected to call delete to /api/v2/connections/connectionId/users' do
      expect(@instance).to receive(:delete).with('/api/v2/connections/connectionId/users?email=email@test.com')
      @instance.delete_connection_user('connectionId', 'email@test.com')
    end

    it 'is expected raise an error when calling with empty id' do
      expect(@instance).not_to receive(:delete)
      expect { @instance.delete_connection_user(nil, nil) }.to raise_error 'Must supply a valid connection id'
    end

    it 'is expected raise an error when calling with empty email' do
      expect(@instance).not_to receive(:delete)
      expect { @instance.delete_connection_user('Connection ID', nil) }.to raise_error 'Must supply a valid user email'
    end
  end

  context '.update_connection' do
    it { expect(@instance).to respond_to(:update_connection) }
    it 'is expected to call patch to /api/v2/connections/connectionId' do
      body = double
      expect(@instance).to receive(:patch).with('/api/v2/connections/connectionId', body)
      @instance.update_connection('connectionId', body)
    end

    it 'is expected raise an error when calling with empty id' do
      expect(@instance).not_to receive(:patch)
      expect { @instance.delete_connection(nil) }.to raise_error 'Must supply a valid connection id'
    end
  end
end
