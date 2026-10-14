# frozen_string_literal: true

require "test_helper"
require "webmock"

describe Auth0::Mixins::HTTPProxy do
  include WebMock::API

  # Minimal host that mixes in the Authentication API HTTP path.
  class DummyProxy
    include Auth0::Mixins::HTTPProxy

    def initialize(base_uri:, rate_limit_handler: nil, retry_count: nil)
      @base_uri = base_uri
      @headers = {}
      @rate_limit_handler = rate_limit_handler
      @retry_count = retry_count
    end
  end

  def rate_limit_headers(remaining)
    {
      "x-ratelimit-limit" => "100",
      "x-ratelimit-remaining" => remaining.to_s,
      "x-ratelimit-reset" => "1724000000",
      "Content-Type" => "application/json"
    }
  end

  before do
    WebMock.enable!
    WebMock.disable_net_connect!
  end

  after do
    WebMock.reset!
    WebMock.allow_net_connect!
    WebMock.disable!
  end

  it "invokes the handler with the rate limit parsed from a real response's headers" do
    captured = nil
    proxy = DummyProxy.new(base_uri: "https://tenant.auth0.com", rate_limit_handler: ->(rate_limit) { captured = rate_limit })

    stub_request(:get, "https://tenant.auth0.com/userinfo").to_return(
      status: 200,
      body: "{}",
      headers: {
        "x-ratelimit-limit" => "100",
        "x-ratelimit-remaining" => "7",
        "x-ratelimit-reset" => "1724000000",
        "Content-Type" => "application/json"
      }
    )

    proxy.request(:get, "/userinfo")

    _(captured).wont_be_nil
    _(captured.limit).must_equal 100
    _(captured.remaining).must_equal 7
    _(captured.reset).must_equal Time.at(1_724_000_000).utc
  end

  it "does nothing when no handler is configured" do
    proxy = DummyProxy.new(base_uri: "https://tenant.auth0.com")

    stub_request(:get, "https://tenant.auth0.com/userinfo").to_return(
      status: 200, body: "{}", headers: { "Content-Type" => "application/json" }
    )

    _(proxy.request(:get, "/userinfo")).must_equal({})
  end

  it "notifies on every response across a retried (429) request" do
    seen = []
    proxy = DummyProxy.new(
      base_uri: "https://tenant.auth0.com",
      rate_limit_handler: ->(rate_limit) { seen << rate_limit.remaining },
      retry_count: 2
    )

    stub_request(:get, "https://tenant.auth0.com/userinfo").to_return(
      { status: 429, body: "{}", headers: rate_limit_headers(1) },
      { status: 429, body: "{}", headers: rate_limit_headers(0) },
      { status: 200, body: "{}", headers: rate_limit_headers(99) }
    )

    proxy.request_with_retry(:get, "/userinfo")

    _(seen).must_equal [1, 0, 99]
  end

  it "swallows and warns when the handler raises, without breaking the request" do
    proxy = DummyProxy.new(
      base_uri: "https://tenant.auth0.com",
      rate_limit_handler: ->(_rate_limit) { raise "boom" }
    )
    stub_request(:get, "https://tenant.auth0.com/userinfo").to_return(
      status: 200, body: "{}", headers: rate_limit_headers(7)
    )

    assert_output(nil, /rate_limit_handler raised/) do
      _(proxy.request(:get, "/userinfo")).must_equal({})
    end
  end
end
