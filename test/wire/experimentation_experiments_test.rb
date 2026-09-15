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
end
