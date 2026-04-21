# frozen_string_literal: true

require_relative "wiremock_test_case"

class ActionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_actions_list_with_wiremock
    test_id = "actions.list.0"

    result = @client.actions.list(
      trigger_id: "post-login",
      action_name: "actionName",
      deployed: true,
      page: 1,
      per_page: 1,
      installed: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/actions/actions",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_create_with_wiremock
    test_id = "actions.create.0"

    @client.actions.create(
      name: "name",
      supported_triggers: [{
        id: "post-login"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/actions/actions",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_get_with_wiremock
    test_id = "actions.get.0"

    @client.actions.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/actions/actions/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_delete_with_wiremock
    test_id = "actions.delete.0"

    @client.actions.delete(
      id: "id",
      force: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/actions/actions/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_update_with_wiremock
    test_id = "actions.update.0"

    @client.actions.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/actions/actions/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_deploy_with_wiremock
    test_id = "actions.deploy.0"

    @client.actions.deploy(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.deploy.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/actions/actions/id/deploy",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_test_with_wiremock
    test_id = "actions.test.0"

    @client.actions.test(
      id: "id",
      payload: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.test.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/actions/actions/id/test",
      query_params: nil,
      expected: 1
    )
  end
end
