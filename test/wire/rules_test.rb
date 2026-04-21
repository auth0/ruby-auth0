# frozen_string_literal: true

require_relative "wiremock_test_case"

class RulesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_rules_list_with_wiremock
    test_id = "rules.list.0"

    result = @client.rules.list(
      page: 1,
      per_page: 1,
      include_totals: true,
      enabled: true,
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rules.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/rules",
      query_params: nil,
      expected: 1
    )
  end

  def test_rules_create_with_wiremock
    test_id = "rules.create.0"

    @client.rules.create(
      name: "name",
      script: "script",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rules.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/rules",
      query_params: nil,
      expected: 1
    )
  end

  def test_rules_get_with_wiremock
    test_id = "rules.get.0"

    @client.rules.get(
      id: "id",
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rules.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/rules/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_rules_delete_with_wiremock
    test_id = "rules.delete.0"

    @client.rules.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rules.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/rules/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_rules_update_with_wiremock
    test_id = "rules.update.0"

    @client.rules.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rules.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/rules/id",
      query_params: nil,
      expected: 1
    )
  end
end
