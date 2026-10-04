# frozen_string_literal: true

module Auth0
  module Branding
    module Themes
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Create branding theme.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Branding::Themes::Types::CreateBrandingThemeRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.branding.themes.create(
        #     borders: {
        #       button_border_radius: 1.1,
        #       button_border_weight: 1.1,
        #       buttons_style: "pill",
        #       input_border_radius: 1.1,
        #       input_border_weight: 1.1,
        #       inputs_style: "pill",
        #       show_widget_shadow: true,
        #       widget_border_weight: 1.1,
        #       widget_corner_radius: 1.1
        #     },
        #     colors: {
        #       body_text: "body_text",
        #       error: "error",
        #       header: "header",
        #       icons: "icons",
        #       input_background: "input_background",
        #       input_border: "input_border",
        #       input_filled_text: "input_filled_text",
        #       input_labels_placeholders: "input_labels_placeholders",
        #       links_focused_components: "links_focused_components",
        #       primary_button: "primary_button",
        #       primary_button_label: "primary_button_label",
        #       secondary_button_border: "secondary_button_border",
        #       secondary_button_label: "secondary_button_label",
        #       success: "success",
        #       widget_background: "widget_background",
        #       widget_border: "widget_border"
        #     },
        #     fonts: {
        #       body_text: {
        #         bold: true,
        #         size: 1.1
        #       },
        #       buttons_text: {
        #         bold: true,
        #         size: 1.1
        #       },
        #       font_url: "font_url",
        #       input_labels: {
        #         bold: true,
        #         size: 1.1
        #       },
        #       links: {
        #         bold: true,
        #         size: 1.1
        #       },
        #       links_style: "normal",
        #       reference_text_size: 1.1,
        #       subtitle: {
        #         bold: true,
        #         size: 1.1
        #       },
        #       title: {
        #         bold: true,
        #         size: 1.1
        #       }
        #     },
        #     page_background: {
        #       background_color: "background_color",
        #       background_image_url: "background_image_url",
        #       page_layout: "center"
        #     },
        #     widget: {
        #       header_text_alignment: "center",
        #       logo_height: 1.1,
        #       logo_position: "center",
        #       logo_url: "logo_url",
        #       social_buttons_layout: "bottom"
        #     }
        #   )
        #
        # @return [Auth0::Types::CreateBrandingThemeResponseContent]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "branding/themes",
            body: Auth0::Branding::Themes::Types::CreateBrandingThemeRequestContent.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::CreateBrandingThemeResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve default branding theme.
        #
        # @param request_options [Hash]
        # @param _params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.branding.themes.get_default
        #
        # @return [Auth0::Types::GetBrandingDefaultThemeResponseContent]
        def get_default(request_options: {}, **_params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "branding/themes/default",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::GetBrandingDefaultThemeResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve branding theme.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :theme_id
        #
        # @example
        #   client.branding.themes.get(theme_id: "themeId")
        #
        # @return [Auth0::Types::GetBrandingThemeResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "branding/themes/#{URI.encode_uri_component(params[:theme_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::GetBrandingThemeResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Delete branding theme.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :theme_id
        #
        # @example
        #   client.branding.themes.delete(theme_id: "themeId")
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "branding/themes/#{URI.encode_uri_component(params[:theme_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end

        # Update branding theme.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Branding::Themes::Types::UpdateBrandingThemeRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :theme_id
        #
        # @example
        #   client.branding.themes.update(
        #     theme_id: "themeId",
        #     borders: {
        #       button_border_radius: 1.1,
        #       button_border_weight: 1.1,
        #       buttons_style: "pill",
        #       input_border_radius: 1.1,
        #       input_border_weight: 1.1,
        #       inputs_style: "pill",
        #       show_widget_shadow: true,
        #       widget_border_weight: 1.1,
        #       widget_corner_radius: 1.1
        #     },
        #     colors: {
        #       body_text: "body_text",
        #       error: "error",
        #       header: "header",
        #       icons: "icons",
        #       input_background: "input_background",
        #       input_border: "input_border",
        #       input_filled_text: "input_filled_text",
        #       input_labels_placeholders: "input_labels_placeholders",
        #       links_focused_components: "links_focused_components",
        #       primary_button: "primary_button",
        #       primary_button_label: "primary_button_label",
        #       secondary_button_border: "secondary_button_border",
        #       secondary_button_label: "secondary_button_label",
        #       success: "success",
        #       widget_background: "widget_background",
        #       widget_border: "widget_border"
        #     },
        #     fonts: {
        #       body_text: {
        #         bold: true,
        #         size: 1.1
        #       },
        #       buttons_text: {
        #         bold: true,
        #         size: 1.1
        #       },
        #       font_url: "font_url",
        #       input_labels: {
        #         bold: true,
        #         size: 1.1
        #       },
        #       links: {
        #         bold: true,
        #         size: 1.1
        #       },
        #       links_style: "normal",
        #       reference_text_size: 1.1,
        #       subtitle: {
        #         bold: true,
        #         size: 1.1
        #       },
        #       title: {
        #         bold: true,
        #         size: 1.1
        #       }
        #     },
        #     page_background: {
        #       background_color: "background_color",
        #       background_image_url: "background_image_url",
        #       page_layout: "center"
        #     },
        #     widget: {
        #       header_text_alignment: "center",
        #       logo_height: 1.1,
        #       logo_position: "center",
        #       logo_url: "logo_url",
        #       social_buttons_layout: "bottom"
        #     }
        #   )
        #
        # @return [Auth0::Types::UpdateBrandingThemeResponseContent]
        def update(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Branding::Themes::Types::UpdateBrandingThemeRequestContent.new(params).to_h
          non_body_param_names = %w[themeId]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "branding/themes/#{URI.encode_uri_component(params[:theme_id].to_s)}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::UpdateBrandingThemeResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
