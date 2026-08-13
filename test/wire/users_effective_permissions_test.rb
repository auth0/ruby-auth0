# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersEffectivePermissionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_effective_permissions_list_with_wiremock
    test_id = "users.effective_permissions.list.0"

    result = @client.users.effective_permissions.list(
      id: "id",
      from: "from",
      take: 1,
      resource_server_identifier: "resource_server_identifier",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.effective_permissions.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id/effective-permissions",
      query_params: { "resource_server_identifier" => "resource_server_identifier" },
      expected: 1
    )
  end
end
