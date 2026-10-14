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

  it "raises when the handler does not respond to #call" do
    _(-> { build_client(rate_limit_handler: "not-callable") }).must_raise ArgumentError
  end

  it "raises when the management client exposes no compatible raw client" do
    client = build_client(rate_limit_handler: ->(_rate_limit) {})
    incompatible = Object.new
    incompatible.instance_variable_set(:@raw_client, Object.new) # no rate_limit_handler=

    Auth0::Management.stub(:new, incompatible) do
      _(-> { client.management }).must_raise Auth0::Exception
    end
  end

  it "does not cache a management client when attaching the handler fails" do
    client = build_client(rate_limit_handler: ->(_rate_limit) {})
    incompatible = Object.new
    incompatible.instance_variable_set(:@raw_client, Object.new)

    Auth0::Management.stub(:new, incompatible) do
      _(-> { client.management }).must_raise Auth0::Exception
      # A second call must retry (and raise again) rather than return a cached,
      # handler-less management.
      _(-> { client.management }).must_raise Auth0::Exception
    end
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
