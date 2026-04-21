# frozen_string_literal: true

require_relative "wiremock_test_case"

class GuardianFactorsDuoSettingsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_guardian_factors_duo_settings_get_with_wiremock
    test_id = "guardian.factors.duo.settings.get.0"

    @client.guardian.factors.duo.settings.get(request_options: {
                                                additional_headers: {
                                                  "X-Test-Id" => "guardian.factors.duo.settings.get.0"
                                                }
                                              })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors/duo/settings",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_duo_settings_set_with_wiremock
    test_id = "guardian.factors.duo.settings.set.0"

    @client.guardian.factors.duo.settings.set(request_options: {
                                                additional_headers: {
                                                  "X-Test-Id" => "guardian.factors.duo.settings.set.0"
                                                }
                                              })

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/duo/settings",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_duo_settings_update_with_wiremock
    test_id = "guardian.factors.duo.settings.update.0"

    @client.guardian.factors.duo.settings.update(request_options: {
                                                   additional_headers: {
                                                     "X-Test-Id" => "guardian.factors.duo.settings.update.0"
                                                   }
                                                 })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/guardian/factors/duo/settings",
      query_params: nil,
      expected: 1
    )
  end
end
