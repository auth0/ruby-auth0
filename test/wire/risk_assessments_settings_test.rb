# frozen_string_literal: true

require_relative "wiremock_test_case"

class RiskAssessmentsSettingsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_risk_assessments_settings_get_with_wiremock
    test_id = "risk_assessments.settings.get.0"

    @client.risk_assessments.settings.get(request_options: {
                                            additional_headers: {
                                              "X-Test-Id" => "risk_assessments.settings.get.0"
                                            }
                                          })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/risk-assessments/settings",
      query_params: nil,
      expected: 1
    )
  end

  def test_risk_assessments_settings_update_with_wiremock
    test_id = "risk_assessments.settings.update.0"

    @client.risk_assessments.settings.update(
      enabled: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "risk_assessments.settings.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/risk-assessments/settings",
      query_params: nil,
      expected: 1
    )
  end
end
