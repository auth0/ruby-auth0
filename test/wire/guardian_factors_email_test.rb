# frozen_string_literal: true

require_relative "wiremock_test_case"

class GuardianFactorsEmailWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_guardian_factors_email_get_with_wiremock
    test_id = "guardian.factors.email.get.0"

    @client.guardian.factors.email.get(request_options: {
      additional_headers: {
        "X-Test-Id" => "guardian.factors.email.get.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors/email/settings",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_email_set_with_wiremock
    test_id = "guardian.factors.email.set.0"

    @client.guardian.factors.email.set(
      otp_length: 1,
      otp_expiration_time: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.factors.email.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/email/settings",
      query_params: nil,
      expected: 1
    )
  end
end
