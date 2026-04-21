# frozen_string_literal: true

require_relative "wiremock_test_case"

class GuardianFactorsPhoneWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_guardian_factors_phone_get_message_types_with_wiremock
    test_id = "guardian.factors.phone.get_message_types.0"

    @client.guardian.factors.phone.get_message_types(request_options: {
                                                       additional_headers: {
                                                         "X-Test-Id" => "guardian.factors.phone.get_message_types.0"
                                                       }
                                                     })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors/phone/message-types",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_phone_set_message_types_with_wiremock
    test_id = "guardian.factors.phone.set_message_types.0"

    @client.guardian.factors.phone.set_message_types(
      message_types: ["sms"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.factors.phone.set_message_types.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/phone/message-types",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_phone_get_twilio_provider_with_wiremock
    test_id = "guardian.factors.phone.get_twilio_provider.0"

    @client.guardian.factors.phone.get_twilio_provider(request_options: {
                                                         additional_headers: {
                                                           "X-Test-Id" => "guardian.factors.phone.get_twilio_provider.0"
                                                         }
                                                       })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors/phone/providers/twilio",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_phone_set_twilio_provider_with_wiremock
    test_id = "guardian.factors.phone.set_twilio_provider.0"

    @client.guardian.factors.phone.set_twilio_provider(request_options: {
                                                         additional_headers: {
                                                           "X-Test-Id" => "guardian.factors.phone.set_twilio_provider.0"
                                                         }
                                                       })

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/phone/providers/twilio",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_phone_get_selected_provider_with_wiremock
    test_id = "guardian.factors.phone.get_selected_provider.0"

    @client.guardian.factors.phone.get_selected_provider(request_options: {
                                                           additional_headers: {
                                                             "X-Test-Id" => "guardian.factors.phone.get_selected_provider.0"
                                                           }
                                                         })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors/phone/selected-provider",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_phone_set_provider_with_wiremock
    test_id = "guardian.factors.phone.set_provider.0"

    @client.guardian.factors.phone.set_provider(
      provider: "auth0",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.factors.phone.set_provider.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/phone/selected-provider",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_phone_get_templates_with_wiremock
    test_id = "guardian.factors.phone.get_templates.0"

    @client.guardian.factors.phone.get_templates(request_options: {
                                                   additional_headers: {
                                                     "X-Test-Id" => "guardian.factors.phone.get_templates.0"
                                                   }
                                                 })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors/phone/templates",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_phone_set_templates_with_wiremock
    test_id = "guardian.factors.phone.set_templates.0"

    @client.guardian.factors.phone.set_templates(
      enrollment_message: "enrollment_message",
      verification_message: "verification_message",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.factors.phone.set_templates.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/phone/templates",
      query_params: nil,
      expected: 1
    )
  end
end
