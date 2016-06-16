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
        take: nil
      )
      expect { @instance.logs }.not_to raise_error
    end
    it 'is expect to rise an error when take is higher than 100' do
      expect { @instance.logs(take: rand(101..2000)) }.to raise_error(
        'The total amount of entries to retrieve should be less than 100'
      )
    end
    it 'is expect to rise an error when per_page is higher than 100' do
      expect { @instance.logs(per_page: rand(101..2000)) }.to raise_error(
        'The total amount of entries per page should be less than 100'
      )
    end
  end

  context '.log' do
    it { expect(@instance).to respond_to(:log) }
    it { expect(@instance).to respond_to(:get_logs_by_id) }
    it 'is expected to call get request to /api/v2/logs/LOG_ID' do
      expect(@instance).to receive(:get).with('/api/v2/logs/LOG_ID')
      expect { @instance.log('LOG_ID') }.not_to raise_error
    end
    it { expect { @instance.log(nil) }.to raise_error('Must supply a valid log_id') }
  end
end
