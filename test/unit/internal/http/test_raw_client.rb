# frozen_string_literal: true

require "test_helper"

describe Auth0::Internal::Http::RawClient do
  module TestRawClient
    # Minimal stand-in for a Net::HTTPResponse.
    class FakeHttpResponse
      def initialize(code:, body:, headers:)
        @code = code
        @body = body
        @headers = headers
      end

      attr_reader :code, :body

      def [](name)
        @headers[name]
      end
    end

    # Minimal stand-in for the Net::HTTP connection.
    class FakeConnection
      def initialize(response)
        @response = response
      end

      def open_timeout=(_); end
      def read_timeout=(_); end
      def write_timeout=(_); end
      def continue_timeout=(_); end

      def request(_http_request)
        @response
      end
    end

    def self.build_request
      Auth0::Internal::JSON::Request.new(
        base_url: nil,
        method: "GET",
        path: "users",
        query: {},
        request_options: {}
      )
    end

    def self.build_response
      FakeHttpResponse.new(
        code: "200",
        body: "{}",
        headers: {
          "x-ratelimit-limit" => "100",
          "x-ratelimit-remaining" => "12",
          "x-ratelimit-reset" => "1724000000"
        }
      )
    end
  end

  def send_with(client, response)
    client.stub(:connect, TestRawClient::FakeConnection.new(response)) do
      client.send(TestRawClient.build_request)
    end
  end

  it "invokes the rate limit handler with the parsed rate limit and returns the response unchanged" do
    captured = nil
    client = Auth0::Internal::Http::RawClient.new(
      base_url: "https://tenant.auth0.com",
      max_retries: 0,
      rate_limit_handler: ->(rate_limit) { captured = rate_limit }
    )
    response = TestRawClient.build_response

    result = send_with(client, response)

    _(result).must_be_same_as response
    _(captured).must_be_instance_of Auth0::Internal::Http::RateLimit
    _(captured.limit).must_equal 100
    _(captured.remaining).must_equal 12
    _(captured.reset).must_equal Time.at(1_724_000_000).utc
  end

  it "returns the response unchanged when no handler is configured" do
    client = Auth0::Internal::Http::RawClient.new(base_url: "https://tenant.auth0.com", max_retries: 0)
    response = TestRawClient.build_response

    _(send_with(client, response)).must_be_same_as response
  end

  it "does not let a handler error break the request" do
    client = Auth0::Internal::Http::RawClient.new(
      base_url: "https://tenant.auth0.com",
      max_retries: 0,
      rate_limit_handler: ->(_rate_limit) { raise "boom" }
    )
    response = TestRawClient.build_response

    _(send_with(client, response)).must_be_same_as response
  end
end
