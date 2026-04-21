# frozen_string_literal: true

require_relative "wiremock_test_case"

class TicketsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_tickets_verify_email_with_wiremock
    test_id = "tickets.verify_email.0"

    @client.tickets.verify_email(
      user_id: "user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tickets.verify_email.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/tickets/email-verification",
      query_params: nil,
      expected: 1
    )
  end

  def test_tickets_change_password_with_wiremock
    test_id = "tickets.change_password.0"

    @client.tickets.change_password(request_options: {
                                      additional_headers: {
                                        "X-Test-Id" => "tickets.change_password.0"
                                      }
                                    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/tickets/password-change",
      query_params: nil,
      expected: 1
    )
  end
end
