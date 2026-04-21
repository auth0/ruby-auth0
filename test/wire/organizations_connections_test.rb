# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsConnectionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_connections_list_with_wiremock
    test_id = "organizations.connections.list.0"

    result = @client.organizations.connections.list(
      id: "id",
      page: 1,
      per_page: 1,
      include_totals: true,
      is_enabled: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.connections.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/connections",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_connections_create_with_wiremock
    test_id = "organizations.connections.create.0"

    @client.organizations.connections.create(
      id: "id",
      connection_id: "connection_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.connections.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/organizations/id/connections",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_connections_get_with_wiremock
    test_id = "organizations.connections.get.0"

    @client.organizations.connections.get(
      id: "id",
      connection_id: "connection_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.connections.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/connections/connection_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_connections_delete_with_wiremock
    test_id = "organizations.connections.delete.0"

    @client.organizations.connections.delete(
      id: "id",
      connection_id: "connection_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.connections.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/organizations/id/connections/connection_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_connections_update_with_wiremock
    test_id = "organizations.connections.update.0"

    @client.organizations.connections.update(
      id: "id",
      connection_id: "connection_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.connections.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/organizations/id/connections/connection_id",
      query_params: nil,
      expected: 1
    )
  end
end
