# frozen_string_literal: true

require_relative "wiremock_test_case"

class ActionsModulesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_actions_modules_list_with_wiremock
    test_id = "actions.modules.list.0"

    result = @client.actions.modules.list(
      page: 1,
      per_page: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.modules.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/actions/modules",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_modules_create_with_wiremock
    test_id = "actions.modules.create.0"

    @client.actions.modules.create(
      name: "name",
      code: "code",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.modules.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/actions/modules",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_modules_get_with_wiremock
    test_id = "actions.modules.get.0"

    @client.actions.modules.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.modules.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/actions/modules/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_modules_delete_with_wiremock
    test_id = "actions.modules.delete.0"

    @client.actions.modules.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.modules.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/actions/modules/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_modules_update_with_wiremock
    test_id = "actions.modules.update.0"

    @client.actions.modules.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.modules.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/actions/modules/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_modules_list_actions_with_wiremock
    test_id = "actions.modules.list_actions.0"

    result = @client.actions.modules.list_actions(
      id: "id",
      page: 1,
      per_page: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.modules.list_actions.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/actions/modules/id/actions",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_modules_rollback_with_wiremock
    test_id = "actions.modules.rollback.0"

    @client.actions.modules.rollback(
      id: "id",
      module_version_id: "module_version_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.modules.rollback.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/actions/modules/id/rollback",
      query_params: nil,
      expected: 1
    )
  end
end
