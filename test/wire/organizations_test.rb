# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrganizationsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_organizations_list_with_wiremock
    test_id = "organizations.list.0"

    result = @client.organizations.list(
      from: "from",
      take: 1,
      sort: "sort",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_create_with_wiremock
    test_id = "organizations.create.0"

    @client.organizations.create(
      name: "name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/organizations",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_get_by_name_with_wiremock
    test_id = "organizations.get_by_name.0"

    @client.organizations.get_by_name(
      name: "name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.get_by_name.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/name/name",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_get_with_wiremock
    test_id = "organizations.get.0"

    @client.organizations.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/organizations/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_delete_with_wiremock
    test_id = "organizations.delete.0"

    @client.organizations.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/organizations/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_organizations_update_with_wiremock
    test_id = "organizations.update.0"

    @client.organizations.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "organizations.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/organizations/id",
      query_params: nil,
      expected: 1
    )
  end
end
