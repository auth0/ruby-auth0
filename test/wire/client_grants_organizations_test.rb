# frozen_string_literal: true

require_relative "wiremock_test_case"

class ClientGrantsOrganizationsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_client_grants_organizations_list_with_wiremock
    test_id = "client_grants.organizations.list.0"

    result = @client.client_grants.organizations.list(
      id: "id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "client_grants.organizations.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/client-grants/id/organizations",
      query_params: nil,
      expected: 1
    )
  end
end
