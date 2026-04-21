# frozen_string_literal: true

require_relative "wiremock_test_case"

class KeysSigningWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_keys_signing_list_with_wiremock
    test_id = "keys.signing.list.0"

    @client.keys.signing.list(request_options: {
                                additional_headers: {
                                  "X-Test-Id" => "keys.signing.list.0"
                                }
                              })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/keys/signing",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_signing_rotate_with_wiremock
    test_id = "keys.signing.rotate.0"

    @client.keys.signing.rotate(request_options: {
                                  additional_headers: {
                                    "X-Test-Id" => "keys.signing.rotate.0"
                                  }
                                })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/keys/signing/rotate",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_signing_get_with_wiremock
    test_id = "keys.signing.get.0"

    @client.keys.signing.get(
      kid: "kid",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "keys.signing.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/keys/signing/kid",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_signing_revoke_with_wiremock
    test_id = "keys.signing.revoke.0"

    @client.keys.signing.revoke(
      kid: "kid",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "keys.signing.revoke.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/keys/signing/kid/revoke",
      query_params: nil,
      expected: 1
    )
  end
end
