# frozen_string_literal: true

require_relative "wiremock_test_case"

class BrandingTemplatesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_branding_templates_get_universal_login_with_wiremock
    test_id = "branding.templates.get_universal_login.0"

    @client.branding.templates.get_universal_login(request_options: {
                                                     additional_headers: {
                                                       "X-Test-Id" => "branding.templates.get_universal_login.0"
                                                     }
                                                   })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/branding/templates/universal-login",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_templates_update_universal_login_with_wiremock
    test_id = "branding.templates.update_universal_login.0"

    @client.branding.templates.update_universal_login(
      request: "string",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.templates.update_universal_login.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/branding/templates/universal-login",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_templates_delete_universal_login_with_wiremock
    test_id = "branding.templates.delete_universal_login.0"

    @client.branding.templates.delete_universal_login(request_options: {
                                                        additional_headers: {
                                                          "X-Test-Id" => "branding.templates.delete_universal_login.0"
                                                        }
                                                      })

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/branding/templates/universal-login",
      query_params: nil,
      expected: 1
    )
  end
end
