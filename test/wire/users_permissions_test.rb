# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersPermissionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_permissions_list_with_wiremock
    test_id = "users.permissions.list.0"

    result = @client.users.permissions.list(
      id: "id",
      per_page: 1,
      page: 1,
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.permissions.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id/permissions",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_permissions_create_with_wiremock
    test_id = "users.permissions.create.0"

    @client.users.permissions.create(
      id: "id",
      permissions: [{
        resource_server_identifier: "resource_server_identifier",
        permission_name: "permission_name"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.permissions.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/users/id/permissions",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_permissions_delete_with_wiremock
    test_id = "users.permissions.delete.0"

    @client.users.permissions.delete(
      id: "id",
      permissions: [{
        resource_server_identifier: "resource_server_identifier",
        permission_name: "permission_name"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.permissions.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/users/id/permissions",
      query_params: nil,
      expected: 1
    )
  end
end
