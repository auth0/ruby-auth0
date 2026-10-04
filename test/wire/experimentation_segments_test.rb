# frozen_string_literal: true

require_relative "wiremock_test_case"

class ExperimentationSegmentsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_experimentation_segments_list_with_wiremock
    test_id = "experimentation.segments.list.0"

    result = @client.experimentation.segments.list(
      from: "from",
      take: 1,
      type: "auth0",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.segments.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/experimentation/segments",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_segments_create_with_wiremock
    test_id = "experimentation.segments.create.0"

    @client.experimentation.segments.create(
      name: "name",
      rules: [{}],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.segments.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/experimentation/segments",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_segments_get_with_wiremock
    test_id = "experimentation.segments.get.0"

    @client.experimentation.segments.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.segments.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/experimentation/segments/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_segments_delete_with_wiremock
    test_id = "experimentation.segments.delete.0"

    @client.experimentation.segments.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.segments.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/experimentation/segments/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_experimentation_segments_update_with_wiremock
    test_id = "experimentation.segments.update.0"

    @client.experimentation.segments.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "experimentation.segments.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/experimentation/segments/id",
      query_params: nil,
      expected: 1
    )
  end
end
