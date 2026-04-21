# frozen_string_literal: true

require_relative "wiremock_test_case"

class GuardianFactorsPushNotificationWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_guardian_factors_push_notification_get_apns_provider_with_wiremock
    test_id = "guardian.factors.push_notification.get_apns_provider.0"

    @client.guardian.factors.push_notification.get_apns_provider(request_options: {
                                                                   additional_headers: {
                                                                     "X-Test-Id" => "guardian.factors.push_notification.get_apns_provider.0"
                                                                   }
                                                                 })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors/push-notification/providers/apns",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_push_notification_set_apns_provider_with_wiremock
    test_id = "guardian.factors.push_notification.set_apns_provider.0"

    @client.guardian.factors.push_notification.set_apns_provider(request_options: {
                                                                   additional_headers: {
                                                                     "X-Test-Id" => "guardian.factors.push_notification.set_apns_provider.0"
                                                                   }
                                                                 })

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/push-notification/providers/apns",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_push_notification_update_apns_provider_with_wiremock
    test_id = "guardian.factors.push_notification.update_apns_provider.0"

    @client.guardian.factors.push_notification.update_apns_provider(request_options: {
                                                                      additional_headers: {
                                                                        "X-Test-Id" => "guardian.factors.push_notification.update_apns_provider.0"
                                                                      }
                                                                    })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/guardian/factors/push-notification/providers/apns",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_push_notification_set_fcm_provider_with_wiremock
    test_id = "guardian.factors.push_notification.set_fcm_provider.0"

    @client.guardian.factors.push_notification.set_fcm_provider(request_options: {
                                                                  additional_headers: {
                                                                    "X-Test-Id" => "guardian.factors.push_notification.set_fcm_provider.0"
                                                                  }
                                                                })

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/push-notification/providers/fcm",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_push_notification_update_fcm_provider_with_wiremock
    test_id = "guardian.factors.push_notification.update_fcm_provider.0"

    @client.guardian.factors.push_notification.update_fcm_provider(request_options: {
                                                                     additional_headers: {
                                                                       "X-Test-Id" => "guardian.factors.push_notification.update_fcm_provider.0"
                                                                     }
                                                                   })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/guardian/factors/push-notification/providers/fcm",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_push_notification_set_fcmv1provider_with_wiremock
    test_id = "guardian.factors.push_notification.set_fcmv1provider.0"

    @client.guardian.factors.push_notification.set_fcmv1provider(request_options: {
                                                                   additional_headers: {
                                                                     "X-Test-Id" => "guardian.factors.push_notification.set_fcmv1provider.0"
                                                                   }
                                                                 })

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/push-notification/providers/fcmv1",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_push_notification_update_fcmv1provider_with_wiremock
    test_id = "guardian.factors.push_notification.update_fcmv1provider.0"

    @client.guardian.factors.push_notification.update_fcmv1provider(request_options: {
                                                                      additional_headers: {
                                                                        "X-Test-Id" => "guardian.factors.push_notification.update_fcmv1provider.0"
                                                                      }
                                                                    })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/guardian/factors/push-notification/providers/fcmv1",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_push_notification_get_sns_provider_with_wiremock
    test_id = "guardian.factors.push_notification.get_sns_provider.0"

    @client.guardian.factors.push_notification.get_sns_provider(request_options: {
                                                                  additional_headers: {
                                                                    "X-Test-Id" => "guardian.factors.push_notification.get_sns_provider.0"
                                                                  }
                                                                })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors/push-notification/providers/sns",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_push_notification_set_sns_provider_with_wiremock
    test_id = "guardian.factors.push_notification.set_sns_provider.0"

    @client.guardian.factors.push_notification.set_sns_provider(request_options: {
                                                                  additional_headers: {
                                                                    "X-Test-Id" => "guardian.factors.push_notification.set_sns_provider.0"
                                                                  }
                                                                })

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/push-notification/providers/sns",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_push_notification_update_sns_provider_with_wiremock
    test_id = "guardian.factors.push_notification.update_sns_provider.0"

    @client.guardian.factors.push_notification.update_sns_provider(request_options: {
                                                                     additional_headers: {
                                                                       "X-Test-Id" => "guardian.factors.push_notification.update_sns_provider.0"
                                                                     }
                                                                   })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/guardian/factors/push-notification/providers/sns",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_push_notification_get_selected_provider_with_wiremock
    test_id = "guardian.factors.push_notification.get_selected_provider.0"

    @client.guardian.factors.push_notification.get_selected_provider(request_options: {
                                                                       additional_headers: {
                                                                         "X-Test-Id" => "guardian.factors.push_notification.get_selected_provider.0"
                                                                       }
                                                                     })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors/push-notification/selected-provider",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_push_notification_set_provider_with_wiremock
    test_id = "guardian.factors.push_notification.set_provider.0"

    @client.guardian.factors.push_notification.set_provider(
      provider: "guardian",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.factors.push_notification.set_provider.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/push-notification/selected-provider",
      query_params: nil,
      expected: 1
    )
  end
end
