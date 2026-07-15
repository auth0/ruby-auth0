# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsGroupsRolesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_groups_roles_list_with_wiremock
    test_id = "organizations.groups.roles.list.0"

    result = @client.organizations.groups.roles.list(
      organization_id: "organization_id",
      group_id: "group_id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.groups.roles.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/organization_id/groups/group_id/roles",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_groups_roles_create_with_wiremock
    test_id = "organizations.groups.roles.create.0"

    @client.organizations.groups.roles.create(
      organization_id: "organization_id",
      group_id: "group_id",
      roles: ["roles"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.groups.roles.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/organizations/organization_id/groups/group_id/roles",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_groups_roles_delete_with_wiremock
    test_id = "organizations.groups.roles.delete.0"

    @client.organizations.groups.roles.delete(
      organization_id: "organization_id",
      group_id: "group_id",
      roles: ["roles"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.groups.roles.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/organizations/organization_id/groups/group_id/roles",
      query_params: nil,
      expected: 1
    )
  end
end
