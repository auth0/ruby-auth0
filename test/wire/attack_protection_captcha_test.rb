# frozen_string_literal: true

require_relative "wiremock_test_case"

class AttackProtectionCaptchaWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_attack_protection_captcha_get_with_wiremock
    test_id = "attack_protection.captcha.get.0"

    @client.attack_protection.captcha.get(request_options: {
                                            additional_headers: {
                                              "X-Test-Id" => "attack_protection.captcha.get.0"
                                            }
                                          })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/attack-protection/captcha",
      query_params: nil,
      expected: 1
    )
  end

  def test_attack_protection_captcha_update_with_wiremock
    test_id = "attack_protection.captcha.update.0"

    @client.attack_protection.captcha.update(request_options: {
                                               additional_headers: {
                                                 "X-Test-Id" => "attack_protection.captcha.update.0"
                                               }
                                             })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/attack-protection/captcha",
      query_params: nil,
      expected: 1
    )
  end
end
