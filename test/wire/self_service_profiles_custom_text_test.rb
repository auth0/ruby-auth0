# frozen_string_literal: true

require_relative "wiremock_test_case"

class SelfServiceProfilesCustomTextWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_self_service_profiles_custom_text_list_with_wiremock
    test_id = "self_service_profiles.custom_text.list.0"

    @client.self_service_profiles.custom_text.list(
      id: "id",
      language: "en",
      page: "get-started",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "self_service_profiles.custom_text.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/self-service-profiles/id/custom-text/en/get-started",
      query_params: nil,
      expected: 1
    )
  end

  def test_self_service_profiles_custom_text_set_with_wiremock
    test_id = "self_service_profiles.custom_text.set.0"

    @client.self_service_profiles.custom_text.set(
      id: "id",
      language: "en",
      page: "get-started",
      request: {
        key: "value"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "self_service_profiles.custom_text.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/self-service-profiles/id/custom-text/en/get-started",
      query_params: nil,
      expected: 1
    )
  end
end
