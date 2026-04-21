# frozen_string_literal: true

require_relative "wiremock_test_case"

class StatsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_stats_get_active_users_count_with_wiremock
    test_id = "stats.get_active_users_count.0"

    @client.stats.get_active_users_count(request_options: {
                                           additional_headers: {
                                             "X-Test-Id" => "stats.get_active_users_count.0"
                                           }
                                         })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/stats/active-users",
      query_params: nil,
      expected: 1
    )
  end

  def test_stats_get_daily_with_wiremock
    test_id = "stats.get_daily.0"

    @client.stats.get_daily(
      from: "from",
      to: "to",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "stats.get_daily.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/stats/daily",
      query_params: nil,
      expected: 1
    )
  end
end
