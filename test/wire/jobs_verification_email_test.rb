# frozen_string_literal: true

require_relative "wiremock_test_case"

class JobsVerificationEmailWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_jobs_verification_email_create_with_wiremock
    test_id = "jobs.verification_email.create.0"

    @client.jobs.verification_email.create(
      user_id: "user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "jobs.verification_email.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/jobs/verification-email",
      query_params: nil,
      expected: 1
    )
  end
end
