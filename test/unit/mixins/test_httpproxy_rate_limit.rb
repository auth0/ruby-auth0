# frozen_string_literal: true

require "test_helper"

describe Auth0::Mixins::HTTPProxy do
  module TestHttpProxyRateLimit
    # Minimal host that mixes in the Authentication API HTTP path.
    class DummyProxy
      include Auth0::Mixins::HTTPProxy
    end

    # Mimics a RestClient::Response (symbol header keys, #code / #body).
    FakeResponse = Struct.new(:code, :body, :headers)
  end

  def build_proxy(handler)
    proxy = TestHttpProxyRateLimit::DummyProxy.new
    proxy.base_uri = "https://tenant.auth0.com"
    proxy.rate_limit_handler = handler
    proxy
  end

  it "invokes the handler with the rate limit parsed from an authentication response" do
    captured = nil
    proxy = build_proxy(->(rate_limit) { captured = rate_limit })
    response = TestHttpProxyRateLimit::FakeResponse.new(
      200,
      "{}",
      {
        x_ratelimit_limit: "100",
        x_ratelimit_remaining: "7",
        x_ratelimit_reset: "1724000000"
      }
    )

    proxy.stub(:call, response) do
      proxy.request(:get, "/userinfo")
    end

    _(captured).must_be_instance_of Auth0::Internal::Http::RateLimit
    _(captured.limit).must_equal 100
    _(captured.remaining).must_equal 7
    _(captured.reset).must_equal Time.at(1_724_000_000).utc
  end

  it "does nothing when no handler is configured" do
    proxy = build_proxy(nil)
    response = TestHttpProxyRateLimit::FakeResponse.new(200, "{}", {})

    result = proxy.stub(:call, response) do
      proxy.request(:get, "/userinfo")
    end

    _(result).must_equal({})
  end
end
