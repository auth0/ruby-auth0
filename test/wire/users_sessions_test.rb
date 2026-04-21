# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersSessionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_sessions_list_with_wiremock
    test_id = "users.sessions.list.0"

    result = @client.users.sessions.list(
      user_id: "user_id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.sessions.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/user_id/sessions",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_sessions_delete_with_wiremock
    test_id = "users.sessions.delete.0"

    @client.users.sessions.delete(
      user_id: "user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.sessions.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/users/user_id/sessions",
      query_params: nil,
      expected: 1
    )
  end
end
