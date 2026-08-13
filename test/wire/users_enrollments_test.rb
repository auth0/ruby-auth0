# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersEnrollmentsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_enrollments_get_with_wiremock
    test_id = "users.enrollments.get.0"

    @client.users.enrollments.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.enrollments.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id/enrollments",
      query_params: nil,
      expected: 1
    )
  end
end
