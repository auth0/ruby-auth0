# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module Phone
        class Client
          # @param client [Auth0::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # Retrieve list of <a
          # href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-sms-voice-notifications-mfa">phone-type
          # MFA factors</a> (i.e., sms and voice) that are enabled for your tenant.
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
          #   client.guardian.factors.phone.get_message_types
          #
          # @return [Auth0::Types::GetGuardianFactorPhoneMessageTypesResponseContent]
          def get_message_types(request_options: {}, **_params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "guardian/factors/phone/message-types",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::GetGuardianFactorPhoneMessageTypesResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Replace the list of <a
          # href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-sms-voice-notifications-mfa">phone-type
          # MFA factors</a> (i.e., sms and voice) that are enabled for your tenant.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::Phone::Types::SetGuardianFactorPhoneMessageTypesRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @example
          #   client.guardian.factors.phone.set_message_types(message_types: ["sms"])
          #
          # @return [Auth0::Types::SetGuardianFactorPhoneMessageTypesResponseContent]
          def set_message_types(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/phone/message-types",
              body: Auth0::Guardian::Factors::Phone::Types::SetGuardianFactorPhoneMessageTypesRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::SetGuardianFactorPhoneMessageTypesResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Retrieve configuration details for a Twilio phone provider that has been set up in your tenant. To learn
          # more, review <a
          # href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-sms-voice-notifications-mfa">Configure
          # SMS and Voice Notifications for MFA</a>.
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
          #   client.guardian.factors.phone.get_twilio_provider
          #
          # @return [Auth0::Types::GetGuardianFactorsProviderPhoneTwilioResponseContent]
          def get_twilio_provider(request_options: {}, **_params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "guardian/factors/phone/providers/twilio",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::GetGuardianFactorsProviderPhoneTwilioResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Update the configuration of a Twilio phone provider that has been set up in your tenant. To learn more,
          # review <a
          # href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-sms-voice-notifications-mfa">Configure
          # SMS and Voice Notifications for MFA</a>.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::Phone::Types::SetGuardianFactorsProviderPhoneTwilioRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @example
          #   client.guardian.factors.phone.set_twilio_provider
          #
          # @return [Auth0::Types::SetGuardianFactorsProviderPhoneTwilioResponseContent]
          def set_twilio_provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/phone/providers/twilio",
              body: Auth0::Guardian::Factors::Phone::Types::SetGuardianFactorsProviderPhoneTwilioRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::SetGuardianFactorsProviderPhoneTwilioResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Retrieve details of the multi-factor authentication phone provider configured for your tenant.
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
          #   client.guardian.factors.phone.get_selected_provider
          #
          # @return [Auth0::Types::GetGuardianFactorsProviderPhoneResponseContent]
          def get_selected_provider(request_options: {}, **_params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "guardian/factors/phone/selected-provider",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::GetGuardianFactorsProviderPhoneResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::Phone::Types::SetGuardianFactorsProviderPhoneRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @example
          #   client.guardian.factors.phone.set_provider(provider: "auth0")
          #
          # @return [Auth0::Types::SetGuardianFactorsProviderPhoneResponseContent]
          def set_provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/phone/selected-provider",
              body: Auth0::Guardian::Factors::Phone::Types::SetGuardianFactorsProviderPhoneRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::SetGuardianFactorsProviderPhoneResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # TODO: Link this endpoint to relevant documentation when available.
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
          #   client.guardian.factors.phone.get
          #
          # @return [Auth0::Types::GetPhoneFactorSettingsResponseContent]
          def get(request_options: {}, **_params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "guardian/factors/phone/settings",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::GetPhoneFactorSettingsResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # TODO: Link this endpoint to relevant documentation when available.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::Phone::Types::SetPhoneFactorSettingsRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @example
          #   client.guardian.factors.phone.set(
          #     otp_length: 1,
          #     otp_expiration_time: 1
          #   )
          #
          # @return [Auth0::Types::SetPhoneFactorSettingsResponseContent]
          def set(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/phone/settings",
              body: Auth0::Guardian::Factors::Phone::Types::SetPhoneFactorSettingsRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::SetPhoneFactorSettingsResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Retrieve details of the multi-factor authentication enrollment and verification templates for phone-type
          # factors available in your tenant.
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
          #   client.guardian.factors.phone.get_templates
          #
          # @return [Auth0::Types::GetGuardianFactorPhoneTemplatesResponseContent]
          def get_templates(request_options: {}, **_params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "guardian/factors/phone/templates",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::GetGuardianFactorPhoneTemplatesResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Customize the messages sent to complete phone enrollment and verification (subscription required).
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::Phone::Types::SetGuardianFactorPhoneTemplatesRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @example
          #   client.guardian.factors.phone.set_templates(
          #     enrollment_message: "enrollment_message",
          #     verification_message: "verification_message"
          #   )
          #
          # @return [Auth0::Types::SetGuardianFactorPhoneTemplatesResponseContent]
          def set_templates(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/phone/templates",
              body: Auth0::Guardian::Factors::Phone::Types::SetGuardianFactorPhoneTemplatesRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::SetGuardianFactorPhoneTemplatesResponseContent.load(response.body))
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
