# frozen_string_literal: true

require_relative "wiremock_test_case"

class BrandingWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_branding_get_with_wiremock
    test_id = "branding.get.0"

    @client.branding.get(request_options: {
                           additional_headers: {
                             "X-Test-Id" => "branding.get.0"
                           }
                         })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/branding",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_update_with_wiremock
    test_id = "branding.update.0"

    @client.branding.update(request_options: {
                              additional_headers: {
                                "X-Test-Id" => "branding.update.0"
                              }
                            })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/branding",
      query_params: nil,
      expected: 1
    )
  end
end
