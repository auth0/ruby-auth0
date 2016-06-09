require 'spec_helper'
describe Auth0::Api::V2::Logs do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Logs)
    @instance = dummy_instance
  end

  context '.logs' do
    it { expect(@instance).to respond_to(:logs) }
    it { expect(@instance).to respond_to(:get_logs) }
    it 'is expected to call /api/v2/logs' do
      expect(@instance).to receive(:get).with(
        '/api/v2/logs',
        q: nil,
        page: nil,
        per_page: nil,
        sort: nil,
        fields: nil,
        include_fields: nil,
        include_totals: nil,
        from: nil,
        take: nil)
      expect { @instance.logs }.not_to raise_error
    end
  end

  context '.log' do
    it { expect(@instance).to respond_to(:log) }
    it { expect(@instance).to respond_to(:get_logs_by_id) }
    it 'is expected to call get request to /api/v2/logs/LOG_ID' do
      expect(@instance).to receive(:get).with('/api/v2/logs/LOG_ID')
      expect { @instance.log('LOG_ID') }.not_to raise_error
    end
  end
end
