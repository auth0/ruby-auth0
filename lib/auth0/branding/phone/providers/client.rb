# frozen_string_literal: true

module Auth0
  module Branding
    module Phone
      module Providers
        class Client
          # @param client [Auth0::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # Retrieve a list of <a
          # href="https://auth0.com/docs/customize/phone-messages/configure-phone-messaging-providers">phone
          # providers</a> details set for a Tenant. A list of fields to include or exclude may also be specified.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Boolean, nil] :disabled
          #
          # @return [Auth0::Types::ListBrandingPhoneProvidersResponseContent]
          def list(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[disabled]
            query_params = {}
            query_params["disabled"] = params[:disabled] if params.key?(:disabled)
            params.except(*query_param_names)

            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "branding/phone/providers",
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
              Auth0::Types::ListBrandingPhoneProvidersResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Create a <a href="https://auth0.com/docs/customize/phone-messages/configure-phone-messaging-providers">phone
          # provider</a>.
          # The <code>credentials</code> object requires different properties depending on the phone provider (which is
          # specified using the <code>name</code> property).
          #
          # @param request_options [Hash]
          # @param params [Auth0::Branding::Phone::Providers::Types::CreateBrandingPhoneProviderRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::CreateBrandingPhoneProviderResponseContent]
          def create(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "branding/phone/providers",
              body: Auth0::Branding::Phone::Providers::Types::CreateBrandingPhoneProviderRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::CreateBrandingPhoneProviderResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Retrieve <a href="https://auth0.com/docs/customize/phone-messages/configure-phone-messaging-providers">phone
          # provider</a> details. A list of fields to include or exclude may also be specified.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :id
          #
          # @return [Auth0::Types::GetBrandingPhoneProviderResponseContent]
          def get(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "branding/phone/providers/#{URI.encode_uri_component(params[:id].to_s)}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::GetBrandingPhoneProviderResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Delete the configured phone provider.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :id
          #
          # @return [untyped]
          def delete(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "DELETE",
              path: "branding/phone/providers/#{URI.encode_uri_component(params[:id].to_s)}",
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

          # Update a <a href="https://auth0.com/docs/customize/phone-messages/configure-phone-messaging-providers">phone
          # provider</a>.
          # The <code>credentials</code> object requires different properties depending on the phone provider (which is
          # specified using the <code>name</code> property).
          #
          # @param request_options [Hash]
          # @param params [Auth0::Branding::Phone::Providers::Types::UpdateBrandingPhoneProviderRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :id
          #
          # @return [Auth0::Types::UpdateBrandingPhoneProviderResponseContent]
          def update(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request_data = Auth0::Branding::Phone::Providers::Types::UpdateBrandingPhoneProviderRequestContent.new(params).to_h
            non_body_param_names = ["id"]
            body = request_data.except(*non_body_param_names)

            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PATCH",
              path: "branding/phone/providers/#{URI.encode_uri_component(params[:id].to_s)}",
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
              Auth0::Types::UpdateBrandingPhoneProviderResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # @param request_options [Hash]
          # @param params [Auth0::Branding::Phone::Providers::Types::CreatePhoneProviderSendTestRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :id
          #
          # @return [Auth0::Types::CreatePhoneProviderSendTestResponseContent]
          def test(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request_data = Auth0::Branding::Phone::Providers::Types::CreatePhoneProviderSendTestRequestContent.new(params).to_h
            non_body_param_names = ["id"]
            body = request_data.except(*non_body_param_names)

            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "branding/phone/providers/#{URI.encode_uri_component(params[:id].to_s)}/try",
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
              Auth0::Types::CreatePhoneProviderSendTestResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end
      end
    end
  end
end
