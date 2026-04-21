# frozen_string_literal: true

require_relative "wiremock_test_case"

class HooksSecretsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_hooks_secrets_get_with_wiremock
    test_id = "hooks.secrets.get.0"

    @client.hooks.secrets.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "hooks.secrets.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/hooks/id/secrets",
      query_params: nil,
      expected: 1
    )
  end

  def test_hooks_secrets_create_with_wiremock
    test_id = "hooks.secrets.create.0"

    @client.hooks.secrets.create(
      id: "id",
      request: {
        key: "value"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "hooks.secrets.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/hooks/id/secrets",
      query_params: nil,
      expected: 1
    )
  end

  def test_hooks_secrets_delete_with_wiremock
    test_id = "hooks.secrets.delete.0"

    @client.hooks.secrets.delete(
      id: "id",
      request: ["string"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "hooks.secrets.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/hooks/id/secrets",
      query_params: nil,
      expected: 1
    )
  end

  def test_hooks_secrets_update_with_wiremock
    test_id = "hooks.secrets.update.0"

    @client.hooks.secrets.update(
      id: "id",
      request: {
        key: "value"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "hooks.secrets.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/hooks/id/secrets",
      query_params: nil,
      expected: 1
    )
  end
end
