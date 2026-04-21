# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsInvitationsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_invitations_list_with_wiremock
    test_id = "organizations.invitations.list.0"

    result = @client.organizations.invitations.list(
      id: "id",
      page: 1,
      per_page: 1,
      include_totals: true,
      fields: "fields",
      include_fields: true,
      sort: "sort",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.invitations.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/invitations",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_invitations_create_with_wiremock
    test_id = "organizations.invitations.create.0"

    @client.organizations.invitations.create(
      id: "id",
      inviter: {
        name: "name"
      },
      invitee: {
        email: "email"
      },
      client_id: "client_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.invitations.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/organizations/id/invitations",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_invitations_get_with_wiremock
    test_id = "organizations.invitations.get.0"

    @client.organizations.invitations.get(
      id: "id",
      invitation_id: "invitation_id",
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.invitations.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/invitations/invitation_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_invitations_delete_with_wiremock
    test_id = "organizations.invitations.delete.0"

    @client.organizations.invitations.delete(
      id: "id",
      invitation_id: "invitation_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.invitations.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/organizations/id/invitations/invitation_id",
      query_params: nil,
      expected: 1
    )
  end
end
