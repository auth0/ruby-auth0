# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersAuthenticationMethodsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_authentication_methods_list_with_wiremock
    test_id = "users.authentication_methods.list.0"

    result = @client.users.authentication_methods.list(
      id: "id",
      page: 1,
      per_page: 1,
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.authentication_methods.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id/authentication-methods",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_authentication_methods_create_with_wiremock
    test_id = "users.authentication_methods.create.0"

    @client.users.authentication_methods.create(
      id: "id",
      type: "phone",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.authentication_methods.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/users/id/authentication-methods",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_authentication_methods_set_with_wiremock
    test_id = "users.authentication_methods.set.0"

    @client.users.authentication_methods.set(
      id: "id",
      request: [{
        type: "phone"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.authentication_methods.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/users/id/authentication-methods",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_authentication_methods_delete_all_with_wiremock
    test_id = "users.authentication_methods.delete_all.0"

    @client.users.authentication_methods.delete_all(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.authentication_methods.delete_all.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/users/id/authentication-methods",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_authentication_methods_get_with_wiremock
    test_id = "users.authentication_methods.get.0"

    @client.users.authentication_methods.get(
      id: "id",
      authentication_method_id: "authentication_method_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.authentication_methods.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id/authentication-methods/authentication_method_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_authentication_methods_delete_with_wiremock
    test_id = "users.authentication_methods.delete.0"

    @client.users.authentication_methods.delete(
      id: "id",
      authentication_method_id: "authentication_method_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.authentication_methods.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/users/id/authentication-methods/authentication_method_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_authentication_methods_update_with_wiremock
    test_id = "users.authentication_methods.update.0"

    @client.users.authentication_methods.update(
      id: "id",
      authentication_method_id: "authentication_method_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.authentication_methods.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/users/id/authentication-methods/authentication_method_id",
      query_params: nil,
      expected: 1
    )
  end
end
