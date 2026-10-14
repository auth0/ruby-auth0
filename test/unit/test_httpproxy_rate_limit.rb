# frozen_string_literal: true

require "test_helper"
require "webmock"

describe Auth0::Mixins::HTTPProxy do
  include WebMock::API

  # Minimal host that mixes in the Authentication API HTTP path.
  class DummyProxy
    include Auth0::Mixins::HTTPProxy

    def initialize(base_uri:, rate_limit_handler: nil)
      @base_uri = base_uri
      @headers = {}
      @rate_limit_handler = rate_limit_handler
    end
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
end
