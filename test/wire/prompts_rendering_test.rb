# frozen_string_literal: true

require_relative "wiremock_test_case"

class PromptsRenderingWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_prompts_rendering_list_with_wiremock
    test_id = "prompts.rendering.list.0"

    result = @client.prompts.rendering.list(
      fields: "fields",
      include_fields: true,
      page: 1,
      per_page: 1,
      include_totals: true,
      prompt: "prompt",
      screen: "screen",
      rendering_mode: "advanced",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "prompts.rendering.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/prompts/rendering",
      query_params: nil,
      expected: 1
    )
  end

  def test_prompts_rendering_bulk_update_with_wiremock
    test_id = "prompts.rendering.bulk_update.0"

    @client.prompts.rendering.bulk_update(
      configs: [{
        prompt: "login",
        screen: "login"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "prompts.rendering.bulk_update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/prompts/rendering",
      query_params: nil,
      expected: 1
    )
  end

  def test_prompts_rendering_get_with_wiremock
    test_id = "prompts.rendering.get.0"

    @client.prompts.rendering.get(
      prompt: "login",
      screen: "login",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "prompts.rendering.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/prompts/login/screen/login/rendering",
      query_params: nil,
      expected: 1
    )
  end

  def test_prompts_rendering_update_with_wiremock
    test_id = "prompts.rendering.update.0"

    @client.prompts.rendering.update(
      prompt: "login",
      screen: "login",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "prompts.rendering.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/prompts/login/screen/login/rendering",
      query_params: nil,
      expected: 1
    )
  end
end
