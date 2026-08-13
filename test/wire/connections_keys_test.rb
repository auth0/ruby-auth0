# frozen_string_literal: true

require_relative "wiremock_test_case"

class ConnectionsKeysWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_connections_keys_get_with_wiremock
    test_id = "connections.keys.get.0"

    @client.connections.keys.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.keys.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections/id/keys",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_keys_create_with_wiremock
    test_id = "connections.keys.create.0"

    @client.connections.keys.create(
      id: "id",
      request: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.keys.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/connections/id/keys",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_keys_rotate_with_wiremock
    test_id = "connections.keys.rotate.0"

    @client.connections.keys.rotate(
      id: "id",
      request: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.keys.rotate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/connections/id/keys/rotate",
      query_params: nil,
      expected: 1
    )
  end
end
