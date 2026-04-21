# frozen_string_literal: true

require_relative "wiremock_test_case"

class FormsWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_forms_list_with_wiremock
    test_id = "forms.list.0"

    result = @client.forms.list(
      page: 1,
      per_page: 1,
      include_totals: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "forms.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/forms",
      query_params: nil,
      expected: 1
    )
  end

  def test_forms_create_with_wiremock
    test_id = "forms.create.0"

    @client.forms.create(
      name: "name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "forms.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/forms",
      query_params: nil,
      expected: 1
    )
  end

  def test_forms_get_with_wiremock
    test_id = "forms.get.0"

    @client.forms.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "forms.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/forms/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_forms_delete_with_wiremock
    test_id = "forms.delete.0"

    @client.forms.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "forms.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/forms/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_forms_update_with_wiremock
    test_id = "forms.update.0"

    @client.forms.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "forms.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/forms/id",
      query_params: nil,
      expected: 1
    )
  end
end
