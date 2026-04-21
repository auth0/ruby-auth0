# frozen_string_literal: true

require_relative "wiremock_test_case"

class SupplementalSignalsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_supplemental_signals_get_with_wiremock
    test_id = "supplemental_signals.get.0"

    @client.supplemental_signals.get(request_options: {
                                       additional_headers: {
                                         "X-Test-Id" => "supplemental_signals.get.0"
                                       }
                                     })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/supplemental-signals",
      query_params: nil,
      expected: 1
    )
  end

  def test_supplemental_signals_patch_with_wiremock
    test_id = "supplemental_signals.patch.0"

    @client.supplemental_signals.patch(
      akamai_enabled: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "supplemental_signals.patch.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/supplemental-signals",
      query_params: nil,
      expected: 1
    )
  end
end
