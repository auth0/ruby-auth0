# frozen_string_literal: true

require_relative "wiremock_test_case"

class ActionsTriggersWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_actions_triggers_list_with_wiremock
    test_id = "actions.triggers.list.0"

    @client.actions.triggers.list(request_options: {
                                    additional_headers: {
                                      "X-Test-Id" => "actions.triggers.list.0"
                                    }
                                  })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/actions/triggers",
      query_params: nil,
      expected: 1
    )
  end
end
