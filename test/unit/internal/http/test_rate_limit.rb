# frozen_string_literal: true

require "test_helper"

describe Auth0::Internal::Http::RateLimit do
  RateLimit = Auth0::Internal::Http::RateLimit

  describe ".from_response" do
    it "parses the x-ratelimit-* headers" do
      response = {
        "x-ratelimit-limit" => "100",
        "x-ratelimit-remaining" => "42",
        "x-ratelimit-reset" => "1724000000"
      }

      rate_limit = RateLimit.from_response(response)

      _(rate_limit.limit).must_equal 100
      _(rate_limit.remaining).must_equal 42
      _(rate_limit.reset).must_equal Time.at(1_724_000_000).utc
    end

    it "reports a remaining of 0 as an integer, not nil" do
      _(RateLimit.from_response("x-ratelimit-remaining" => "0").remaining).must_equal 0
    end

    it "returns nil for missing or non-numeric values instead of a misleading 0" do
      rate_limit = RateLimit.from_response(
        "x-ratelimit-limit" => "",
        "x-ratelimit-remaining" => "not-a-number"
      )

      _(rate_limit.limit).must_be_nil
      _(rate_limit.remaining).must_be_nil
      _(rate_limit.reset).must_be_nil
    end
  end
end
