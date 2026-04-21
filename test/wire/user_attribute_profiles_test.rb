# frozen_string_literal: true

require_relative "wiremock_test_case"

class UserAttributeProfilesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_user_attribute_profiles_list_with_wiremock
    test_id = "user_attribute_profiles.list.0"

    result = @client.user_attribute_profiles.list(
      from: "from",
      take: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_attribute_profiles.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/user-attribute-profiles",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_attribute_profiles_create_with_wiremock
    test_id = "user_attribute_profiles.create.0"

    @client.user_attribute_profiles.create(
      name: "name",
      user_attributes: {
        key: {
          description: "description",
          label: "label",
          profile_required: true,
          auth0mapping: "auth0_mapping"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_attribute_profiles.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user-attribute-profiles",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_attribute_profiles_list_templates_with_wiremock
    test_id = "user_attribute_profiles.list_templates.0"

    @client.user_attribute_profiles.list_templates(request_options: {
                                                     additional_headers: {
                                                       "X-Test-Id" => "user_attribute_profiles.list_templates.0"
                                                     }
                                                   })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/user-attribute-profiles/templates",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_attribute_profiles_get_template_with_wiremock
    test_id = "user_attribute_profiles.get_template.0"

    @client.user_attribute_profiles.get_template(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_attribute_profiles.get_template.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/user-attribute-profiles/templates/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_attribute_profiles_get_with_wiremock
    test_id = "user_attribute_profiles.get.0"

    @client.user_attribute_profiles.get(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_attribute_profiles.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/user-attribute-profiles/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_attribute_profiles_delete_with_wiremock
    test_id = "user_attribute_profiles.delete.0"

    @client.user_attribute_profiles.delete(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_attribute_profiles.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/user-attribute-profiles/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_attribute_profiles_update_with_wiremock
    test_id = "user_attribute_profiles.update.0"

    @client.user_attribute_profiles.update(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user_attribute_profiles.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/user-attribute-profiles/id",
      query_params: nil,
      expected: 1
    )
  end
end
