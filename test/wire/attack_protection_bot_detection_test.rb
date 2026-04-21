# frozen_string_literal: true

require_relative "wiremock_test_case"

class AttackProtectionBotDetectionWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_attack_protection_bot_detection_get_with_wiremock
    test_id = "attack_protection.bot_detection.get.0"

    @client.attack_protection.bot_detection.get(request_options: {
                                                  additional_headers: {
                                                    "X-Test-Id" => "attack_protection.bot_detection.get.0"
                                                  }
                                                })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/attack-protection/bot-detection",
      query_params: nil,
      expected: 1
    )
  end

  def test_attack_protection_bot_detection_update_with_wiremock
    test_id = "attack_protection.bot_detection.update.0"

    @client.attack_protection.bot_detection.update(request_options: {
                                                     additional_headers: {
                                                       "X-Test-Id" => "attack_protection.bot_detection.update.0"
                                                     }
                                                   })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/attack-protection/bot-detection",
      query_params: nil,
      expected: 1
    )
  end
end
