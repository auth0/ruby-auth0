# frozen_string_literal: true

require_relative "wiremock_test_case"

class RolesUsersWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_roles_users_list_with_wiremock
    test_id = "roles.users.list.0"

    result = @client.roles.users.list(
      id: "id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "roles.users.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/roles/id/users",
      query_params: nil,
      expected: 1
    )
  end

  def test_roles_users_assign_with_wiremock
    test_id = "roles.users.assign.0"

    @client.roles.users.assign(
      id: "id",
      users: ["users"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "roles.users.assign.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/roles/id/users",
      query_params: nil,
      expected: 1
    )
  end
end
