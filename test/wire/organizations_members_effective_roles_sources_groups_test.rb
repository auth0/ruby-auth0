# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsMembersEffectiveRolesSourcesGroupsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_members_effective_roles_sources_groups_list_with_wiremock
    test_id = "organizations.members.effective_roles.sources.groups.list.0"

    result = @client.organizations.members.effective_roles.sources.groups.list(
      id: "id",
      user_id: "user_id",
      from: "from",
      take: 1,
      role_id: "role_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.members.effective_roles.sources.groups.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/members/user_id/effective-roles/sources/groups",
      query_params: { "role_id" => "role_id" },
      expected: 1
    )
  end
end
