# frozen_string_literal: true

require_relative "wiremock_test_case"

class RateLimitPoliciesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_rate_limit_policies_list_with_wiremock
    test_id = "rate_limit_policies.list.0"

    result = @client.rate_limit_policies.list(
      resource: "oauth_authentication_api",
      consumer: "client",
      consumer_selector: "consumer_selector",
      take: 1,
      from: "from",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rate_limit_policies.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/rate-limit-policies",
      query_params: nil,
      expected: 1
    )
  end

  def test_rate_limit_policies_create_with_wiremock
    test_id = "rate_limit_policies.create.0"

    @client.rate_limit_policies.create(
      resource: "oauth_authentication_api",
      consumer: "client",
      consumer_selector: "consumer_selector",
      configuration: {
        action: "allow"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rate_limit_policies.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/rate-limit-policies",
      query_params: nil,
      expected: 1
    )
  end

  def test_rate_limit_policies_get_with_wiremock
    test_id = "rate_limit_policies.get.0"

    @client.rate_limit_policies.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rate_limit_policies.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/rate-limit-policies/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_rate_limit_policies_delete_with_wiremock
    test_id = "rate_limit_policies.delete.0"

    @client.rate_limit_policies.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rate_limit_policies.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/rate-limit-policies/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_rate_limit_policies_update_with_wiremock
    test_id = "rate_limit_policies.update.0"

    @client.rate_limit_policies.update(
      id: "id",
      configuration: {
        action: "allow"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rate_limit_policies.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/rate-limit-policies/id",
      query_params: nil,
      expected: 1
    )
  end
end
