# frozen_string_literal: true

require "test_helper"

describe Auth0::Internal::Http::RawClient do
  module TestRawClient
    # Minimal stand-in for a Net::HTTPResponse.
    class FakeHttpResponse
      def initialize(code:, body: "{}", headers: {})
        @code = code
        @body = body
        @headers = headers
      end

      attr_reader :code, :body

      def [](name)
        @headers[name]
      end
    end

    # Returns a queued response per call, mimicking a retried request.
    class FakeConnection
      def initialize(responses)
        @responses = responses
      end

      def open_timeout=(_); end
      def read_timeout=(_); end
      def write_timeout=(_); end
      def continue_timeout=(_); end

      def request(_http_request)
        @responses.shift
      end
    end

    def self.ok(remaining:)
      FakeHttpResponse.new(code: "200", headers: rate_limit_headers(remaining))
    end

    def self.too_many(remaining:)
      FakeHttpResponse.new(code: "429", headers: rate_limit_headers(remaining))
    end

    def self.rate_limit_headers(remaining)
      {
        "x-ratelimit-limit" => "100",
        "x-ratelimit-remaining" => remaining.to_s,
        "x-ratelimit-reset" => "1724000000"
      }
    end

    def self.build_request
      Auth0::Internal::JSON::Request.new(
        base_url: nil, method: "GET", path: "users", query: {}, request_options: {}
      )
    end
  end

  def send_through(client, *responses)
    client.stub(:sleep, nil) do
      client.stub(:connect, TestRawClient::FakeConnection.new(responses)) do
        client.send(TestRawClient.build_request)
      end
    end
  end

  it "invokes the handler with the parsed rate limit and returns the response unchanged" do
    captured = []
    client = Auth0::Internal::Http::RawClient.new(
      base_url: "https://tenant.auth0.com",
      max_retries: 0,
      rate_limit_handler: ->(rate_limit) { captured << rate_limit }
    )
    response = TestRawClient.ok(remaining: 12)

    result = send_through(client, response)

    _(result).must_be_same_as response
    _(captured.length).must_equal 1
    _(captured.first.limit).must_equal 100
    _(captured.first.remaining).must_equal 12
    _(captured.first.reset).must_equal Time.at(1_724_000_000).utc
  end

  it "notifies on every response across a retried request, including the 429s" do
    seen = []
    client = Auth0::Internal::Http::RawClient.new(
      base_url: "https://tenant.auth0.com",
      max_retries: 2,
      rate_limit_handler: ->(rate_limit) { seen << rate_limit.remaining }
    )

    result = send_through(
      client,
      TestRawClient.too_many(remaining: 1),
      TestRawClient.too_many(remaining: 0),
      TestRawClient.ok(remaining: 99)
    )

    _(result.code).must_equal "200"
    _(seen).must_equal [1, 0, 99]
  end

  it "returns the response unchanged when no handler is configured" do
    client = Auth0::Internal::Http::RawClient.new(base_url: "https://tenant.auth0.com", max_retries: 0)
    response = TestRawClient.ok(remaining: 5)

    _(send_through(client, response)).must_be_same_as response
  end

  it "does not let a handler error break the request" do
    client = Auth0::Internal::Http::RawClient.new(
      base_url: "https://tenant.auth0.com",
      max_retries: 0,
      rate_limit_handler: ->(_rate_limit) { raise "boom" }
    )
    response = TestRawClient.ok(remaining: 5)

    _(send_through(client, response)).must_be_same_as response
  end
end
