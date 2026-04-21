# frozen_string_literal: true

require_relative "wiremock_test_case"

class AttackProtectionBruteForceProtectionWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_attack_protection_brute_force_protection_get_with_wiremock
    test_id = "attack_protection.brute_force_protection.get.0"

    @client.attack_protection.brute_force_protection.get(request_options: {
                                                           additional_headers: {
                                                             "X-Test-Id" => "attack_protection.brute_force_protection.get.0"
                                                           }
                                                         })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/attack-protection/brute-force-protection",
      query_params: nil,
      expected: 1
    )
  end

  def test_attack_protection_brute_force_protection_update_with_wiremock
    test_id = "attack_protection.brute_force_protection.update.0"

    @client.attack_protection.brute_force_protection.update(request_options: {
                                                              additional_headers: {
                                                                "X-Test-Id" => "attack_protection.brute_force_protection.update.0"
                                                              }
                                                            })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/attack-protection/brute-force-protection",
      query_params: nil,
      expected: 1
    )
  end
end
