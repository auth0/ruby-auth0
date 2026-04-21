# frozen_string_literal: true

require_relative "wiremock_test_case"

class RefreshTokensWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_refresh_tokens_list_with_wiremock
    test_id = "refresh_tokens.list.0"

    result = @client.refresh_tokens.list(
      user_id: "user_id",
      client_id: "client_id",
      from: "from",
      take: 1,
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "refresh_tokens.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/refresh-tokens",
      query_params: { "user_id" => "user_id" },
      expected: 1
    )
  end

  def test_refresh_tokens_get_with_wiremock
    test_id = "refresh_tokens.get.0"

    @client.refresh_tokens.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "refresh_tokens.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/refresh-tokens/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_refresh_tokens_delete_with_wiremock
    test_id = "refresh_tokens.delete.0"

    @client.refresh_tokens.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "refresh_tokens.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/refresh-tokens/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_refresh_tokens_update_with_wiremock
    test_id = "refresh_tokens.update.0"

    @client.refresh_tokens.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "refresh_tokens.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/refresh-tokens/id",
      query_params: nil,
      expected: 1
    )
  end
end
