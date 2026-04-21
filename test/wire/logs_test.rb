# frozen_string_literal: true

require_relative "wiremock_test_case"

class LogsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_logs_list_with_wiremock
    test_id = "logs.list.0"

    result = @client.logs.list(
      page: 1,
      per_page: 1,
      sort: "sort",
      fields: "fields",
      include_fields: true,
      include_totals: true,
      search: "search",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "logs.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/logs",
      query_params: nil,
      expected: 1
    )
  end

  def test_logs_get_with_wiremock
    test_id = "logs.get.0"

    @client.logs.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "logs.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/logs/id",
      query_params: nil,
      expected: 1
    )
  end
end
