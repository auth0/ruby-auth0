# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersOrganizationsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_organizations_list_with_wiremock
    test_id = "users.organizations.list.0"

    result = @client.users.organizations.list(
      id: "id",
      page: 1,
      per_page: 1,
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.organizations.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id/organizations",
      query_params: nil,
      expected: 1
    )
  end
end
