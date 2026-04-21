# frozen_string_literal: true

require_relative "wiremock_test_case"

class ResourceServersWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_resource_servers_list_with_wiremock
    test_id = "resource_servers.list.0"

    result = @client.resource_servers.list(
      page: 1,
      per_page: 1,
      include_totals: true,
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "resource_servers.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/resource-servers",
      query_params: nil,
      expected: 1
    )
  end

  def test_resource_servers_create_with_wiremock
    test_id = "resource_servers.create.0"

    @client.resource_servers.create(
      identifier: "identifier",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "resource_servers.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/resource-servers",
      query_params: nil,
      expected: 1
    )
  end

  def test_resource_servers_get_with_wiremock
    test_id = "resource_servers.get.0"

    @client.resource_servers.get(
      id: "id",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "resource_servers.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/resource-servers/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_resource_servers_delete_with_wiremock
    test_id = "resource_servers.delete.0"

    @client.resource_servers.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "resource_servers.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/resource-servers/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_resource_servers_update_with_wiremock
    test_id = "resource_servers.update.0"

    @client.resource_servers.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "resource_servers.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/resource-servers/id",
      query_params: nil,
      expected: 1
    )
  end
end
