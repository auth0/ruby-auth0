# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsEnabledConnectionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_enabled_connections_list_with_wiremock
    test_id = "organizations.enabled_connections.list.0"

    result = @client.organizations.enabled_connections.list(
      id: "id",
      page: 1,
      per_page: 1,
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.enabled_connections.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/enabled_connections",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_enabled_connections_add_with_wiremock
    test_id = "organizations.enabled_connections.add.0"

    @client.organizations.enabled_connections.add(
      id: "id",
      connection_id: "connection_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.enabled_connections.add.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/organizations/id/enabled_connections",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_enabled_connections_get_with_wiremock
    test_id = "organizations.enabled_connections.get.0"

    @client.organizations.enabled_connections.get(
      id: "id",
      connection_id: "connectionId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.enabled_connections.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/enabled_connections/connectionId",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_enabled_connections_delete_with_wiremock
    test_id = "organizations.enabled_connections.delete.0"

    @client.organizations.enabled_connections.delete(
      id: "id",
      connection_id: "connectionId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.enabled_connections.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/organizations/id/enabled_connections/connectionId",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_enabled_connections_update_with_wiremock
    test_id = "organizations.enabled_connections.update.0"

    @client.organizations.enabled_connections.update(
      id: "id",
      connection_id: "connectionId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.enabled_connections.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/organizations/id/enabled_connections/connectionId",
      query_params: nil,
      expected: 1
    )
  end
end
