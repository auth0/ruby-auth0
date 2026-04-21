# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsMembersWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_members_list_with_wiremock
    test_id = "organizations.members.list.0"

    result = @client.organizations.members.list(
      id: "id",
      from: "from",
      take: 1,
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.members.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/members",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_members_create_with_wiremock
    test_id = "organizations.members.create.0"

    @client.organizations.members.create(
      id: "id",
      members: ["members"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.members.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/organizations/id/members",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_members_delete_with_wiremock
    test_id = "organizations.members.delete.0"

    @client.organizations.members.delete(
      id: "id",
      members: ["members"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.members.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/organizations/id/members",
      query_params: nil,
      expected: 1
    )
  end
end
