# frozen_string_literal: true

require_relative "wiremock_test_case"

class SelfServiceProfilesSsoTicketWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_self_service_profiles_sso_ticket_create_with_wiremock
    test_id = "self_service_profiles.sso_ticket.create.0"

    @client.self_service_profiles.sso_ticket.create(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "self_service_profiles.sso_ticket.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/self-service-profiles/id/sso-ticket",
      query_params: nil,
      expected: 1
    )
  end

  def test_self_service_profiles_sso_ticket_revoke_with_wiremock
    test_id = "self_service_profiles.sso_ticket.revoke.0"

    @client.self_service_profiles.sso_ticket.revoke(
      profile_id: "profileId",
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "self_service_profiles.sso_ticket.revoke.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/self-service-profiles/profileId/sso-ticket/id/revoke",
      query_params: nil,
      expected: 1
    )
  end
end
