# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsDiscoveryDomainsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_discovery_domains_list_with_wiremock
    test_id = "organizations.discovery_domains.list.0"

    result = @client.organizations.discovery_domains.list(
      id: "id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.discovery_domains.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/discovery-domains",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_discovery_domains_create_with_wiremock
    test_id = "organizations.discovery_domains.create.0"

    @client.organizations.discovery_domains.create(
      id: "id",
      domain: "domain",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.discovery_domains.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/organizations/id/discovery-domains",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_discovery_domains_get_by_name_with_wiremock
    test_id = "organizations.discovery_domains.get_by_name.0"

    @client.organizations.discovery_domains.get_by_name(
      id: "id",
      discovery_domain: "discovery_domain",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.discovery_domains.get_by_name.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/discovery-domains/name/discovery_domain",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_discovery_domains_get_with_wiremock
    test_id = "organizations.discovery_domains.get.0"

    @client.organizations.discovery_domains.get(
      id: "id",
      discovery_domain_id: "discovery_domain_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.discovery_domains.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/discovery-domains/discovery_domain_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_discovery_domains_delete_with_wiremock
    test_id = "organizations.discovery_domains.delete.0"

    @client.organizations.discovery_domains.delete(
      id: "id",
      discovery_domain_id: "discovery_domain_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.discovery_domains.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/organizations/id/discovery-domains/discovery_domain_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_discovery_domains_update_with_wiremock
    test_id = "organizations.discovery_domains.update.0"

    @client.organizations.discovery_domains.update(
      id: "id",
      discovery_domain_id: "discovery_domain_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.discovery_domains.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/organizations/id/discovery-domains/discovery_domain_id",
      query_params: nil,
      expected: 1
    )
  end
end
