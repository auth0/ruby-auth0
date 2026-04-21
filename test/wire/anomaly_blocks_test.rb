# frozen_string_literal: true

require_relative "wiremock_test_case"

class AnomalyBlocksWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_anomaly_blocks_check_ip_with_wiremock
    test_id = "anomaly.blocks.check_ip.0"

    @client.anomaly.blocks.check_ip(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "anomaly.blocks.check_ip.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/anomaly/blocks/ips/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_anomaly_blocks_unblock_ip_with_wiremock
    test_id = "anomaly.blocks.unblock_ip.0"

    @client.anomaly.blocks.unblock_ip(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "anomaly.blocks.unblock_ip.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/anomaly/blocks/ips/id",
      query_params: nil,
      expected: 1
    )
  end
end
