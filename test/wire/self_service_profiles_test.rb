# frozen_string_literal: true

require_relative "wiremock_test_case"

class SelfServiceProfilesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_self_service_profiles_list_with_wiremock
    test_id = "self_service_profiles.list.0"

    result = @client.self_service_profiles.list(
      page: 1,
      per_page: 1,
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "self_service_profiles.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/self-service-profiles",
      query_params: nil,
      expected: 1
    )
  end

  def test_self_service_profiles_create_with_wiremock
    test_id = "self_service_profiles.create.0"

    @client.self_service_profiles.create(
      name: "name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "self_service_profiles.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/self-service-profiles",
      query_params: nil,
      expected: 1
    )
  end

  def test_self_service_profiles_get_with_wiremock
    test_id = "self_service_profiles.get.0"

    @client.self_service_profiles.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "self_service_profiles.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/self-service-profiles/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_self_service_profiles_delete_with_wiremock
    test_id = "self_service_profiles.delete.0"

    @client.self_service_profiles.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "self_service_profiles.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/self-service-profiles/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_self_service_profiles_update_with_wiremock
    test_id = "self_service_profiles.update.0"

    @client.self_service_profiles.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "self_service_profiles.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/self-service-profiles/id",
      query_params: nil,
      expected: 1
    )
  end
end
