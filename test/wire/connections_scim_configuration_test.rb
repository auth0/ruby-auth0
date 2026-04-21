# frozen_string_literal: true

require_relative "wiremock_test_case"

class ConnectionsScimConfigurationWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_connections_scim_configuration_list_with_wiremock
    test_id = "connections.scim_configuration.list.0"

    result = @client.connections.scim_configuration.list(
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.scim_configuration.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections-scim-configurations",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_scim_configuration_get_with_wiremock
    test_id = "connections.scim_configuration.get.0"

    @client.connections.scim_configuration.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.scim_configuration.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections/id/scim-configuration",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_scim_configuration_create_with_wiremock
    test_id = "connections.scim_configuration.create.0"

    @client.connections.scim_configuration.create(
      id: "id",
      request: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.scim_configuration.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/connections/id/scim-configuration",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_scim_configuration_delete_with_wiremock
    test_id = "connections.scim_configuration.delete.0"

    @client.connections.scim_configuration.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.scim_configuration.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/connections/id/scim-configuration",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_scim_configuration_update_with_wiremock
    test_id = "connections.scim_configuration.update.0"

    @client.connections.scim_configuration.update(
      id: "id",
      user_id_attribute: "user_id_attribute",
      mapping: [{}],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.scim_configuration.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/connections/id/scim-configuration",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_scim_configuration_get_default_mapping_with_wiremock
    test_id = "connections.scim_configuration.get_default_mapping.0"

    @client.connections.scim_configuration.get_default_mapping(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.scim_configuration.get_default_mapping.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections/id/scim-configuration/default-mapping",
      query_params: nil,
      expected: 1
    )
  end
end
