# frozen_string_literal: true

require_relative "wiremock_test_case"

class LogStreamsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_log_streams_list_with_wiremock
    test_id = "log_streams.list.0"

    @client.log_streams.list(request_options: {
                               additional_headers: {
                                 "X-Test-Id" => "log_streams.list.0"
                               }
                             })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/log-streams",
      query_params: nil,
      expected: 1
    )
  end

  def test_log_streams_create_with_wiremock
    test_id = "log_streams.create.0"

    @client.log_streams.create(
      type: "http",
      sink: {
        http_endpoint: "httpEndpoint"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "log_streams.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/log-streams",
      query_params: nil,
      expected: 1
    )
  end

  def test_log_streams_get_with_wiremock
    test_id = "log_streams.get.0"

    @client.log_streams.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "log_streams.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/log-streams/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_log_streams_delete_with_wiremock
    test_id = "log_streams.delete.0"

    @client.log_streams.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "log_streams.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/log-streams/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_log_streams_update_with_wiremock
    test_id = "log_streams.update.0"

    @client.log_streams.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "log_streams.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/log-streams/id",
      query_params: nil,
      expected: 1
    )
  end
end
