# frozen_string_literal: true

require_relative "wiremock_test_case"

class AgentsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_agents_list_with_wiremock
    test_id = "agents.list.0"

    result = @client.agents.list(
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "agents.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/agents",
      query_params: nil,
      expected: 1
    )
  end

  def test_agents_create_with_wiremock
    test_id = "agents.create.0"

    @client.agents.create(
      name: "name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "agents.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/agents",
      query_params: nil,
      expected: 1
    )
  end

  def test_agents_read_with_wiremock
    test_id = "agents.read.0"

    @client.agents.read(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "agents.read.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/agents/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_agents_delete_with_wiremock
    test_id = "agents.delete.0"

    @client.agents.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "agents.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/agents/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_agents_update_with_wiremock
    test_id = "agents.update.0"

    @client.agents.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "agents.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/agents/id",
      query_params: nil,
      expected: 1
    )
  end
end
