# frozen_string_literal: true

require_relative "wiremock_test_case"

class GroupsRolesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_groups_roles_list_with_wiremock
    test_id = "groups.roles.list.0"

    result = @client.groups.roles.list(
      id: "id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "groups.roles.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/groups/id/roles",
      query_params: nil,
      expected: 1
    )
  end

  def test_groups_roles_create_with_wiremock
    test_id = "groups.roles.create.0"

    @client.groups.roles.create(
      id: "id",
      roles: ["roles"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "groups.roles.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/groups/id/roles",
      query_params: nil,
      expected: 1
    )
  end

  def test_groups_roles_delete_with_wiremock
    test_id = "groups.roles.delete.0"

    @client.groups.roles.delete(
      id: "id",
      roles: ["roles"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "groups.roles.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/groups/id/roles",
      query_params: nil,
      expected: 1
    )
  end
end
