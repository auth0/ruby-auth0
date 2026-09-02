# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsOrganizationTemplateWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_organization_template_get_with_wiremock
    test_id = "organizations.organization_template.get.0"

    @client.organizations.organization_template.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.organization_template.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/organization-templates",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_organization_template_assign_organization_template_with_wiremock
    test_id = "organizations.organization_template.assign_organization_template.0"

    @client.organizations.organization_template.assign_organization_template(
      id: "id",
      template_id: "template_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.organization_template.assign_organization_template.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/organizations/id/organization-templates/template_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_organization_template_unassign_organization_template_with_wiremock
    test_id = "organizations.organization_template.unassign_organization_template.0"

    @client.organizations.organization_template.unassign_organization_template(
      id: "id",
      template_id: "template_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.organization_template.unassign_organization_template.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/organizations/id/organization-templates/template_id",
      query_params: nil,
      expected: 1
    )
  end
end
