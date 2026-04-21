# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersGroupsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_groups_get_with_wiremock
    test_id = "users.groups.get.0"

    result = @client.users.groups.get(
      id: "id",
      fields: "fields",
      include_fields: true,
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.groups.get.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id/groups",
      query_params: nil,
      expected: 1
    )
  end
end
