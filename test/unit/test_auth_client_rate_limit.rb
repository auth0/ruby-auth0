# frozen_string_literal: true

require "test_helper"

describe Auth0::Client do
  def build_client(**extra)
    Auth0::Client.new(domain: "tenant.auth0.com", token: "test-token", **extra)
  end

  it "attaches the configured management_rate_limit_handler to the management raw client" do
    handler = ->(_rate_limit) {}
    client = build_client(management_rate_limit_handler: handler)

    raw_client = client.management.instance_variable_get(:@raw_client)

    _(raw_client.rate_limit_handler).must_be_same_as handler
  end

  it "leaves the handler unset when none is configured" do
    raw_client = build_client.management.instance_variable_get(:@raw_client)

    _(raw_client.rate_limit_handler).must_be_nil
  end
end
