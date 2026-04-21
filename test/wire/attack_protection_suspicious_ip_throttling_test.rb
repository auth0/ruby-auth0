# frozen_string_literal: true

require_relative "wiremock_test_case"

class AttackProtectionSuspiciousIpThrottlingWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_attack_protection_suspicious_ip_throttling_get_with_wiremock
    test_id = "attack_protection.suspicious_ip_throttling.get.0"

    @client.attack_protection.suspicious_ip_throttling.get(request_options: {
                                                             additional_headers: {
                                                               "X-Test-Id" => "attack_protection.suspicious_ip_throttling.get.0"
                                                             }
                                                           })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/attack-protection/suspicious-ip-throttling",
      query_params: nil,
      expected: 1
    )
  end

  def test_attack_protection_suspicious_ip_throttling_update_with_wiremock
    test_id = "attack_protection.suspicious_ip_throttling.update.0"

    @client.attack_protection.suspicious_ip_throttling.update(request_options: {
                                                                additional_headers: {
                                                                  "X-Test-Id" => "attack_protection.suspicious_ip_throttling.update.0"
                                                                }
                                                              })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/attack-protection/suspicious-ip-throttling",
      query_params: nil,
      expected: 1
    )
  end
end
