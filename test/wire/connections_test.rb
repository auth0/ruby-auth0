# frozen_string_literal: true

require_relative "wiremock_test_case"

class ConnectionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_connections_list_with_wiremock
    test_id = "connections.list.0"

    result = @client.connections.list(
      from: "from",
      take: 1,
      name: "name",
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_create_with_wiremock
    test_id = "connections.create.0"

    @client.connections.create(
      name: "name",
      strategy: "ad",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/connections",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_get_with_wiremock
    test_id = "connections.get.0"

    @client.connections.get(
      id: "id",
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_delete_with_wiremock
    test_id = "connections.delete.0"

    @client.connections.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/connections/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_update_with_wiremock
    test_id = "connections.update.0"

    @client.connections.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/connections/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_check_status_with_wiremock
    test_id = "connections.check_status.0"

    @client.connections.check_status(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.check_status.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections/id/status",
      query_params: nil,
      expected: 1
    )
  end
end
