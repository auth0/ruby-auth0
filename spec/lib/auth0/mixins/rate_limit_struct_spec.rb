# frozen_string_literal: true

require 'spec_helper'

describe Auth0::RateLimit do
  describe '.from_headers' do
    let(:reset_epoch) { 1_724_000_000 }

    it 'parses symbol header keys as RestClient returns them' do
      rate_limit = described_class.from_headers(
        x_ratelimit_limit: '100',
        x_ratelimit_remaining: '99',
        x_ratelimit_reset: reset_epoch.to_s
      )

      expect(rate_limit.limit).to eq(100)
      expect(rate_limit.remaining).to eq(99)
      expect(rate_limit.reset).to eq(Time.at(reset_epoch).utc)
    end

    it 'parses dashed string header keys' do
      rate_limit = described_class.from_headers(
        'x-ratelimit-limit' => '10',
        'x-ratelimit-remaining' => '0',
        'x-ratelimit-reset' => reset_epoch.to_s
      )

      expect(rate_limit.limit).to eq(10)
      expect(rate_limit.remaining).to eq(0)
      expect(rate_limit.reset).to eq(Time.at(reset_epoch).utc)
    end

    it 'returns nil fields when rate limit headers are absent' do
      rate_limit = described_class.from_headers({})

      expect(rate_limit.limit).to be_nil
      expect(rate_limit.remaining).to be_nil
      expect(rate_limit.reset).to be_nil
    end

    it 'handles nil headers' do
      rate_limit = described_class.from_headers(nil)

      expect(rate_limit.limit).to be_nil
      expect(rate_limit.remaining).to be_nil
      expect(rate_limit.reset).to be_nil
    end
  end
end
