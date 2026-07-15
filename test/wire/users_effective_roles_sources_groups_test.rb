# frozen_string_literal: true

require_relative "wiremock_test_case"

class UsersEffectiveRolesSourcesGroupsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_users_effective_roles_sources_groups_list_with_wiremock
    test_id = "users.effective_roles.sources.groups.list.0"

    result = @client.users.effective_roles.sources.groups.list(
      id: "id",
      role_id: "role_id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "users.effective_roles.sources.groups.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/users/id/effective-roles/sources/groups",
      query_params: { "role_id" => "role_id" },
      expected: 1
    )
  end
end
