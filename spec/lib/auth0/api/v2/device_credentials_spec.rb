require 'spec_helper'
describe Auth0::Api::V2::DeviceCredentials do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::DeviceCredentials)
    @instance = dummy_instance
  end
  context '.device_credentials' do
    it { expect(@instance).to respond_to(:device_credentials) }
    it { expect(@instance).to respond_to(:list_device_credentials) }
    it 'is expected to send get request with no parameters to /api/v2/device-credentials' do
      expect(@instance).to receive(:get).with(
        '/api/v2/device-credentials', {
        fields: nil,
        include_fields: nil,
        user_id: nil,
        client_id: nil,
        type: nil,
        page: nil,
        per_page: nil,
        include_totals: nil
      })
      expect { @instance.device_credentials }.not_to raise_error
    end
    it 'is expected to send get request with client_id to /api/v2/device-credentials' do
      client_id = Faker::Lorem.word
      expect(@instance).to receive(:get).with(
        '/api/v2/device-credentials', {
        fields: nil,
        include_fields: nil,
        user_id: nil,
        client_id: client_id,
        type: nil,
        page: nil,
        per_page: nil,
        include_totals: nil
      })
      expect { @instance.device_credentials(client_id) }.not_to raise_error
    end
    it 'is expected to send get request with options to /api/v2/device-credentials' do
      expect(@instance).to receive(:get).with(
        '/api/v2/device-credentials', {
        fields: 'name',
        include_fields: true,
        user_id: '1',
        client_id: 'client_id',
        type: 'rotating_refresh_token',
        page: 1,
        per_page: 10,
        include_totals: true
      })
      expect { @instance.device_credentials('client_id', fields: 'name', include_fields: true, user_id: '1', type: 'rotating_refresh_token', page: 1, per_page: 10, include_totals: true) }.not_to raise_error
    end
    it 'is expect to raise an error when type is not one of \'public_key\', \'refresh_token\', \'rotating_refresh_token\'' do
      expect { @instance.device_credentials('client_id', type: 'invalid_type') }.to raise_error(
        'Type must be one of \'public_key\', \'refresh_token\', \'rotating_refresh_token\''
      )
    end
  end

  context '.create_device_credential' do
    it { expect(@instance).to respond_to(:create_device_credential) }
    it { expect(@instance).to respond_to(:create_device_public_key) }
    it 'is expected to send post to /api/v2/device-credentials' do
      expect(@instance).to receive(:post).with(
        '/api/v2/device-credentials', {
        device_name: 'device_name',
        value: 'value',
        device_id: 'device_id',
        client_id: 'client_id',
        type: 'public_key'
      })
      expect { @instance.create_device_credential('device_name', 'value', 'device_id', 'client_id') }
        .not_to raise_error
    end
    it do
      expect { @instance.create_device_credential(nil, 'value', 'device_id', 'client_id') }
        .to raise_error('Must supply a valid device_name')
    end
    it do
      expect { @instance.create_device_credential('device_name', nil, 'device_id', 'client_id') }
        .to raise_error('Must supply a valid value')
    end
    it do
      expect { @instance.create_device_credential('device_name', 'value', nil, 'client_id') }
        .to raise_error('Must supply a valid device_id')
    end
    it do
      expect { @instance.create_device_credential('device_name', 'value', 'device_id', nil) }
        .to raise_error('Must supply a valid client_id')
    end
  end

  context '.delete_device_credential' do
    it { expect(@instance).to respond_to(:delete_device_credential) }
    it 'is expected to send delete to /api/v2/device-credentials/1' do
      expect(@instance).to receive(:delete).with('/api/v2/device-credentials/1')
      expect { @instance.delete_device_credential('1') }.not_to raise_error
    end
    it { expect { @instance.delete_device_credential('') }.to raise_error 'Must supply a valid id' }
  end
end
