# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsClientGrantsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_client_grants_list_with_wiremock
    test_id = "organizations.client_grants.list.0"

    result = @client.organizations.client_grants.list(
      id: "id",
      audience: "audience",
      client_id: "client_id",
      page: 1,
      per_page: 1,
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.client_grants.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/client-grants",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_client_grants_create_with_wiremock
    test_id = "organizations.client_grants.create.0"

    @client.organizations.client_grants.create(
      id: "id",
      grant_id: "grant_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.client_grants.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/organizations/id/client-grants",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_client_grants_delete_with_wiremock
    test_id = "organizations.client_grants.delete.0"

    @client.organizations.client_grants.delete(
      id: "id",
      grant_id: "grant_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.client_grants.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/organizations/id/client-grants/grant_id",
      query_params: nil,
      expected: 1
    )
  end
end
