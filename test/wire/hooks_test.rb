# frozen_string_literal: true

require_relative "wiremock_test_case"

class HooksWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_hooks_list_with_wiremock
    test_id = "hooks.list.0"

    result = @client.hooks.list(
      page: 1,
      per_page: 1,
      include_totals: true,
      enabled: true,
      fields: "fields",
      trigger_id: "credentials-exchange",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "hooks.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/hooks",
      query_params: nil,
      expected: 1
    )
  end

  def test_hooks_create_with_wiremock
    test_id = "hooks.create.0"

    @client.hooks.create(
      name: "name",
      script: "script",
      trigger_id: "credentials-exchange",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "hooks.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/hooks",
      query_params: nil,
      expected: 1
    )
  end

  def test_hooks_get_with_wiremock
    test_id = "hooks.get.0"

    @client.hooks.get(
      id: "id",
      fields: "fields",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "hooks.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/hooks/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_hooks_delete_with_wiremock
    test_id = "hooks.delete.0"

    @client.hooks.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "hooks.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/hooks/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_hooks_update_with_wiremock
    test_id = "hooks.update.0"

    @client.hooks.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "hooks.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/hooks/id",
      query_params: nil,
      expected: 1
    )
  end
end
