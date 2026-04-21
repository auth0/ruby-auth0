# frozen_string_literal: true

require_relative "wiremock_test_case"

class KeysCustomSigningWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_keys_custom_signing_get_with_wiremock
    test_id = "keys.custom_signing.get.0"

    @client.keys.custom_signing.get(request_options: {
                                      additional_headers: {
                                        "X-Test-Id" => "keys.custom_signing.get.0"
                                      }
                                    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/keys/custom-signing",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_custom_signing_set_with_wiremock
    test_id = "keys.custom_signing.set.0"

    @client.keys.custom_signing.set(
      keys: [{
        kty: "EC"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "keys.custom_signing.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/keys/custom-signing",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_custom_signing_delete_with_wiremock
    test_id = "keys.custom_signing.delete.0"

    @client.keys.custom_signing.delete(request_options: {
                                         additional_headers: {
                                           "X-Test-Id" => "keys.custom_signing.delete.0"
                                         }
                                       })

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/keys/custom-signing",
      query_params: nil,
      expected: 1
    )
  end
end
