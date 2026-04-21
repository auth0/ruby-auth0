# frozen_string_literal: true

require_relative "wiremock_test_case"

class BrandingPhoneProvidersWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_branding_phone_providers_list_with_wiremock
    test_id = "branding.phone.providers.list.0"

    @client.branding.phone.providers.list(
      disabled: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.phone.providers.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/branding/phone/providers",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_phone_providers_create_with_wiremock
    test_id = "branding.phone.providers.create.0"

    @client.branding.phone.providers.create(
      name: "twilio",
      credentials: {
        auth_token: "auth_token"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.phone.providers.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/branding/phone/providers",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_phone_providers_get_with_wiremock
    test_id = "branding.phone.providers.get.0"

    @client.branding.phone.providers.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.phone.providers.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/branding/phone/providers/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_phone_providers_delete_with_wiremock
    test_id = "branding.phone.providers.delete.0"

    @client.branding.phone.providers.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.phone.providers.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/branding/phone/providers/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_phone_providers_update_with_wiremock
    test_id = "branding.phone.providers.update.0"

    @client.branding.phone.providers.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.phone.providers.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/branding/phone/providers/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_phone_providers_test_with_wiremock
    test_id = "branding.phone.providers.test.0"

    @client.branding.phone.providers.test(
      id: "id",
      to: "to",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.phone.providers.test.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/branding/phone/providers/id/try",
      query_params: nil,
      expected: 1
    )
  end
end
