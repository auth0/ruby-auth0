# frozen_string_literal: true

require_relative "wiremock_test_case"

class KeysNetworkAclsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_keys_network_acls_list_with_wiremock
    test_id = "keys.network_acls.list.0"

    @client.keys.network_acls.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "keys.network_acls.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/keys/network-acls",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_network_acls_create_with_wiremock
    test_id = "keys.network_acls.create.0"

    @client.keys.network_acls.create(
      name: "name",
      alg: "hmac-sha256",
      value: "value",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "keys.network_acls.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/keys/network-acls",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_network_acls_get_with_wiremock
    test_id = "keys.network_acls.get.0"

    @client.keys.network_acls.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "keys.network_acls.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/keys/network-acls/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_network_acls_delete_with_wiremock
    test_id = "keys.network_acls.delete.0"

    @client.keys.network_acls.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "keys.network_acls.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/keys/network-acls/id",
      query_params: nil,
      expected: 1
    )
  end
end
