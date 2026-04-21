# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsMembersRolesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_members_roles_list_with_wiremock
    test_id = "organizations.members.roles.list.0"

    result = @client.organizations.members.roles.list(
      id: "id",
      user_id: "user_id",
      page: 1,
      per_page: 1,
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.members.roles.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/members/user_id/roles",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_members_roles_assign_with_wiremock
    test_id = "organizations.members.roles.assign.0"

    @client.organizations.members.roles.assign(
      id: "id",
      user_id: "user_id",
      roles: ["roles"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.members.roles.assign.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/organizations/id/members/user_id/roles",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_members_roles_delete_with_wiremock
    test_id = "organizations.members.roles.delete.0"

    @client.organizations.members.roles.delete(
      id: "id",
      user_id: "user_id",
      roles: ["roles"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.members.roles.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/organizations/id/members/user_id/roles",
      query_params: nil,
      expected: 1
    )
  end
end
