# frozen_string_literal: true

require_relative "wiremock_test_case"

class TenantsSettingsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_tenants_settings_get_with_wiremock
    test_id = "tenants.settings.get.0"

    @client.tenants.settings.get(
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tenants.settings.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/tenants/settings",
      query_params: nil,
      expected: 1
    )
  end

  def test_tenants_settings_update_with_wiremock
    test_id = "tenants.settings.update.0"

    @client.tenants.settings.update(request_options: {
                                      additional_headers: {
                                        "X-Test-Id" => "tenants.settings.update.0"
                                      }
                                    })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/tenants/settings",
      query_params: nil,
      expected: 1
    )
  end
end
