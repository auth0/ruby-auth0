# frozen_string_literal: true

require_relative "wiremock_test_case"

class GuardianFactorsSmsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_guardian_factors_sms_get_twilio_provider_with_wiremock
    test_id = "guardian.factors.sms.get_twilio_provider.0"

    @client.guardian.factors.sms.get_twilio_provider(request_options: {
                                                       additional_headers: {
                                                         "X-Test-Id" => "guardian.factors.sms.get_twilio_provider.0"
                                                       }
                                                     })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors/sms/providers/twilio",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_sms_set_twilio_provider_with_wiremock
    test_id = "guardian.factors.sms.set_twilio_provider.0"

    @client.guardian.factors.sms.set_twilio_provider(request_options: {
                                                       additional_headers: {
                                                         "X-Test-Id" => "guardian.factors.sms.set_twilio_provider.0"
                                                       }
                                                     })

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/sms/providers/twilio",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_sms_get_selected_provider_with_wiremock
    test_id = "guardian.factors.sms.get_selected_provider.0"

    @client.guardian.factors.sms.get_selected_provider(request_options: {
                                                         additional_headers: {
                                                           "X-Test-Id" => "guardian.factors.sms.get_selected_provider.0"
                                                         }
                                                       })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors/sms/selected-provider",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_sms_set_provider_with_wiremock
    test_id = "guardian.factors.sms.set_provider.0"

    @client.guardian.factors.sms.set_provider(
      provider: "auth0",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.factors.sms.set_provider.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/sms/selected-provider",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_sms_get_templates_with_wiremock
    test_id = "guardian.factors.sms.get_templates.0"

    @client.guardian.factors.sms.get_templates(request_options: {
                                                 additional_headers: {
                                                   "X-Test-Id" => "guardian.factors.sms.get_templates.0"
                                                 }
                                               })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors/sms/templates",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_sms_set_templates_with_wiremock
    test_id = "guardian.factors.sms.set_templates.0"

    @client.guardian.factors.sms.set_templates(
      enrollment_message: "enrollment_message",
      verification_message: "verification_message",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.factors.sms.set_templates.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/sms/templates",
      query_params: nil,
      expected: 1
    )
  end
end
