# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module Sms
        class Client
          # @param client [Auth0::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # Retrieve the <a href="https://auth0.com/docs/multifactor-authentication/twilio-configuration">Twilio SMS
          # provider configuration</a> (subscription required).
          #
          # A new endpoint is available to retrieve the Twilio configuration related to phone factors (<a
          # href='https://auth0.com/docs/api/management/v2/#!/Guardian/get_twilio'>phone Twilio configuration</a>). It
          # has the same payload as this one. Please use it instead.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::GetGuardianFactorsProviderSmsTwilioResponseContent]
          def get_twilio_provider(request_options: {}, **params)
            Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "guardian/factors/sms/providers/twilio",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::GetGuardianFactorsProviderSmsTwilioResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # This endpoint has been deprecated. To complete this action, use the <a
          # href="https://auth0.com/docs/api/management/v2/guardian/put-twilio">Update Twilio phone configuration</a>
          # endpoint.
          #
          #     <b>Previous functionality</b>: Update the Twilio SMS provider configuration.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::Sms::Types::SetGuardianFactorsProviderSmsTwilioRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::SetGuardianFactorsProviderSmsTwilioResponseContent]
          def set_twilio_provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/sms/providers/twilio",
              body: Auth0::Guardian::Factors::Sms::Types::SetGuardianFactorsProviderSmsTwilioRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::SetGuardianFactorsProviderSmsTwilioResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # This endpoint has been deprecated. To complete this action, use the <a
          # href="https://auth0.com/docs/api/management/v2/guardian/get-phone-providers">Retrieve phone
          # configuration</a> endpoint instead.
          #
          # <b>Previous functionality</b>: Retrieve details for the multi-factor authentication SMS provider configured
          # for your tenant.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::GetGuardianFactorsProviderSmsResponseContent]
          def get_selected_provider(request_options: {}, **params)
            Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "guardian/factors/sms/selected-provider",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::GetGuardianFactorsProviderSmsResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # This endpoint has been deprecated. To complete this action, use the <a
          # href="https://auth0.com/docs/api/management/v2/guardian/put-phone-providers">Update phone configuration</a>
          # endpoint instead.
          #
          # <b>Previous functionality</b>: Update the multi-factor authentication SMS provider configuration in your
          # tenant.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::Sms::Types::SetGuardianFactorsProviderSmsRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::SetGuardianFactorsProviderSmsResponseContent]
          def set_provider(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/sms/selected-provider",
              body: Auth0::Guardian::Factors::Sms::Types::SetGuardianFactorsProviderSmsRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::SetGuardianFactorsProviderSmsResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # This endpoint has been deprecated. To complete this action, use the <a
          # href="https://auth0.com/docs/api/management/v2/guardian/get-factor-phone-templates">Retrieve enrollment and
          # verification phone templates</a> endpoint instead.
          #
          # <b>Previous function</b>: Retrieve details of SMS enrollment and verification templates configured for your
          # tenant.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::GetGuardianFactorSmsTemplatesResponseContent]
          def get_templates(request_options: {}, **params)
            Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "guardian/factors/sms/templates",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::GetGuardianFactorSmsTemplatesResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # This endpoint has been deprecated. To complete this action, use the <a
          # href="https://auth0.com/docs/api/management/v2/guardian/put-factor-phone-templates">Update enrollment and
          # verification phone templates</a> endpoint instead.
          #
          #     <b>Previous functionality</b>: Customize the messages sent to complete SMS enrollment and verification.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::Sms::Types::SetGuardianFactorSmsTemplatesRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::SetGuardianFactorSmsTemplatesResponseContent]
          def set_templates(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/sms/templates",
              body: Auth0::Guardian::Factors::Sms::Types::SetGuardianFactorSmsTemplatesRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::SetGuardianFactorSmsTemplatesResponseContent.load(response.body)
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
