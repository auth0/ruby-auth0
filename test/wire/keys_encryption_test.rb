# frozen_string_literal: true

require_relative "wiremock_test_case"

class KeysEncryptionWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_keys_encryption_list_with_wiremock
    test_id = "keys.encryption.list.0"

    result = @client.keys.encryption.list(
      page: 1,
      per_page: 1,
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "keys.encryption.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/keys/encryption",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_encryption_create_with_wiremock
    test_id = "keys.encryption.create.0"

    @client.keys.encryption.create(
      type: "customer-provided-root-key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "keys.encryption.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/keys/encryption",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_encryption_rekey_with_wiremock
    test_id = "keys.encryption.rekey.0"

    @client.keys.encryption.rekey(request_options: {
                                    additional_headers: {
                                      "X-Test-Id" => "keys.encryption.rekey.0"
                                    }
                                  })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/keys/encryption/rekey",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_encryption_get_with_wiremock
    test_id = "keys.encryption.get.0"

    @client.keys.encryption.get(
      kid: "kid",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "keys.encryption.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/keys/encryption/kid",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_encryption_import_with_wiremock
    test_id = "keys.encryption.import.0"

    @client.keys.encryption.import(
      kid: "kid",
      wrapped_key: "wrapped_key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "keys.encryption.import.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/keys/encryption/kid",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_encryption_delete_with_wiremock
    test_id = "keys.encryption.delete.0"

    @client.keys.encryption.delete(
      kid: "kid",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "keys.encryption.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/keys/encryption/kid",
      query_params: nil,
      expected: 1
    )
  end

  def test_keys_encryption_create_public_wrapping_key_with_wiremock
    test_id = "keys.encryption.create_public_wrapping_key.0"

    @client.keys.encryption.create_public_wrapping_key(
      kid: "kid",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "keys.encryption.create_public_wrapping_key.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/keys/encryption/kid/wrapping-key",
      query_params: nil,
      expected: 1
    )
  end
end
