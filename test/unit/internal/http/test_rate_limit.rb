# frozen_string_literal: true

require "test_helper"

describe Auth0::Internal::Http::RateLimit do
  module TestRateLimit
    RateLimit = Auth0::Internal::Http::RateLimit

    # Mimics Net::HTTPResponse#[], which is case-insensitive.
    class CaseInsensitiveResponse
      def initialize(headers)
        @headers = headers.transform_keys { |k| k.to_s.downcase }
      end

      def [](name)
        @headers[name.to_s.downcase]
      end
    end
  end

  describe ".from_headers" do
    it "parses symbol keys as RestClient returns them" do
      rate_limit = TestRateLimit::RateLimit.from_headers(
        x_ratelimit_limit: "100",
        x_ratelimit_remaining: "42",
        x_ratelimit_reset: "1724000000"
      )

      _(rate_limit.limit).must_equal 100
      _(rate_limit.remaining).must_equal 42
      _(rate_limit.reset).must_equal Time.at(1_724_000_000).utc
    end

    it "parses dashed and mixed-case string keys" do
      rate_limit = TestRateLimit::RateLimit.from_headers("X-RateLimit-Remaining" => "7")

      _(rate_limit.remaining).must_equal 7
    end

    it "reports a remaining of 0 as an integer, not nil" do
      _(TestRateLimit::RateLimit.from_headers(x_ratelimit_remaining: "0").remaining).must_equal 0
    end

    it "trims surrounding whitespace" do
      _(TestRateLimit::RateLimit.from_headers(x_ratelimit_limit: "  100  ").limit).must_equal 100
    end

    it "treats blank or non-numeric values (including reset) as nil instead of a misleading 0" do
      rate_limit = TestRateLimit::RateLimit.from_headers(
        x_ratelimit_limit: "",
        x_ratelimit_remaining: "not-a-number",
        x_ratelimit_reset: "garbage"
      )

      _(rate_limit.limit).must_be_nil
      _(rate_limit.remaining).must_be_nil
      _(rate_limit.reset).must_be_nil
    end
  end

  describe ".from_http_response" do
    it "reads headers case-insensitively via the response's #[]" do
      response = TestRateLimit::CaseInsensitiveResponse.new(
        "X-RateLimit-Limit" => "100",
        "X-RateLimit-Remaining" => "9",
        "X-RateLimit-Reset" => "1724000000"
      )

      rate_limit = TestRateLimit::RateLimit.from_http_response(response)

      _(rate_limit.limit).must_equal 100
      _(rate_limit.remaining).must_equal 9
      _(rate_limit.reset).must_equal Time.at(1_724_000_000).utc
    end
  end
end
