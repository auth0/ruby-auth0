# frozen_string_literal: true

require_relative "wiremock_test_case"

class DeviceCredentialsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_device_credentials_list_with_wiremock
    test_id = "device_credentials.list.0"

    result = @client.device_credentials.list(
      page: 1,
      per_page: 1,
      include_totals: true,
      fields: "fields",
      include_fields: true,
      user_id: "user_id",
      client_id: "client_id",
      type: "public_key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "device_credentials.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/device-credentials",
      query_params: nil,
      expected: 1
    )
  end

  def test_device_credentials_create_public_key_with_wiremock
    test_id = "device_credentials.create_public_key.0"

    @client.device_credentials.create_public_key(
      device_name: "device_name",
      type: "public_key",
      value: "value",
      device_id: "device_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "device_credentials.create_public_key.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/device-credentials",
      query_params: nil,
      expected: 1
    )
  end

  def test_device_credentials_delete_with_wiremock
    test_id = "device_credentials.delete.0"

    @client.device_credentials.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "device_credentials.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/device-credentials/id",
      query_params: nil,
      expected: 1
    )
  end
end
