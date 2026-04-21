# frozen_string_literal: true

require_relative "wiremock_test_case"

class ConnectionsDirectoryProvisioningSynchronizationsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_connections_directory_provisioning_synchronizations_create_with_wiremock
    test_id = "connections.directory_provisioning.synchronizations.create.0"

    @client.connections.directory_provisioning.synchronizations.create(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "connections.directory_provisioning.synchronizations.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/connections/id/directory-provisioning/synchronizations",
      query_params: nil,
      expected: 1
    )
  end
end
