# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersRefreshTokenWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_refresh_token_list_with_wiremock
    test_id = "users.refresh_token.list.0"

    result = @client.users.refresh_token.list(
      user_id: "user_id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.refresh_token.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/user_id/refresh-tokens",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_refresh_token_delete_with_wiremock
    test_id = "users.refresh_token.delete.0"

    @client.users.refresh_token.delete(
      user_id: "user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.refresh_token.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/users/user_id/refresh-tokens",
      query_params: nil,
      expected: 1
    )
  end
end
