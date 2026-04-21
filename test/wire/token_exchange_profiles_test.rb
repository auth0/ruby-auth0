# frozen_string_literal: true

require_relative "wiremock_test_case"

class TokenExchangeProfilesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_token_exchange_profiles_list_with_wiremock
    test_id = "token_exchange_profiles.list.0"

    result = @client.token_exchange_profiles.list(
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "token_exchange_profiles.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/token-exchange-profiles",
      query_params: nil,
      expected: 1
    )
  end

  def test_token_exchange_profiles_create_with_wiremock
    test_id = "token_exchange_profiles.create.0"

    @client.token_exchange_profiles.create(
      name: "name",
      subject_token_type: "subject_token_type",
      action_id: "action_id",
      type: "custom_authentication",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "token_exchange_profiles.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/token-exchange-profiles",
      query_params: nil,
      expected: 1
    )
  end

  def test_token_exchange_profiles_get_with_wiremock
    test_id = "token_exchange_profiles.get.0"

    @client.token_exchange_profiles.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "token_exchange_profiles.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/token-exchange-profiles/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_token_exchange_profiles_delete_with_wiremock
    test_id = "token_exchange_profiles.delete.0"

    @client.token_exchange_profiles.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "token_exchange_profiles.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/token-exchange-profiles/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_token_exchange_profiles_update_with_wiremock
    test_id = "token_exchange_profiles.update.0"

    @client.token_exchange_profiles.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "token_exchange_profiles.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/token-exchange-profiles/id",
      query_params: nil,
      expected: 1
    )
  end
end
