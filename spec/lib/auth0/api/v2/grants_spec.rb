require 'spec_helper'
describe Auth0::Api::V2::Grants do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Grants)
    @instance = dummy_instance
  end

  context '.grants' do
    it { expect(@instance).to respond_to(:grants) }
    it { expect(@instance).to respond_to(:get_all_grants) }

    it 'is expected to get /api/v2/grants/' do
      expect(@instance).to receive(:get).with(
        '/api/v2/grants',
        client_id: nil,
        user_id: nil,
        audience: nil,
        page: nil,
        per_page: nil,
        include_totals: false
      )
      expect { @instance.grants }.not_to raise_error
    end

    it 'is expected to send get /api/v2/grants/ with client_id and audience' do
      audience = "https://samples.auth0.com/api/v2/"

      expect(@instance).to receive(:get).with(
        '/api/v2/grants',
        client_id: '1',
        user_id: nil,
        audience: audience,
        page: nil,
        per_page: nil,
        include_totals: false
      )
      expect { @instance.grants(client_id: '1', audience: audience) }.not_to raise_error
    end

    it 'is expected to send get /api/v2/grants/ with client_id and user_id' do
      expect(@instance).to receive(:get).with(
        '/api/v2/grants',
        client_id: '1',
        user_id: '1',
        audience: nil,
        page: nil,
        per_page: nil,
        include_totals: false
      )
      expect { @instance.grants(client_id: '1', user_id: '1') }.not_to raise_error
    end

    it 'is expected to send get /api/v2/grants/ with pagination' do
      expect(@instance).to receive(:get).with(
        '/api/v2/grants',
        client_id: nil,
        user_id: nil,
        audience: nil,
        page: 1,
        per_page: 2,
        include_totals: false
      )
      expect { @instance.grants(page: 1, per_page: 2) }.not_to raise_error
    end

    it 'is expected to send get /api/v2/grants/ with include_totals' do
      expect(@instance).to receive(:get).with(
        '/api/v2/grants',
        client_id: nil,
        user_id: nil,
        audience: nil,
        page: 1,
        per_page: 2,
        include_totals: true
      )
      expect { @instance.grants(page: 1, per_page: 2, include_totals: true) }.not_to raise_error
    end
  end

  context '.delete_grant' do
    it { expect(@instance).to respond_to(:delete_grant) }
    it 'is expected to send delete to /api/v2/grants/1?user_id=1' do
      expect(@instance).to receive(:delete).with('/api/v2/grants/1?user_id=1')
      expect { @instance.delete_grant('1', '1') }.not_to raise_error
    end
    it { expect { @instance.delete_grant('', '') }.to raise_error 'Must specify a grant id as id' }
    it { expect { @instance.delete_grant('', '1') }.to raise_error 'Must specify a grant id as id' }
    it { expect { @instance.delete_grant('1', '') }.to raise_error 'Must specify a user id' }
  end
end
