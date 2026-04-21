# frozen_string_literal: true

require_relative "wiremock_test_case"

class BrandingThemesWireTest < WireMockTestCase
  def setup
    super

    @client = Auth0::Management.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_branding_themes_create_with_wiremock
    test_id = "branding.themes.create.0"

    @client.branding.themes.create(
      borders: {
        button_border_radius: 1.1,
        button_border_weight: 1.1,
        buttons_style: "pill",
        input_border_radius: 1.1,
        input_border_weight: 1.1,
        inputs_style: "pill",
        show_widget_shadow: true,
        widget_border_weight: 1.1,
        widget_corner_radius: 1.1
      },
      colors: {
        body_text: "body_text",
        error: "error",
        header: "header",
        icons: "icons",
        input_background: "input_background",
        input_border: "input_border",
        input_filled_text: "input_filled_text",
        input_labels_placeholders: "input_labels_placeholders",
        links_focused_components: "links_focused_components",
        primary_button: "primary_button",
        primary_button_label: "primary_button_label",
        secondary_button_border: "secondary_button_border",
        secondary_button_label: "secondary_button_label",
        success: "success",
        widget_background: "widget_background",
        widget_border: "widget_border"
      },
      fonts: {
        body_text: {
          bold: true,
          size: 1.1
        },
        buttons_text: {
          bold: true,
          size: 1.1
        },
        font_url: "font_url",
        input_labels: {
          bold: true,
          size: 1.1
        },
        links: {
          bold: true,
          size: 1.1
        },
        links_style: "normal",
        reference_text_size: 1.1,
        subtitle: {
          bold: true,
          size: 1.1
        },
        title: {
          bold: true,
          size: 1.1
        }
      },
      page_background: {
        background_color: "background_color",
        background_image_url: "background_image_url",
        page_layout: "center"
      },
      widget: {
        header_text_alignment: "center",
        logo_height: 1.1,
        logo_position: "center",
        logo_url: "logo_url",
        social_buttons_layout: "bottom"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.themes.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/branding/themes",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_themes_get_default_with_wiremock
    test_id = "branding.themes.get_default.0"

    @client.branding.themes.get_default(request_options: {
                                          additional_headers: {
                                            "X-Test-Id" => "branding.themes.get_default.0"
                                          }
                                        })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/branding/themes/default",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_themes_get_with_wiremock
    test_id = "branding.themes.get.0"

    @client.branding.themes.get(
      theme_id: "themeId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.themes.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/branding/themes/themeId",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_themes_delete_with_wiremock
    test_id = "branding.themes.delete.0"

    @client.branding.themes.delete(
      theme_id: "themeId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.themes.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/branding/themes/themeId",
      query_params: nil,
      expected: 1
    )
  end

  def test_branding_themes_update_with_wiremock
    test_id = "branding.themes.update.0"

    @client.branding.themes.update(
      theme_id: "themeId",
      borders: {
        button_border_radius: 1.1,
        button_border_weight: 1.1,
        buttons_style: "pill",
        input_border_radius: 1.1,
        input_border_weight: 1.1,
        inputs_style: "pill",
        show_widget_shadow: true,
        widget_border_weight: 1.1,
        widget_corner_radius: 1.1
      },
      colors: {
        body_text: "body_text",
        error: "error",
        header: "header",
        icons: "icons",
        input_background: "input_background",
        input_border: "input_border",
        input_filled_text: "input_filled_text",
        input_labels_placeholders: "input_labels_placeholders",
        links_focused_components: "links_focused_components",
        primary_button: "primary_button",
        primary_button_label: "primary_button_label",
        secondary_button_border: "secondary_button_border",
        secondary_button_label: "secondary_button_label",
        success: "success",
        widget_background: "widget_background",
        widget_border: "widget_border"
      },
      fonts: {
        body_text: {
          bold: true,
          size: 1.1
        },
        buttons_text: {
          bold: true,
          size: 1.1
        },
        font_url: "font_url",
        input_labels: {
          bold: true,
          size: 1.1
        },
        links: {
          bold: true,
          size: 1.1
        },
        links_style: "normal",
        reference_text_size: 1.1,
        subtitle: {
          bold: true,
          size: 1.1
        },
        title: {
          bold: true,
          size: 1.1
        }
      },
      page_background: {
        background_color: "background_color",
        background_image_url: "background_image_url",
        page_layout: "center"
      },
      widget: {
        header_text_alignment: "center",
        logo_height: 1.1,
        logo_position: "center",
        logo_url: "logo_url",
        social_buttons_layout: "bottom"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "branding.themes.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/branding/themes/themeId",
      query_params: nil,
      expected: 1
    )
  end
end
