# frozen_string_literal: true

require_relative "wiremock_test_case"

class ActionsVersionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_actions_versions_list_with_wiremock
    test_id = "actions.versions.list.0"

    result = @client.actions.versions.list(
      action_id: "actionId",
      page: 1,
      per_page: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.versions.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/actions/actions/actionId/versions",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_versions_get_with_wiremock
    test_id = "actions.versions.get.0"

    @client.actions.versions.get(
      action_id: "actionId",
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.versions.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/actions/actions/actionId/versions/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_versions_deploy_with_wiremock
    test_id = "actions.versions.deploy.0"

    @client.actions.versions.deploy(
      action_id: "actionId",
      id: "id",
      request: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.versions.deploy.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/actions/actions/actionId/versions/id/deploy",
      query_params: nil,
      expected: 1
    )
  end
end
