# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersConnectedAccountsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_connected_accounts_list_with_wiremock
    test_id = "users.connected_accounts.list.0"

    result = @client.users.connected_accounts.list(
      id: "id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.connected_accounts.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id/connected-accounts",
      query_params: nil,
      expected: 1
    )
  end
end
