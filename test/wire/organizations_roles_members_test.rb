# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsRolesMembersWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_roles_members_list_with_wiremock
    test_id = "organizations.roles.members.list.0"

    result = @client.organizations.roles.members.list(
      id: "id",
      role_id: "role_id",
      from: "from",
      take: 1,
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.roles.members.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/roles/role_id/members",
      query_params: nil,
      expected: 1
    )
  end
end
