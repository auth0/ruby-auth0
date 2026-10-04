# frozen_string_literal: true

require_relative "wiremock_test_case"

class ExperimentationFeatureFlagsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_experimentation_feature_flags_list_with_wiremock
    test_id = "experimentation.feature_flags.list.0"

    result = @client.experimentation.feature_flags.list(
      from: "from",
      take: 1,
      type: "auth0",
      status: "draft",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.feature_flags.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/experimentation/feature-flags",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_feature_flags_create_with_wiremock
    test_id = "experimentation.feature_flags.create.0"

    @client.experimentation.feature_flags.create(
      name: "name",
      parameters: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.feature_flags.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/experimentation/feature-flags",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_feature_flags_get_with_wiremock
    test_id = "experimentation.feature_flags.get.0"

    @client.experimentation.feature_flags.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.feature_flags.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/experimentation/feature-flags/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_feature_flags_delete_with_wiremock
    test_id = "experimentation.feature_flags.delete.0"

    @client.experimentation.feature_flags.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.feature_flags.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/experimentation/feature-flags/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_feature_flags_update_with_wiremock
    test_id = "experimentation.feature_flags.update.0"

    @client.experimentation.feature_flags.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.feature_flags.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/experimentation/feature-flags/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_feature_flags_update_status_with_wiremock
    test_id = "experimentation.feature_flags.update_status.0"

    @client.experimentation.feature_flags.update_status(
      id: "id",
      status: "draft",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.feature_flags.update_status.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/experimentation/feature-flags/id/status",
      query_params: nil,
      expected: 1
    )
  end
end
