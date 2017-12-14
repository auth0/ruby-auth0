require 'spec_helper'
describe Auth0::Api::V2::Stats do
  let(:client) { Auth0Client.new(v2_creds) }

  describe '.active_users' do
    it do
      sleep 1
      expect(Integer(client.active_users)).to be >= 0
    end
  end

  # rubocop:disable Date
  describe '.daily_stats' do
    let(:from) { Date.today.prev_day.strftime('%Y%m%d') }
    let(:to) { Date.today.strftime('%Y%m%d') }
    let(:daily_stats) do
      sleep 1
      client.daily_stats(from, to)
    end
    it do
      sleep 1
      expect(daily_stats.size).to be > 0
    end
  end
end
