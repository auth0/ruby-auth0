# frozen_string_literal: true

require_relative "wiremock_test_case"

class BrandingPhoneTemplatesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_branding_phone_templates_list_with_wiremock
    test_id = "branding.phone.templates.list.0"

    @client.branding.phone.templates.list(
      disabled: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.phone.templates.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/branding/phone/templates",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_phone_templates_create_with_wiremock
    test_id = "branding.phone.templates.create.0"

    @client.branding.phone.templates.create(request_options: {
                                              additional_headers: {
                                                "X-Test-Id" => "branding.phone.templates.create.0"
                                              }
                                            })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/branding/phone/templates",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_phone_templates_get_with_wiremock
    test_id = "branding.phone.templates.get.0"

    @client.branding.phone.templates.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.phone.templates.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/branding/phone/templates/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_phone_templates_delete_with_wiremock
    test_id = "branding.phone.templates.delete.0"

    @client.branding.phone.templates.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.phone.templates.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/branding/phone/templates/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_phone_templates_update_with_wiremock
    test_id = "branding.phone.templates.update.0"

    @client.branding.phone.templates.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.phone.templates.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/branding/phone/templates/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_phone_templates_reset_with_wiremock
    test_id = "branding.phone.templates.reset.0"

    @client.branding.phone.templates.reset(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.phone.templates.reset.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/branding/phone/templates/id/reset",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_phone_templates_test_with_wiremock
    test_id = "branding.phone.templates.test.0"

    @client.branding.phone.templates.test(
      id: "id",
      to: "to",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.phone.templates.test.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/branding/phone/templates/id/try",
      query_params: nil,
      expected: 1
    )
  end
end
