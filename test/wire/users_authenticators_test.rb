# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersAuthenticatorsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_authenticators_delete_all_with_wiremock
    test_id = "users.authenticators.delete_all.0"

    @client.users.authenticators.delete_all(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.authenticators.delete_all.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/users/id/authenticators",
      query_params: nil,
      expected: 1
    )
  end
end
