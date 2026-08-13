# frozen_string_literal: true

require_relative "wiremock_test_case"

class GuardianEnrollmentsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_guardian_enrollments_create_ticket_with_wiremock
    test_id = "guardian.enrollments.create_ticket.0"

    @client.guardian.enrollments.create_ticket(
      user_id: "user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.enrollments.create_ticket.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/guardian/enrollments/ticket",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_enrollments_get_with_wiremock
    test_id = "guardian.enrollments.get.0"

    @client.guardian.enrollments.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.enrollments.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/guardian/enrollments/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_guardian_enrollments_delete_with_wiremock
    test_id = "guardian.enrollments.delete.0"

    @client.guardian.enrollments.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "guardian.enrollments.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/guardian/enrollments/id",
      query_params: nil,
      expected: 1
    )
  end
end
