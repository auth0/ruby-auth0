# frozen_string_literal: true

require_relative "wiremock_test_case"

class GuardianFactorsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_guardian_factors_list_with_wiremock
    test_id = "guardian.factors.list.0"

    @client.guardian.factors.list(request_options: {
                                    additional_headers: {
                                      "X-Test-Id" => "guardian.factors.list.0"
                                    }
                                  })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/factors",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_factors_set_with_wiremock
    test_id = "guardian.factors.set.0"

    @client.guardian.factors.set(
      name: "push-notification",
      enabled: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.factors.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/guardian/factors/push-notification",
      query_params: nil,
      expected: 1
    )
  end
end
