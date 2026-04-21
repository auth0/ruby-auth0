# frozen_string_literal: true

require_relative "wiremock_test_case"

class JobsUsersImportsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_jobs_users_imports_create_with_wiremock
    test_id = "jobs.users_imports.create.0"

    @client.jobs.users_imports.create(request_options: {
                                        additional_headers: {
                                          "X-Test-Id" => "jobs.users_imports.create.0"
                                        }
                                      })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/jobs/users-imports",
      query_params: nil,
      expected: 1
    )
  end
end
