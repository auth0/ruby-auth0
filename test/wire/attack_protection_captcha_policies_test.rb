# frozen_string_literal: true

require_relative "wiremock_test_case"

class AttackProtectionCaptchaPoliciesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_attack_protection_captcha_policies_list_with_wiremock
    test_id = "attack_protection.captcha_policies.list.0"

    @client.attack_protection.captcha_policies.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "attack_protection.captcha_policies.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/attack-protection/captcha/policies",
      query_params: nil,
      expected: 1
    )
  end

  def test_attack_protection_captcha_policies_create_with_wiremock
    test_id = "attack_protection.captcha_policies.create.0"

    @client.attack_protection.captcha_policies.create(
      name: "name",
      priority: 1,
      match: {},
      action: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "attack_protection.captcha_policies.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/attack-protection/captcha/policies",
      query_params: nil,
      expected: 1
    )
  end

  def test_attack_protection_captcha_policies_get_with_wiremock
    test_id = "attack_protection.captcha_policies.get.0"

    @client.attack_protection.captcha_policies.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "attack_protection.captcha_policies.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/attack-protection/captcha/policies/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_attack_protection_captcha_policies_delete_with_wiremock
    test_id = "attack_protection.captcha_policies.delete.0"

    @client.attack_protection.captcha_policies.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "attack_protection.captcha_policies.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/attack-protection/captcha/policies/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_attack_protection_captcha_policies_update_with_wiremock
    test_id = "attack_protection.captcha_policies.update.0"

    @client.attack_protection.captcha_policies.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "attack_protection.captcha_policies.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/attack-protection/captcha/policies/id",
      query_params: nil,
      expected: 1
    )
  end
end
