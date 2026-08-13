# frozen_string_literal: true

require_relative "wiremock_test_case"

class JobsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_jobs_get_with_wiremock
    test_id = "jobs.get.0"

    @client.jobs.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "jobs.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/jobs/id",
      query_params: nil,
      expected: 1
    )
  end
end
