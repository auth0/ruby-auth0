# frozen_string_literal: true

require_relative "wiremock_test_case"

class ClientsCredentialsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_clients_credentials_list_with_wiremock
    test_id = "clients.credentials.list.0"

    @client.clients.credentials.list(
      client_id: "client_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.credentials.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/clients/client_id/credentials",
      query_params: nil,
      expected: 1
    )
  end

  def test_clients_credentials_create_with_wiremock
    test_id = "clients.credentials.create.0"

    @client.clients.credentials.create(
      client_id: "client_id",
      credential_type: "public_key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.credentials.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/clients/client_id/credentials",
      query_params: nil,
      expected: 1
    )
  end

  def test_clients_credentials_get_with_wiremock
    test_id = "clients.credentials.get.0"

    @client.clients.credentials.get(
      client_id: "client_id",
      credential_id: "credential_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.credentials.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/clients/client_id/credentials/credential_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_clients_credentials_delete_with_wiremock
    test_id = "clients.credentials.delete.0"

    @client.clients.credentials.delete(
      client_id: "client_id",
      credential_id: "credential_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.credentials.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/clients/client_id/credentials/credential_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_clients_credentials_update_with_wiremock
    test_id = "clients.credentials.update.0"

    @client.clients.credentials.update(
      client_id: "client_id",
      credential_id: "credential_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "clients.credentials.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/clients/client_id/credentials/credential_id",
      query_params: nil,
      expected: 1
    )
  end
end
