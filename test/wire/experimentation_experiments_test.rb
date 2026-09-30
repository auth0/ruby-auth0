# frozen_string_literal: true

require_relative "wiremock_test_case"

class ExperimentationExperimentsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_experimentation_experiments_list_with_wiremock
    test_id = "experimentation.experiments.list.0"

    result = @client.experimentation.experiments.list(
      from: "from",
      take: 1,
      status: "draft",
      authentication_flow: "authentication_flow",
      feature_flag_id: "feature_flag_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.experiments.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/experimentation/experiments",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_experiments_create_with_wiremock
    test_id = "experimentation.experiments.create.0"

    @client.experimentation.experiments.create(
      name: "name",
      feature_flag_id: "feature_flag_id",
      authentication_flow: "authentication",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.experiments.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/experimentation/experiments",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_experiments_get_with_wiremock
    test_id = "experimentation.experiments.get.0"

    @client.experimentation.experiments.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.experiments.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/experimentation/experiments/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_experiments_delete_with_wiremock
    test_id = "experimentation.experiments.delete.0"

    @client.experimentation.experiments.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.experiments.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/experimentation/experiments/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_experiments_update_with_wiremock
    test_id = "experimentation.experiments.update.0"

    @client.experimentation.experiments.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.experiments.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/experimentation/experiments/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_experiments_advance_ramp_with_wiremock
    test_id = "experimentation.experiments.advance_ramp.0"

    @client.experimentation.experiments.advance_ramp(
      id: "id",
      target_level: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.experiments.advance_ramp.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/experimentation/experiments/id/advance-ramp",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_experiments_update_status_with_wiremock
    test_id = "experimentation.experiments.update_status.0"

    @client.experimentation.experiments.update_status(
      id: "id",
      status: "active",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.experiments.update_status.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/experimentation/experiments/id/status",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_experiments_validate_with_wiremock
    test_id = "experimentation.experiments.validate.0"

    @client.experimentation.experiments.validate(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.experiments.validate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/experimentation/experiments/id/validate",
      query_params: nil,
      expected: 1
    )
  end
end
