# frozen_string_literal: true

require "test_helper"

describe Auth0::Client do
  def build_client(**extra)
    Auth0::Client.new(domain: "tenant.auth0.com", token: "test-token", **extra)
  end

  def raw_client_for(client)
    client.management.instance_variable_get(:@raw_client)
  end

  it "attaches the configured rate_limit_handler to the management raw client" do
    handler = ->(_rate_limit) {}
    client = build_client(rate_limit_handler: handler)

    _(raw_client_for(client).rate_limit_handler).must_be_same_as handler
  end

  it "leaves the handler unset when none is configured" do
    _(raw_client_for(build_client).rate_limit_handler).must_be_nil
  end

  it "re-attaches the handler after a token change rebuilds the management client" do
    handler = ->(_rate_limit) {}
    client = build_client(rate_limit_handler: handler)

    first = client.stub(:get_token, "token-1") { client.management }
    second = client.stub(:get_token, "token-2") { client.management }

    _(second).wont_be_same_as first
    _(second.instance_variable_get(:@raw_client).rate_limit_handler).must_be_same_as handler
  end
end
