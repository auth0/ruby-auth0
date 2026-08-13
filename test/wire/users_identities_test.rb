# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersIdentitiesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_identities_link_with_wiremock
    test_id = "users.identities.link.0"

    @client.users.identities.link(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.identities.link.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/users/id/identities",
      query_params: nil,
      expected: 1
    )
  end

  def test_users_identities_delete_with_wiremock
    test_id = "users.identities.delete.0"

    @client.users.identities.delete(
      id: "id",
      provider: "ad",
      user_id: "user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.identities.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/users/id/identities/ad/user_id",
      query_params: nil,
      expected: 1
    )
  end
end
