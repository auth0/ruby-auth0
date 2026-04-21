# frozen_string_literal: true

require_relative "wiremock_test_case"

class FlowsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_flows_list_with_wiremock
    test_id = "flows.list.0"

    result = @client.flows.list(
      page: 1,
      per_page: 1,
      include_totals: true,
      synchronous: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/flows",
      query_params: nil,
      expected: 1
    )
  end

  def test_flows_create_with_wiremock
    test_id = "flows.create.0"

    @client.flows.create(
      name: "name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/flows",
      query_params: nil,
      expected: 1
    )
  end

  def test_flows_get_with_wiremock
    test_id = "flows.get.0"

    @client.flows.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/flows/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_flows_delete_with_wiremock
    test_id = "flows.delete.0"

    @client.flows.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/flows/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_flows_update_with_wiremock
    test_id = "flows.update.0"

    @client.flows.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "flows.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/flows/id",
      query_params: nil,
      expected: 1
    )
  end
end
