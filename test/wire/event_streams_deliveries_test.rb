# frozen_string_literal: true

require_relative "wiremock_test_case"

class EventStreamsDeliveriesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_event_streams_deliveries_list_with_wiremock
    test_id = "event_streams.deliveries.list.0"

    @client.event_streams.deliveries.list(
      id: "id",
      statuses: "statuses",
      event_types: "event_types",
      date_from: "date_from",
      date_to: "date_to",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "event_streams.deliveries.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/event-streams/id/deliveries",
      query_params: nil,
      expected: 1
    )
  end

  def test_event_streams_deliveries_get_history_with_wiremock
    test_id = "event_streams.deliveries.get_history.0"

    @client.event_streams.deliveries.get_history(
      id: "id",
      event_id: "event_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "event_streams.deliveries.get_history.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/event-streams/id/deliveries/event_id",
      query_params: nil,
      expected: 1
    )
  end
end
