# frozen_string_literal: true

require "test_helper"

describe Auth0::Internal::Http::RawResponse do
  module TestRawResponse
    # Minimal stand-in for a Net::HTTPResponse.
    class FakeHttpResponse
      def initialize(code:, body:, headers: {})
        @code = code
        @body = body
        @headers = headers
      end

      attr_reader :code, :body

      def [](name)
        @headers[name]
      end

      def message
        "OK"
      end
    end

    def self.response(headers: {})
      FakeHttpResponse.new(
        code: "200",
        body: "{\"ok\":true}",
        headers: {
          "x-ratelimit-limit" => "100",
          "x-ratelimit-remaining" => "7",
          "x-ratelimit-reset" => "1724000000"
        }.merge(headers)
      )
    end
  end

  it "delegates #code and #body to the wrapped response" do
    wrapped = Auth0::Internal::Http::RawResponse.new(TestRawResponse.response)

    _(wrapped.code).must_equal "200"
    _(wrapped.body).must_equal "{\"ok\":true}"
  end

  it "delegates header access via #[]" do
    wrapped = Auth0::Internal::Http::RawResponse.new(TestRawResponse.response)

    _(wrapped["x-ratelimit-remaining"]).must_equal "7"
  end

  it "delegates unknown methods to the wrapped response" do
    wrapped = Auth0::Internal::Http::RawResponse.new(TestRawResponse.response)

    _(wrapped.message).must_equal "OK"
    _(wrapped.respond_to?(:message)).must_equal true
  end

  it "exposes rate limit information parsed from the response headers" do
    wrapped = Auth0::Internal::Http::RawResponse.new(TestRawResponse.response)

    _(wrapped.rate_limit).must_be_instance_of Auth0::Internal::Http::RateLimit
    _(wrapped.rate_limit.limit).must_equal 100
    _(wrapped.rate_limit.remaining).must_equal 7
    _(wrapped.rate_limit.reset).must_equal Time.at(1_724_000_000).utc
  end
end
