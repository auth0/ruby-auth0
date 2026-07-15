# frozen_string_literal: true

require_relative "wiremock_test_case"

class RolesGroupsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_roles_groups_get_with_wiremock
    test_id = "roles.groups.get.0"

    result = @client.roles.groups.get(
      id: "id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "roles.groups.get.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/roles/id/groups",
      query_params: nil,
      expected: 1
    )
  end

  def test_roles_groups_create_with_wiremock
    test_id = "roles.groups.create.0"

    @client.roles.groups.create(
      id: "id",
      groups: ["groups"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "roles.groups.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/roles/id/groups",
      query_params: nil,
      expected: 1
    )
  end

  def test_roles_groups_delete_with_wiremock
    test_id = "roles.groups.delete.0"

    @client.roles.groups.delete(
      id: "id",
      groups: ["groups"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "roles.groups.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/roles/id/groups",
      query_params: nil,
      expected: 1
    )
  end
end
