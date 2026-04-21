# frozen_string_literal: true

require_relative "wiremock_test_case"

class FlowsExecutionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_flows_executions_list_with_wiremock
    test_id = "flows.executions.list.0"

    result = @client.flows.executions.list(
      flow_id: "flow_id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.executions.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/flows/flow_id/executions",
      query_params: nil,
      expected: 1
    )
  end

  def test_flows_executions_get_with_wiremock
    test_id = "flows.executions.get.0"

    @client.flows.executions.get(
      flow_id: "flow_id",
      execution_id: "execution_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.executions.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/flows/flow_id/executions/execution_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_flows_executions_delete_with_wiremock
    test_id = "flows.executions.delete.0"

    @client.flows.executions.delete(
      flow_id: "flow_id",
      execution_id: "execution_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.executions.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/flows/flow_id/executions/execution_id",
      query_params: nil,
      expected: 1
    )
  end
end
