# frozen_string_literal: true

require_relative "wiremock_test_case"

class ActionsTriggersBindingsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_actions_triggers_bindings_list_with_wiremock
    test_id = "actions.triggers.bindings.list.0"

    result = @client.actions.triggers.bindings.list(
      trigger_id: "post-login",
      page: 1,
      per_page: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.triggers.bindings.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/actions/triggers/post-login/bindings",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_triggers_bindings_update_many_with_wiremock
    test_id = "actions.triggers.bindings.update_many.0"

    @client.actions.triggers.bindings.update_many(
      trigger_id: "post-login",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.triggers.bindings.update_many.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/actions/triggers/post-login/bindings",
      query_params: nil,
      expected: 1
    )
  end
end
