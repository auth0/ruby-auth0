# frozen_string_literal: true

require_relative "wiremock_test_case"

class EventsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_events_subscribe_with_wiremock
    test_id = "events.subscribe.0"

    @client.events.subscribe(
      from: "from",
      from_timestamp: "from_timestamp",
      event_type: ["connection.created"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "events.subscribe.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/events",
      query_params: nil,
      expected: 1
    )
  end
end
