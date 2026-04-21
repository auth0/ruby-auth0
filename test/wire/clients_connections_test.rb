# frozen_string_literal: true

require_relative "wiremock_test_case"

class ClientsConnectionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_clients_connections_get_with_wiremock
    test_id = "clients.connections.get.0"

    result = @client.clients.connections.get(
      id: "id",
      from: "from",
      take: 1,
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.connections.get.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/clients/id/connections",
      query_params: nil,
      expected: 1
    )
  end
end
