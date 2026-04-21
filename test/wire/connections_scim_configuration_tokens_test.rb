# frozen_string_literal: true

require_relative "wiremock_test_case"

class ConnectionsScimConfigurationTokensWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_connections_scim_configuration_tokens_get_with_wiremock
    test_id = "connections.scim_configuration.tokens.get.0"

    @client.connections.scim_configuration.tokens.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.scim_configuration.tokens.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections/id/scim-configuration/tokens",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_scim_configuration_tokens_create_with_wiremock
    test_id = "connections.scim_configuration.tokens.create.0"

    @client.connections.scim_configuration.tokens.create(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.scim_configuration.tokens.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/connections/id/scim-configuration/tokens",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_scim_configuration_tokens_delete_with_wiremock
    test_id = "connections.scim_configuration.tokens.delete.0"

    @client.connections.scim_configuration.tokens.delete(
      id: "id",
      token_id: "tokenId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.scim_configuration.tokens.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/connections/id/scim-configuration/tokens/tokenId",
      query_params: nil,
      expected: 1
    )
  end
end
