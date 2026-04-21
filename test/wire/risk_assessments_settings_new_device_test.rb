# frozen_string_literal: true

require_relative "wiremock_test_case"

class RiskAssessmentsSettingsNewDeviceWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_risk_assessments_settings_new_device_get_with_wiremock
    test_id = "risk_assessments.settings.new_device.get.0"

    @client.risk_assessments.settings.new_device.get(request_options: {
                                                       additional_headers: {
                                                         "X-Test-Id" => "risk_assessments.settings.new_device.get.0"
                                                       }
                                                     })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/risk-assessments/settings/new-device",
      query_params: nil,
      expected: 1
    )
  end

  def test_risk_assessments_settings_new_device_update_with_wiremock
    test_id = "risk_assessments.settings.new_device.update.0"

    @client.risk_assessments.settings.new_device.update(
      remember_for: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "risk_assessments.settings.new_device.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/risk-assessments/settings/new-device",
      query_params: nil,
      expected: 1
    )
  end
end
