# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersRolesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_roles_list_with_wiremock
    test_id = "users.roles.list.0"

    result = @client.users.roles.list(
      id: "id",
      per_page: 1,
      page: 1,
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.roles.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id/roles",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_roles_assign_with_wiremock
    test_id = "users.roles.assign.0"

    @client.users.roles.assign(
      id: "id",
      roles: ["roles"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.roles.assign.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/users/id/roles",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_roles_delete_with_wiremock
    test_id = "users.roles.delete.0"

    @client.users.roles.delete(
      id: "id",
      roles: ["roles"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.roles.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/users/id/roles",
      query_params: nil,
      expected: 1
    )
  end
end
