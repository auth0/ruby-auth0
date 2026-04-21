# frozen_string_literal: true

require_relative "wiremock_test_case"

class ClientGrantsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_client_grants_list_with_wiremock
    test_id = "client_grants.list.0"

    result = @client.client_grants.list(
      from: "from",
      take: 1,
      audience: "audience",
      client_id: "client_id",
      allow_any_organization: true,
      subject_type: "client",
      default_for: "third_party_clients",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "client_grants.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/client-grants",
      query_params: nil,
      expected: 1
    )
  end

  def test_client_grants_create_with_wiremock
    test_id = "client_grants.create.0"

    @client.client_grants.create(
      audience: "audience",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "client_grants.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/client-grants",
      query_params: nil,
      expected: 1
    )
  end

  def test_client_grants_get_with_wiremock
    test_id = "client_grants.get.0"

    @client.client_grants.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "client_grants.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/client-grants/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_client_grants_delete_with_wiremock
    test_id = "client_grants.delete.0"

    @client.client_grants.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "client_grants.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/client-grants/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_client_grants_update_with_wiremock
    test_id = "client_grants.update.0"

    @client.client_grants.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "client_grants.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/client-grants/id",
      query_params: nil,
      expected: 1
    )
  end
end
