# frozen_string_literal: true

require_relative "wiremock_test_case"

class EmailTemplatesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_email_templates_create_with_wiremock
    test_id = "email_templates.create.0"

    @client.email_templates.create(
      template: "verify_email",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "email_templates.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/email-templates",
      query_params: nil,
      expected: 1
    )
  end

  def test_email_templates_get_with_wiremock
    test_id = "email_templates.get.0"

    @client.email_templates.get(
      template_name: "verify_email",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "email_templates.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/email-templates/verify_email",
      query_params: nil,
      expected: 1
    )
  end

  def test_email_templates_set_with_wiremock
    test_id = "email_templates.set.0"

    @client.email_templates.set(
      template_name: "verify_email",
      template: "verify_email",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "email_templates.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/email-templates/verify_email",
      query_params: nil,
      expected: 1
    )
  end

  def test_email_templates_update_with_wiremock
    test_id = "email_templates.update.0"

    @client.email_templates.update(
      template_name: "verify_email",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "email_templates.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/email-templates/verify_email",
      query_params: nil,
      expected: 1
    )
  end
end
