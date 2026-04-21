# frozen_string_literal: true

require_relative "wiremock_test_case"

class ClientsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_clients_list_with_wiremock
    test_id = "clients.list.0"

    result = @client.clients.list(
      fields: "fields",
      include_fields: true,
      page: 1,
      per_page: 1,
      include_totals: true,
      is_global: true,
      is_first_party: true,
      app_type: "app_type",
      external_client_id: "external_client_id",
      q: "q",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/clients",
      query_params: nil,
      expected: 1
    )
  end

  def test_clients_create_with_wiremock
    test_id = "clients.create.0"

    @client.clients.create(
      name: "name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/clients",
      query_params: nil,
      expected: 1
    )
  end

  def test_clients_preview_cimd_metadata_with_wiremock
    test_id = "clients.preview_cimd_metadata.0"

    @client.clients.preview_cimd_metadata(
      external_client_id: "external_client_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.preview_cimd_metadata.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/clients/cimd/preview",
      query_params: nil,
      expected: 1
    )
  end

  def test_clients_register_cimd_client_with_wiremock
    test_id = "clients.register_cimd_client.0"

    @client.clients.register_cimd_client(
      external_client_id: "external_client_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.register_cimd_client.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/clients/cimd/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_clients_get_with_wiremock
    test_id = "clients.get.0"

    @client.clients.get(
      id: "id",
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/clients/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_clients_delete_with_wiremock
    test_id = "clients.delete.0"

    @client.clients.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/clients/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_clients_update_with_wiremock
    test_id = "clients.update.0"

    @client.clients.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/clients/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_clients_rotate_secret_with_wiremock
    test_id = "clients.rotate_secret.0"

    @client.clients.rotate_secret(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.rotate_secret.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/clients/id/rotate-secret",
      query_params: nil,
      expected: 1
    )
  end
end
