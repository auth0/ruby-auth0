# frozen_string_literal: true

require_relative "wiremock_test_case"

class CustomDomainsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_custom_domains_list_with_wiremock
    test_id = "custom_domains.list.0"

    @client.custom_domains.list(
      q: "q",
      fields: "fields",
      include_fields: true,
      sort: "sort",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "custom_domains.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/custom-domains",
      query_params: nil,
      expected: 1
    )
  end

  def test_custom_domains_create_with_wiremock
    test_id = "custom_domains.create.0"

    @client.custom_domains.create(
      domain: "domain",
      type: "auth0_managed_certs",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "custom_domains.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/custom-domains",
      query_params: nil,
      expected: 1
    )
  end

  def test_custom_domains_get_default_with_wiremock
    test_id = "custom_domains.get_default.0"

    @client.custom_domains.get_default(request_options: {
                                         additional_headers: {
                                           "X-Test-Id" => "custom_domains.get_default.0"
                                         }
                                       })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/custom-domains/default",
      query_params: nil,
      expected: 1
    )
  end

  def test_custom_domains_set_default_with_wiremock
    test_id = "custom_domains.set_default.0"

    @client.custom_domains.set_default(
      domain: "domain",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "custom_domains.set_default.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/custom-domains/default",
      query_params: nil,
      expected: 1
    )
  end

  def test_custom_domains_get_with_wiremock
    test_id = "custom_domains.get.0"

    @client.custom_domains.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "custom_domains.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/custom-domains/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_custom_domains_delete_with_wiremock
    test_id = "custom_domains.delete.0"

    @client.custom_domains.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "custom_domains.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/custom-domains/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_custom_domains_update_with_wiremock
    test_id = "custom_domains.update.0"

    @client.custom_domains.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "custom_domains.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/custom-domains/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_custom_domains_test_with_wiremock
    test_id = "custom_domains.test.0"

    @client.custom_domains.test(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "custom_domains.test.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/custom-domains/id/test",
      query_params: nil,
      expected: 1
    )
  end

  def test_custom_domains_verify_with_wiremock
    test_id = "custom_domains.verify.0"

    @client.custom_domains.verify(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "custom_domains.verify.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/custom-domains/id/verify",
      query_params: nil,
      expected: 1
    )
  end
end
