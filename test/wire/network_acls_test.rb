# frozen_string_literal: true

require_relative "wiremock_test_case"

class NetworkAclsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_network_acls_list_with_wiremock
    test_id = "network_acls.list.0"

    result = @client.network_acls.list(
      page: 1,
      per_page: 1,
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "network_acls.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/network-acls",
      query_params: nil,
      expected: 1
    )
  end

  def test_network_acls_create_with_wiremock
    test_id = "network_acls.create.0"

    @client.network_acls.create(
      description: "description",
      active: true,
      rule: {
        action: {},
        scope: "management"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "network_acls.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/network-acls",
      query_params: nil,
      expected: 1
    )
  end

  def test_network_acls_get_with_wiremock
    test_id = "network_acls.get.0"

    @client.network_acls.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "network_acls.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/network-acls/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_network_acls_set_with_wiremock
    test_id = "network_acls.set.0"

    @client.network_acls.set(
      id: "id",
      description: "description",
      active: true,
      rule: {
        action: {},
        scope: "management"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "network_acls.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/network-acls/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_network_acls_delete_with_wiremock
    test_id = "network_acls.delete.0"

    @client.network_acls.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "network_acls.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/network-acls/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_network_acls_update_with_wiremock
    test_id = "network_acls.update.0"

    @client.network_acls.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "network_acls.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/network-acls/id",
      query_params: nil,
      expected: 1
    )
  end
end
