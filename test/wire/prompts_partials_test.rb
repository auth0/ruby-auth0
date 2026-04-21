# frozen_string_literal: true

require_relative "wiremock_test_case"

class PromptsPartialsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_prompts_partials_get_with_wiremock
    test_id = "prompts.partials.get.0"

    @client.prompts.partials.get(
      prompt: "login",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "prompts.partials.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/prompts/login/partials",
      query_params: nil,
      expected: 1
    )
  end

  def test_prompts_partials_set_with_wiremock
    test_id = "prompts.partials.set.0"

    @client.prompts.partials.set(
      prompt: "login",
      request: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "prompts.partials.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/prompts/login/partials",
      query_params: nil,
      expected: 1
    )
  end
end
