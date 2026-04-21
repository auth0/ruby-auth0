# frozen_string_literal: true

module Auth0
  module Prompts
    module Rendering
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Get render setting configurations for all screens.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :fields
        # @option params [Boolean, nil] :include_fields
        # @option params [Integer, nil] :page
        # @option params [Integer, nil] :per_page
        # @option params [Boolean, nil] :include_totals
        # @option params [String, nil] :prompt
        # @option params [String, nil] :screen
        # @option params [Auth0::Types::AculRenderingModeEnum, nil] :rendering_mode
        #
        # @return [Auth0::Types::ListAculsOffsetPaginatedResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[fields include_fields page per_page include_totals prompt screen rendering_mode]
          query_params = {}
          query_params["fields"] = params[:fields] if params.key?(:fields)
          query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)
          query_params["page"] = params.fetch(:page, 0)
          query_params["per_page"] = params.fetch(:per_page, 50)
          query_params["include_totals"] = params.fetch(:include_totals, true)
          query_params["prompt"] = params[:prompt] if params.key?(:prompt)
          query_params["screen"] = params[:screen] if params.key?(:screen)
          query_params["rendering_mode"] = params[:rendering_mode] if params.key?(:rendering_mode)
          params.except(*query_param_names)

          Auth0::Internal::OffsetItemIterator.new(
            initial_page: query_params["page"],
            item_field: :configs,
            has_next_field: nil,
            step: true
          ) do |next_page|
            query_params["page"] = next_page
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "prompts/rendering",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::ListAculsOffsetPaginatedResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Learn more about <a
        # href='https://auth0.com/docs/customize/login-pages/advanced-customizations/getting-started/configure-acul-screens'>configuring
        # render settings</a> for advanced customization.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Prompts::Rendering::Types::BulkUpdateAculRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Auth0::Types::BulkUpdateAculResponseContent]
        def bulk_update(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "prompts/rendering",
            body: Auth0::Prompts::Rendering::Types::BulkUpdateAculRequestContent.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::BulkUpdateAculResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Get render settings for a screen.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Auth0::Types::PromptGroupNameEnum] :prompt
        # @option params [Auth0::Types::ScreenGroupNameEnum] :screen
        #
        # @return [Auth0::Types::GetAculResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "prompts/#{URI.encode_uri_component(params[:prompt].to_s)}/screen/#{URI.encode_uri_component(params[:screen].to_s)}/rendering",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::GetAculResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Learn more about <a
        # href='https://auth0.com/docs/customize/login-pages/advanced-customizations/getting-started/configure-acul-screens'>configuring
        # render settings</a> for advanced customization.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Prompts::Rendering::Types::UpdateAculRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Auth0::Types::PromptGroupNameEnum] :prompt
        # @option params [Auth0::Types::ScreenGroupNameEnum] :screen
        #
        # @return [Auth0::Types::UpdateAculResponseContent]
        def update(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Prompts::Rendering::Types::UpdateAculRequestContent.new(params).to_h
          non_body_param_names = %w[prompt screen]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "prompts/#{URI.encode_uri_component(params[:prompt].to_s)}/screen/#{URI.encode_uri_component(params[:screen].to_s)}/rendering",
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
            Auth0::Types::UpdateAculResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
