# frozen_string_literal: true

require_relative "wiremock_test_case"

class SessionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_sessions_get_with_wiremock
    test_id = "sessions.get.0"

    @client.sessions.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sessions.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/sessions/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_sessions_delete_with_wiremock
    test_id = "sessions.delete.0"

    @client.sessions.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sessions.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/sessions/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_sessions_update_with_wiremock
    test_id = "sessions.update.0"

    @client.sessions.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sessions.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/sessions/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_sessions_revoke_with_wiremock
    test_id = "sessions.revoke.0"

    @client.sessions.revoke(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sessions.revoke.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sessions/id/revoke",
      query_params: nil,
      expected: 1
    )
  end
end
