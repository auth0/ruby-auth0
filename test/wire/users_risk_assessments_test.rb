# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersRiskAssessmentsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_risk_assessments_clear_with_wiremock
    test_id = "users.risk_assessments.clear.0"

    @client.users.risk_assessments.clear(
      id: "id",
      connection: "connection",
      assessors: ["new-device"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.risk_assessments.clear.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/users/id/risk-assessments/clear",
      query_params: nil,
      expected: 1
    )
  end
end
