# frozen_string_literal: true

require_relative "wiremock_test_case"

class UserGrantsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_user_grants_list_with_wiremock
    test_id = "user_grants.list.0"

    result = @client.user_grants.list(
      per_page: 1,
      page: 1,
      include_totals: true,
      user_id: "user_id",
      client_id: "client_id",
      audience: "audience",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_grants.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/grants",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_grants_delete_by_user_id_with_wiremock
    test_id = "user_grants.delete_by_user_id.0"

    @client.user_grants.delete_by_user_id(
      user_id: "user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_grants.delete_by_user_id.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/grants",
      query_params: { "user_id" => "user_id" },
      expected: 1
    )
  end

  def test_user_grants_delete_with_wiremock
    test_id = "user_grants.delete.0"

    @client.user_grants.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_grants.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/grants/id",
      query_params: nil,
      expected: 1
    )
  end
end
