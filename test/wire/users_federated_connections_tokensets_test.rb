# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersFederatedConnectionsTokensetsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_federated_connections_tokensets_list_with_wiremock
    test_id = "users.federated_connections_tokensets.list.0"

    @client.users.federated_connections_tokensets.list(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.federated_connections_tokensets.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id/federated-connections-tokensets",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_federated_connections_tokensets_delete_with_wiremock
    test_id = "users.federated_connections_tokensets.delete.0"

    @client.users.federated_connections_tokensets.delete(
      id: "id",
      tokenset_id: "tokenset_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.federated_connections_tokensets.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/users/id/federated-connections-tokensets/tokenset_id",
      query_params: nil,
      expected: 1
    )
  end
end
