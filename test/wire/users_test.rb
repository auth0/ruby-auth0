# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_list_with_wiremock
    test_id = "users.list.0"

    result = @client.users.list(
      page: 1,
      per_page: 1,
      include_totals: true,
      sort: "sort",
      connection: "connection",
      fields: "fields",
      include_fields: true,
      q: "q",
      search_engine: "v1",
      primary_order: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_create_with_wiremock
    test_id = "users.create.0"

    @client.users.create(
      connection: "connection",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/users",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_list_users_by_email_with_wiremock
    test_id = "users.list_users_by_email.0"

    @client.users.list_users_by_email(
      fields: "fields",
      include_fields: true,
      email: "email",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.list_users_by_email.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users-by-email",
      query_params: { "email" => "email" },
      expected: 1
    )
  end

  def test_users_get_with_wiremock
    test_id = "users.get.0"

    @client.users.get(
      id: "id",
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_delete_with_wiremock
    test_id = "users.delete.0"

    @client.users.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/users/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_update_with_wiremock
    test_id = "users.update.0"

    @client.users.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/users/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_regenerate_recovery_code_with_wiremock
    test_id = "users.regenerate_recovery_code.0"

    @client.users.regenerate_recovery_code(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.regenerate_recovery_code.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/users/id/recovery-code-regeneration",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_revoke_access_with_wiremock
    test_id = "users.revoke_access.0"

    @client.users.revoke_access(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.revoke_access.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/users/id/revoke-access",
      query_params: nil,
      expected: 1
    )
  end
end
