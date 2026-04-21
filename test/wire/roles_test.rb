# frozen_string_literal: true

require_relative "wiremock_test_case"

class RolesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_roles_list_with_wiremock
    test_id = "roles.list.0"

    result = @client.roles.list(
      per_page: 1,
      page: 1,
      include_totals: true,
      name_filter: "name_filter",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "roles.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/roles",
      query_params: nil,
      expected: 1
    )
  end

  def test_roles_create_with_wiremock
    test_id = "roles.create.0"

    @client.roles.create(
      name: "name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "roles.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/roles",
      query_params: nil,
      expected: 1
    )
  end

  def test_roles_get_with_wiremock
    test_id = "roles.get.0"

    @client.roles.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "roles.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/roles/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_roles_delete_with_wiremock
    test_id = "roles.delete.0"

    @client.roles.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "roles.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/roles/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_roles_update_with_wiremock
    test_id = "roles.update.0"

    @client.roles.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "roles.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/roles/id",
      query_params: nil,
      expected: 1
    )
  end
end
