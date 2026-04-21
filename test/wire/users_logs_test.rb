# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersLogsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_logs_list_with_wiremock
    test_id = "users.logs.list.0"

    result = @client.users.logs.list(
      id: "id",
      page: 1,
      per_page: 1,
      sort: "sort",
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.logs.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id/logs",
      query_params: nil,
      expected: 1
    )
  end
end
