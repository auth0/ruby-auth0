# frozen_string_literal: true

require_relative "wiremock_test_case"

class PortalsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_portals_list_with_wiremock
    test_id = "portals.list.0"

    @client.portals.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "portals.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/portals",
      query_params: nil,
      expected: 1
    )
  end

  def test_portals_create_with_wiremock
    test_id = "portals.create.0"

    @client.portals.create(
      slug: "slug",
      name: "name",
      client: {
        token_endpoint_auth_method: "client_secret_post",
        client_id: "client_id",
        client_secret: "client_secret"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "portals.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/portals",
      query_params: nil,
      expected: 1
    )
  end

  def test_portals_get_with_wiremock
    test_id = "portals.get.0"

    @client.portals.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "portals.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/portals/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_portals_delete_with_wiremock
    test_id = "portals.delete.0"

    @client.portals.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "portals.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/portals/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_portals_update_with_wiremock
    test_id = "portals.update.0"

    @client.portals.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "portals.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/portals/id",
      query_params: nil,
      expected: 1
    )
  end
end
