# frozen_string_literal: true

require_relative "wiremock_test_case"

class EventStreamsRedeliveriesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_event_streams_redeliveries_create_with_wiremock
    test_id = "event_streams.redeliveries.create.0"

    @client.event_streams.redeliveries.create(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "event_streams.redeliveries.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/event-streams/id/redeliver",
      query_params: nil,
      expected: 1
    )
  end

  def test_event_streams_redeliveries_create_by_id_with_wiremock
    test_id = "event_streams.redeliveries.create_by_id.0"

    @client.event_streams.redeliveries.create_by_id(
      id: "id",
      event_id: "event_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "event_streams.redeliveries.create_by_id.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/event-streams/id/redeliver/event_id",
      query_params: nil,
      expected: 1
    )
  end
end
