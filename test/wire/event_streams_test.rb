# frozen_string_literal: true

require_relative "wiremock_test_case"

class EventStreamsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_event_streams_list_with_wiremock
    test_id = "event_streams.list.0"

    result = @client.event_streams.list(
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "event_streams.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/event-streams",
      query_params: nil,
      expected: 1
    )
  end

  def test_event_streams_create_with_wiremock
    test_id = "event_streams.create.0"

    @client.event_streams.create(
      destination: {
        type: "webhook",
        configuration: {
          webhook_endpoint: "webhook_endpoint",
          webhook_authorization: {
            method_: "basic",
            username: "username"
          }
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "event_streams.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/event-streams",
      query_params: nil,
      expected: 1
    )
  end

  def test_event_streams_get_with_wiremock
    test_id = "event_streams.get.0"

    @client.event_streams.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "event_streams.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/event-streams/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_event_streams_delete_with_wiremock
    test_id = "event_streams.delete.0"

    @client.event_streams.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "event_streams.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/event-streams/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_event_streams_update_with_wiremock
    test_id = "event_streams.update.0"

    @client.event_streams.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "event_streams.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/event-streams/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_event_streams_test_with_wiremock
    test_id = "event_streams.test.0"

    @client.event_streams.test(
      id: "id",
      event_type: "group.created",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "event_streams.test.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/event-streams/id/test",
      query_params: nil,
      expected: 1
    )
  end
end
