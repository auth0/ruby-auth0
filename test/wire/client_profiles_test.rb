# frozen_string_literal: true

require_relative "wiremock_test_case"

class ClientProfilesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_client_profiles_list_with_wiremock
    test_id = "client_profiles.list.0"

    result = @client.client_profiles.list(
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "client_profiles.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/client-profiles",
      query_params: nil,
      expected: 1
    )
  end

  def test_client_profiles_create_with_wiremock
    test_id = "client_profiles.create.0"

    @client.client_profiles.create(
      name: "name",
      client_configuration: {},
      apply_policy: {
        external_metadata_type: "cimd",
        external_metadata_created_by: "client"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "client_profiles.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/client-profiles",
      query_params: nil,
      expected: 1
    )
  end

  def test_client_profiles_get_with_wiremock
    test_id = "client_profiles.get.0"

    @client.client_profiles.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "client_profiles.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/client-profiles/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_client_profiles_delete_with_wiremock
    test_id = "client_profiles.delete.0"

    @client.client_profiles.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "client_profiles.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/client-profiles/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_client_profiles_update_with_wiremock
    test_id = "client_profiles.update.0"

    @client.client_profiles.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "client_profiles.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/client-profiles/id",
      query_params: nil,
      expected: 1
    )
  end
end
