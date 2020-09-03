require 'spec_helper'
describe Auth0::Api::V2::LogStreams do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::LogStreams)
    dummy_instance.extend(Auth0::Mixins::Initializer)
    @instance = dummy_instance
  end

  context '.log_streams' do
    it { expect(@instance).to respond_to(:log_streams) }
    it { expect(@instance).to respond_to(:get_log_streams) }
    it 'is expected to call get /api/v2/log-streams' do
      expect(@instance).to receive(:get).with(
        '/api/v2/log-streams'
      )
      expect { @instance.log_streams }.not_to raise_error
    end
  end

  context '.log_stream' do
    it { expect(@instance).to respond_to(:log_stream) }
    it 'is expected to call get /api/v2/log-streams/test' do
      expect(@instance).to receive(:get).with('/api/v2/log-streams/test')
      expect { @instance.log_stream('test') }.not_to raise_error
    end
    it 'expect to raise an error when calling with empty log stream id' do
      expect { @instance.log_stream(nil) }.to raise_error 'Must supply a valid log stream id'
    end
  end

  context '.create_log_stream' do
    it { expect(@instance).to respond_to(:create_log_stream) }
    it 'is expected to call post /api/v2/log-streams' do
      expect(@instance).to receive(:post).with(
        '/api/v2/log-streams',
        name: 'test',
        type: 'https',
        sink: {
          httpEndpoint: "https://mycompany.com",
          httpContentType: "string",
          httpContentFormat: "JSONLINES",
          httpAuthorization: "string"
        }
      )

      @instance.create_log_stream('test', 'https',
        httpEndpoint: "https://mycompany.com",
        httpContentType: "string",
        httpContentFormat: "JSONLINES",
        httpAuthorization: "string")
    end
    it 'expect to raise an error when calling with empty name' do
      expect { @instance.create_log_stream('', '', '') }.to raise_error 'Name must contain at least one character'
    end
    it 'expect to raise an error when calling with empty type' do
      expect { @instance.create_log_stream('name', '', '') }.to raise_error 'Must specify a valid type'
    end
    it 'expect to raise an error when calling without options' do
      expect { @instance.create_log_stream('name', 'https', nil) }.to raise_error 'Must supply a valid hash for options'
    end
  end

  context '.delete_log_stream' do
    it { expect(@instance).to respond_to(:delete_log_stream) }
    it 'is expected to call delete /api/v2/log-streams/test' do
      expect(@instance).to receive(:delete).with('/api/v2/log-streams/test')
      expect { @instance.delete_log_stream('test') }.not_to raise_error
    end
    it 'expect to raise an error when calling with empty log stream id' do
      expect { @instance.delete_log_stream(nil) }.to raise_error 'Must supply a valid log stream id'
    end
  end

  context '.patch_log_stream' do
    it { expect(@instance).to respond_to(:patch_log_stream) }
    it 'is expected to send patch to /api/v2/log_streams/test' do
      expect(@instance).to receive(:patch).with('/api/v2/log-streams/test', status: 'paused')
      expect { @instance.patch_log_stream('test', 'paused') }.not_to raise_error
    end
    it { expect { @instance.patch_log_stream('', nil) }.to raise_error 'Must specify a log stream id' }
    it { expect { @instance.patch_log_stream('test', nil) }.to raise_error 'Must specify a valid status' }
  end
end
