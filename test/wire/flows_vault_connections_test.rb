# frozen_string_literal: true

require_relative "wiremock_test_case"

class FlowsVaultConnectionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_flows_vault_connections_list_with_wiremock
    test_id = "flows.vault.connections.list.0"

    result = @client.flows.vault.connections.list(
      page: 1,
      per_page: 1,
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.vault.connections.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/flows/vault/connections",
      query_params: nil,
      expected: 1
    )
  end

  def test_flows_vault_connections_create_with_wiremock
    test_id = "flows.vault.connections.create.0"

    @client.flows.vault.connections.create(
      request: {
        name: "name",
        app_id: "ACTIVECAMPAIGN",
        setup: {
          type: "API_KEY",
          api_key: "api_key",
          base_url: "base_url"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.vault.connections.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/flows/vault/connections",
      query_params: nil,
      expected: 1
    )
  end

  def test_flows_vault_connections_get_with_wiremock
    test_id = "flows.vault.connections.get.0"

    @client.flows.vault.connections.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.vault.connections.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/flows/vault/connections/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_flows_vault_connections_delete_with_wiremock
    test_id = "flows.vault.connections.delete.0"

    @client.flows.vault.connections.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.vault.connections.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/flows/vault/connections/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_flows_vault_connections_update_with_wiremock
    test_id = "flows.vault.connections.update.0"

    @client.flows.vault.connections.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.vault.connections.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/flows/vault/connections/id",
      query_params: nil,
      expected: 1
    )
  end
end
