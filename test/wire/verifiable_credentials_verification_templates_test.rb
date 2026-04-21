# frozen_string_literal: true

require_relative "wiremock_test_case"

class VerifiableCredentialsVerificationTemplatesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_verifiable_credentials_verification_templates_list_with_wiremock
    test_id = "verifiable_credentials.verification.templates.list.0"

    result = @client.verifiable_credentials.verification.templates.list(
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "verifiable_credentials.verification.templates.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/verifiable-credentials/verification/templates",
      query_params: nil,
      expected: 1
    )
  end

  def test_verifiable_credentials_verification_templates_create_with_wiremock
    test_id = "verifiable_credentials.verification.templates.create.0"

    @client.verifiable_credentials.verification.templates.create(
      name: "name",
      type: "type",
      dialect: "dialect",
      presentation: {
        org_iso1801351m_dl: {
          org_iso1801351: {}
        }
      },
      well_known_trusted_issuers: "well_known_trusted_issuers",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "verifiable_credentials.verification.templates.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/verifiable-credentials/verification/templates",
      query_params: nil,
      expected: 1
    )
  end

  def test_verifiable_credentials_verification_templates_get_with_wiremock
    test_id = "verifiable_credentials.verification.templates.get.0"

    @client.verifiable_credentials.verification.templates.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "verifiable_credentials.verification.templates.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/verifiable-credentials/verification/templates/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_verifiable_credentials_verification_templates_delete_with_wiremock
    test_id = "verifiable_credentials.verification.templates.delete.0"

    @client.verifiable_credentials.verification.templates.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "verifiable_credentials.verification.templates.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/verifiable-credentials/verification/templates/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_verifiable_credentials_verification_templates_update_with_wiremock
    test_id = "verifiable_credentials.verification.templates.update.0"

    @client.verifiable_credentials.verification.templates.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "verifiable_credentials.verification.templates.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/verifiable-credentials/verification/templates/id",
      query_params: nil,
      expected: 1
    )
  end
end
