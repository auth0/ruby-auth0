# frozen_string_literal: true

require_relative "wiremock_test_case"

class GuardianWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_guardian_get_with_wiremock
    test_id = "guardian.get.0"

    @client.guardian.get(request_options: {
      additional_headers: {
        "X-Test-Id" => "guardian.get.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/settings",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_set_with_wiremock
    test_id = "guardian.set.0"

    @client.guardian.set(
      display_remember_me_checkbox: true,
      remember_me_default_value: true,
      mfa_session_inactivity_timeout: 1,
      mfa_session_overall_timeout: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/settings",
      query_params: nil,
      expected: 1
    )
  end
end
