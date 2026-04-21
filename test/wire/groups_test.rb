# frozen_string_literal: true

require_relative "wiremock_test_case"

class GroupsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_groups_list_with_wiremock
    test_id = "groups.list.0"

    result = @client.groups.list(
      connection_id: "connection_id",
      name: "name",
      external_id: "external_id",
      fields: "fields",
      include_fields: true,
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "groups.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/groups",
      query_params: nil,
      expected: 1
    )
  end

  def test_groups_get_with_wiremock
    test_id = "groups.get.0"

    @client.groups.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "groups.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/groups/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_groups_delete_with_wiremock
    test_id = "groups.delete.0"

    @client.groups.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "groups.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/groups/id",
      query_params: nil,
      expected: 1
    )
  end
end
