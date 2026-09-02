# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationTemplatesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organization_templates_list_with_wiremock
    test_id = "organization_templates.list.0"

    result = @client.organization_templates.list(
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organization_templates.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organization-templates",
      query_params: nil,
      expected: 1
    )
  end

  def test_organization_templates_create_with_wiremock
    test_id = "organization_templates.create.0"

    @client.organization_templates.create(
      name: "name",
      organization_deletion_behavior: "allow",
      enforce_permission_ceiling: true,
      enforce_self_assignment_restriction: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organization_templates.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/organization-templates",
      query_params: nil,
      expected: 1
    )
  end

  def test_organization_templates_get_with_wiremock
    test_id = "organization_templates.get.0"

    @client.organization_templates.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organization_templates.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organization-templates/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_organization_templates_update_with_wiremock
    test_id = "organization_templates.update.0"

    @client.organization_templates.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organization_templates.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/organization-templates/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_organization_templates_list_organizations_with_wiremock
    test_id = "organization_templates.list_organizations.0"

    result = @client.organization_templates.list_organizations(
      id: "id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organization_templates.list_organizations.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organization-templates/id/organizations",
      query_params: nil,
      expected: 1
    )
  end
end
