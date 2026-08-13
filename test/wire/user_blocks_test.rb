# frozen_string_literal: true

require_relative "wiremock_test_case"

class UserBlocksWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_user_blocks_list_by_identifier_with_wiremock
    test_id = "user_blocks.list_by_identifier.0"

    @client.user_blocks.list_by_identifier(
      identifier: "identifier",
      consider_brute_force_enablement: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_blocks.list_by_identifier.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/user-blocks",
      query_params: { "identifier" => "identifier" },
      expected: 1
    )
  end

  def test_user_blocks_delete_by_identifier_with_wiremock
    test_id = "user_blocks.delete_by_identifier.0"

    @client.user_blocks.delete_by_identifier(
      identifier: "identifier",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_blocks.delete_by_identifier.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/user-blocks",
      query_params: { "identifier" => "identifier" },
      expected: 1
    )
  end

  def test_user_blocks_list_with_wiremock
    test_id = "user_blocks.list.0"

    @client.user_blocks.list(
      id: "id",
      consider_brute_force_enablement: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_blocks.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/user-blocks/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_blocks_delete_with_wiremock
    test_id = "user_blocks.delete.0"

    @client.user_blocks.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_blocks.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/user-blocks/id",
      query_params: nil,
      expected: 1
    )
  end
end
