# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsClientsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_clients_list_with_wiremock
    test_id = "organizations.clients.list.0"

    result = @client.organizations.clients.list(
      id: "id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.clients.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/clients",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_clients_create_with_wiremock
    test_id = "organizations.clients.create.0"

    @client.organizations.clients.create(
      id: "id",
      clients: [{
        client_id: "client_id",
        use_for_member_access: true
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.clients.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/organizations/id/clients",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_clients_delete_with_wiremock
    test_id = "organizations.clients.delete.0"

    @client.organizations.clients.delete(
      id: "id",
      clients: ["clients"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.clients.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/organizations/id/clients",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_clients_get_with_wiremock
    test_id = "organizations.clients.get.0"

    @client.organizations.clients.get(
      id: "id",
      client_id: "client_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.clients.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id/clients/client_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_clients_update_with_wiremock
    test_id = "organizations.clients.update.0"

    @client.organizations.clients.update(
      id: "id",
      client_id: "client_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.clients.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/organizations/id/clients/client_id",
      query_params: nil,
      expected: 1
    )
  end
end
