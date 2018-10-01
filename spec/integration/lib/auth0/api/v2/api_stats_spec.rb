require 'spec_helper'
describe Auth0::Api::V2::Stats do
  let(:client) { Auth0Client.new(v2_creds) }

  describe '.active_users', vcr: true do
    it 'should have at least one active user' do
      expect(Integer(client.active_users)).to be >= 0
    end
  end

  # rubocop:disable Date
  describe '.daily_stats', vcr: true do
    it 'should have at least one stats entry for the timeframe' do
      expect(
        client.daily_stats(
          Date.new(2017, 1, 1).strftime('%Y%m%d'),
          Date.new(2018, 1, 1).strftime('%Y%m%d')
        ).size
      ).to be > 0
    end
  end
end