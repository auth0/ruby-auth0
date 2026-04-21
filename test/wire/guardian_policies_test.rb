# frozen_string_literal: true

require_relative "wiremock_test_case"

class GuardianPoliciesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_guardian_policies_list_with_wiremock
    test_id = "guardian.policies.list.0"

    @client.guardian.policies.list(request_options: {
                                     additional_headers: {
                                       "X-Test-Id" => "guardian.policies.list.0"
                                     }
                                   })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/policies",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_policies_set_with_wiremock
    test_id = "guardian.policies.set.0"

    @client.guardian.policies.set(
      request: ["all-applications"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.policies.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/policies",
      query_params: nil,
      expected: 1
    )
  end
end
