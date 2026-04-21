# frozen_string_literal: true

require_relative "wiremock_test_case"

class EmailsProviderWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_emails_provider_get_with_wiremock
    test_id = "emails.provider.get.0"

    @client.emails.provider.get(
      fields: "fields",
      include_fields: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "emails.provider.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/emails/provider",
      query_params: nil,
      expected: 1
    )
  end

  def test_emails_provider_create_with_wiremock
    test_id = "emails.provider.create.0"

    @client.emails.provider.create(
      name: "mailgun",
      credentials: {
        api_key: "api_key"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "emails.provider.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/emails/provider",
      query_params: nil,
      expected: 1
    )
  end

  def test_emails_provider_delete_with_wiremock
    test_id = "emails.provider.delete.0"

    @client.emails.provider.delete(request_options: {
                                     additional_headers: {
                                       "X-Test-Id" => "emails.provider.delete.0"
                                     }
                                   })

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/emails/provider",
      query_params: nil,
      expected: 1
    )
  end

  def test_emails_provider_update_with_wiremock
    test_id = "emails.provider.update.0"

    @client.emails.provider.update(request_options: {
                                     additional_headers: {
                                       "X-Test-Id" => "emails.provider.update.0"
                                     }
                                   })

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/emails/provider",
      query_params: nil,
      expected: 1
    )
  end
end
