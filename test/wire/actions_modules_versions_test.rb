# frozen_string_literal: true

require_relative "wiremock_test_case"

class ActionsModulesVersionsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_actions_modules_versions_list_with_wiremock
    test_id = "actions.modules.versions.list.0"

    result = @client.actions.modules.versions.list(
      id: "id",
      page: 1,
      per_page: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.modules.versions.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/actions/modules/id/versions",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_modules_versions_create_with_wiremock
    test_id = "actions.modules.versions.create.0"

    @client.actions.modules.versions.create(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.modules.versions.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/actions/modules/id/versions",
      query_params: nil,
      expected: 1
    )
  end

  def test_actions_modules_versions_get_with_wiremock
    test_id = "actions.modules.versions.get.0"

    @client.actions.modules.versions.get(
      id: "id",
      version_id: "versionId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "actions.modules.versions.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/actions/modules/id/versions/versionId",
      query_params: nil,
      expected: 1
    )
  end
end
