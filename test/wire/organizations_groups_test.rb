# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsGroupsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_groups_list_with_wiremock
    test_id = "organizations.groups.list.0"

    result = @client.organizations.groups.list(
      organization_id: "organization_id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.groups.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/organization_id/groups",
      query_params: nil,
      expected: 1
    )
  end
end
