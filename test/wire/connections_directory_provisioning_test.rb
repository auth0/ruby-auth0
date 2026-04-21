# frozen_string_literal: true

require_relative "wiremock_test_case"

class ConnectionsDirectoryProvisioningWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_connections_directory_provisioning_list_with_wiremock
    test_id = "connections.directory_provisioning.list.0"

    result = @client.connections.directory_provisioning.list(
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.directory_provisioning.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections-directory-provisionings",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_directory_provisioning_get_with_wiremock
    test_id = "connections.directory_provisioning.get.0"

    @client.connections.directory_provisioning.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.directory_provisioning.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections/id/directory-provisioning",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_directory_provisioning_create_with_wiremock
    test_id = "connections.directory_provisioning.create.0"

    @client.connections.directory_provisioning.create(
      id: "id",
      request: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.directory_provisioning.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/connections/id/directory-provisioning",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_directory_provisioning_delete_with_wiremock
    test_id = "connections.directory_provisioning.delete.0"

    @client.connections.directory_provisioning.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.directory_provisioning.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/connections/id/directory-provisioning",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_directory_provisioning_update_with_wiremock
    test_id = "connections.directory_provisioning.update.0"

    @client.connections.directory_provisioning.update(
      id: "id",
      request: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.directory_provisioning.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/connections/id/directory-provisioning",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_directory_provisioning_get_default_mapping_with_wiremock
    test_id = "connections.directory_provisioning.get_default_mapping.0"

    @client.connections.directory_provisioning.get_default_mapping(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.directory_provisioning.get_default_mapping.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections/id/directory-provisioning/default-mapping",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_directory_provisioning_list_synchronized_groups_with_wiremock
    test_id = "connections.directory_provisioning.list_synchronized_groups.0"

    result = @client.connections.directory_provisioning.list_synchronized_groups(
      id: "id",
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.directory_provisioning.list_synchronized_groups.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/connections/id/directory-provisioning/synchronized-groups",
      query_params: nil,
      expected: 1
    )
  end

  def test_connections_directory_provisioning_set_with_wiremock
    test_id = "connections.directory_provisioning.set.0"

    @client.connections.directory_provisioning.set(
      id: "id",
      groups: [{
        id: "id"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.directory_provisioning.set.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/connections/id/directory-provisioning/synchronized-groups",
      query_params: nil,
      expected: 1
    )
  end
end
