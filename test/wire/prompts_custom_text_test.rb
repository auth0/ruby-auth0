# frozen_string_literal: true

require_relative "wiremock_test_case"

class PromptsCustomTextWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_prompts_custom_text_get_with_wiremock
    test_id = "prompts.custom_text.get.0"

    @client.prompts.custom_text.get(
      prompt: "login",
      language: "am",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "prompts.custom_text.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/prompts/login/custom-text/am",
      query_params: nil,
      expected: 1
    )
  end

  def test_prompts_custom_text_set_with_wiremock
    test_id = "prompts.custom_text.set.0"

    @client.prompts.custom_text.set(
      prompt: "login",
      language: "am",
      request: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "prompts.custom_text.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/prompts/login/custom-text/am",
      query_params: nil,
      expected: 1
    )
  end
end
