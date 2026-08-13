# frozen_string_literal: true

require_relative "wiremock_test_case"

class ConnectionsUsersWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_connections_users_delete_by_email_with_wiremock
    test_id = "connections.users.delete_by_email.0"

    @client.connections.users.delete_by_email(
      id: "id",
      email: "email",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.users.delete_by_email.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/connections/id/users",
      query_params: { "email" => "email" },
      expected: 1
    )
  end
end
