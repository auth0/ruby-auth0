# frozen_string_literal: true

module Auth0
  module Prompts
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve details of the Universal Login configuration of your tenant. This includes the <a
      # href="https://auth0.com/docs/authenticate/login/auth0-universal-login/identifier-first">Identifier First
      # Authentication</a> and <a
      # href="https://auth0.com/docs/secure/multi-factor-authentication/fido-authentication-with-webauthn/configure-webauthn-device-biometrics-for-mfa">WebAuthn
      # with Device Biometrics for MFA</a> features.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Auth0::Types::GetSettingsResponseContent]
      def get_settings(request_options: {}, **params)
        Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "prompts",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::GetSettingsResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update the Universal Login configuration of your tenant. This includes the <a
      # href="https://auth0.com/docs/authenticate/login/auth0-universal-login/identifier-first">Identifier First
      # Authentication</a> and <a
      # href="https://auth0.com/docs/secure/multi-factor-authentication/fido-authentication-with-webauthn/configure-webauthn-device-biometrics-for-mfa">WebAuthn
      # with Device Biometrics for MFA</a> features.
      #
      # @param request_options [Hash]
      # @param params [Auth0::Prompts::Types::UpdateSettingsRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Auth0::Types::UpdateSettingsResponseContent]
      def update_settings(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "prompts",
          body: Auth0::Prompts::Types::UpdateSettingsRequestContent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::UpdateSettingsResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Auth0::Rendering::Client]
      def rendering
        @rendering ||= Auth0::Prompts::Rendering::Client.new(client: @client)
      end

      # @return [Auth0::CustomText::Client]
      def custom_text
        @custom_text ||= Auth0::Prompts::CustomText::Client.new(client: @client)
      end

      # @return [Auth0::Partials::Client]
      def partials
        @partials ||= Auth0::Prompts::Partials::Client.new(client: @client)
      end
    end
  end
end
