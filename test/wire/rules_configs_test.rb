# frozen_string_literal: true

require_relative "wiremock_test_case"

class RulesConfigsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_rules_configs_list_with_wiremock
    test_id = "rules_configs.list.0"

    @client.rules_configs.list(request_options: {
                                 additional_headers: {
                                   "X-Test-Id" => "rules_configs.list.0"
                                 }
                               })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/rules-configs",
      query_params: nil,
      expected: 1
    )
  end

  def test_rules_configs_set_with_wiremock
    test_id = "rules_configs.set.0"

    @client.rules_configs.set(
      key: "key",
      value: "value",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rules_configs.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/rules-configs/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_rules_configs_delete_with_wiremock
    test_id = "rules_configs.delete.0"

    @client.rules_configs.delete(
      key: "key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rules_configs.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/rules-configs/key",
      query_params: nil,
      expected: 1
    )
  end
end
