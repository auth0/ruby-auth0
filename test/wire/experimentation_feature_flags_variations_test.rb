# frozen_string_literal: true

require_relative "wiremock_test_case"

class ExperimentationFeatureFlagsVariationsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_experimentation_feature_flags_variations_list_with_wiremock
    test_id = "experimentation.feature_flags.variations.list.0"

    @client.experimentation.feature_flags.variations.list(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.feature_flags.variations.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/experimentation/feature-flags/id/variations",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_feature_flags_variations_create_with_wiremock
    test_id = "experimentation.feature_flags.variations.create.0"

    @client.experimentation.feature_flags.variations.create(
      id: "id",
      name: "name",
      overrides: {
        key: "value"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.feature_flags.variations.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/experimentation/feature-flags/id/variations",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_feature_flags_variations_get_with_wiremock
    test_id = "experimentation.feature_flags.variations.get.0"

    @client.experimentation.feature_flags.variations.get(
      id: "id",
      vid: "vid",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.feature_flags.variations.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/experimentation/feature-flags/id/variations/vid",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_feature_flags_variations_delete_with_wiremock
    test_id = "experimentation.feature_flags.variations.delete.0"

    @client.experimentation.feature_flags.variations.delete(
      id: "id",
      vid: "vid",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.feature_flags.variations.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/experimentation/feature-flags/id/variations/vid",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_feature_flags_variations_update_with_wiremock
    test_id = "experimentation.feature_flags.variations.update.0"

    @client.experimentation.feature_flags.variations.update(
      id: "id",
      vid: "vid",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.feature_flags.variations.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/experimentation/feature-flags/id/variations/vid",
      query_params: nil,
      expected: 1
    )
  end
end
