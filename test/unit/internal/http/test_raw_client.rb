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
  end

  it "returns a RawResponse that delegates code/body and exposes rate_limit" do
    client = Auth0::Internal::Http::RawClient.new(base_url: "https://tenant.auth0.com", max_retries: 0)
    http_response = TestRawClient::FakeHttpResponse.new(
      code: "200",
      body: "{}",
      headers: {
        "x-ratelimit-limit" => "100",
        "x-ratelimit-remaining" => "12",
        "x-ratelimit-reset" => "1724000000"
      }
    )
    request = Auth0::Internal::JSON::Request.new(
      base_url: nil,
      method: "GET",
      path: "users",
      query: {},
      request_options: {}
    )

    result = client.stub(:connect, TestRawClient::FakeConnection.new(http_response)) do
      client.send(request)
    end

    _(result).must_be_instance_of Auth0::Internal::Http::RawResponse
    _(result.code).must_equal "200"
    _(result.body).must_equal "{}"
    _(result.rate_limit.limit).must_equal 100
    _(result.rate_limit.remaining).must_equal 12
    _(result.rate_limit.reset).must_equal Time.at(1_724_000_000).utc
  end
end
