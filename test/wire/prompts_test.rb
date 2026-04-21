# frozen_string_literal: true

require_relative "wiremock_test_case"

class PromptsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_prompts_get_settings_with_wiremock
    test_id = "prompts.get_settings.0"

    @client.prompts.get_settings(request_options: {
                                   additional_headers: {
                                     "X-Test-Id" => "prompts.get_settings.0"
                                   }
                                 })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/prompts",
      query_params: nil,
      expected: 1
    )
  end

  def test_prompts_update_settings_with_wiremock
    test_id = "prompts.update_settings.0"

    @client.prompts.update_settings(request_options: {
                                      additional_headers: {
                                        "X-Test-Id" => "prompts.update_settings.0"
                                      }
                                    })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/prompts",
      query_params: nil,
      expected: 1
    )
  end
end
