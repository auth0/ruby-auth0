# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersMultifactorWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_multifactor_invalidate_remember_browser_with_wiremock
    test_id = "users.multifactor.invalidate_remember_browser.0"

    @client.users.multifactor.invalidate_remember_browser(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.multifactor.invalidate_remember_browser.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/users/id/multifactor/actions/invalidate-remember-browser",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_multifactor_delete_provider_with_wiremock
    test_id = "users.multifactor.delete_provider.0"

    @client.users.multifactor.delete_provider(
      id: "id",
      provider: "duo",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.multifactor.delete_provider.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/users/id/multifactor/duo",
      query_params: nil,
      expected: 1
    )
  end
end
