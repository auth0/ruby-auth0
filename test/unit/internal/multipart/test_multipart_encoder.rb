# frozen_string_literal: true

require "test_helper"
require "stringio"
require "webmock"

describe Auth0::Internal::Multipart::Encoder do
  def build_form_data
    form_data = Auth0::Internal::Multipart::FormData.new
    form_data.add(name: "connection_id", value: "con_123")
    form_data.add_file(name: "users", file: StringIO.new('[{"email":"a@example.com"}]'), filename: "users.json")
    form_data
  end

  describe "#encode" do
    it "returns the same payload when called more than once" do
      form_data = build_form_data

      first = form_data.encode
      second = form_data.encode

      boundary = form_data.content_type.split("boundary=").last

      assert_equal first, second
      assert_equal 1, second.scan("--#{boundary}--").size
    end
  end

  describe "when a multipart request is retried" do
    include WebMock::API

    before do
      WebMock.enable!
      WebMock.disable_net_connect!
    end

    after do
      WebMock.reset!
      WebMock.disable!
    end

    it "sends the same body on every attempt" do
      url = "https://example.auth0.com/api/v2/jobs/users-imports"
      bodies = []
      stub_request(:post, url).to_return do |request|
        bodies << request.body
        { status: bodies.size == 1 ? 503 : 201, body: "{}" }
      end

      form_data = build_form_data
      request = Auth0::Internal::Multipart::Request.new(
        base_url: "https://example.auth0.com/api/v2",
        path: "jobs/users-imports",
        method: "POST",
        body: form_data
      )
      raw_client = Auth0::Internal::Http::RawClient.new(base_url: "https://example.auth0.com/api/v2", max_retries: 1)

      response = raw_client.send(request)

      assert_equal "201", response.code
      assert_equal 2, bodies.size
      assert_equal bodies[0], bodies[1]
      assert_includes bodies[1], 'name="connection_id"'
    end
  end
end
