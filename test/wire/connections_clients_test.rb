# frozen_string_literal: true

require_relative "wiremock_test_case"

class ConnectionsClientsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_connections_clients_get_with_wiremock
    test_id = "connections.clients.get.0"

    result = @client.connections.clients.get(
      id: "id",
      take: 1,
      from: "from",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.clients.get.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections/id/clients",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_clients_update_with_wiremock
    test_id = "connections.clients.update.0"

    @client.connections.clients.update(
      id: "id",
      request: [{
        client_id: "client_id",
        status: true
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.clients.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/connections/id/clients",
      query_params: nil,
      expected: 1
    )
  end
end
