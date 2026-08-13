# frozen_string_literal: true

module Auth0
  module Guardian
    module Policies
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve the [multi-factor authentication (MFA)
        # policies](https://auth0.com/docs/secure/multi-factor-authentication/enable-mfa) configured for your tenant.
        #
        # The following policies are supported:
        #
        # - `all-applications` policy prompts with MFA for all logins.
        # - `confidence-score` policy prompts with MFA only for low confidence logins.
        #
        # **Note**: The `confidence-score` policy is part of the [Adaptive MFA
        # feature](https://auth0.com/docs/secure/multi-factor-authentication/adaptive-mfa). Adaptive MFA requires an
        # add-on for the Enterprise plan; review [Auth0 Pricing](https://auth0.com/pricing) for more details.
        #
        # @param request_options [Hash]
        # @param _params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Array[Auth0::Types::MfaPolicyEnum]]
        def list(request_options: {}, **_params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "guardian/policies",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::ListGuardianPoliciesResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Set [multi-factor authentication (MFA)
        # policies](https://auth0.com/docs/secure/multi-factor-authentication/enable-mfa) for your tenant.
        #
        # The following policies are supported:
        #
        # - `all-applications` policy prompts with MFA for all logins.
        # - `confidence-score` policy prompts with MFA only for low confidence logins.
        #
        # **Note**: The `confidence-score` policy is part of the [Adaptive MFA
        # feature](https://auth0.com/docs/secure/multi-factor-authentication/adaptive-mfa). Adaptive MFA requires an
        # add-on for the Enterprise plan; review [Auth0 Pricing](https://auth0.com/pricing) for more details.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Types::SetGuardianPoliciesRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Array[Auth0::Types::MfaPolicyEnum]]
        def set(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "guardian/policies",
            body: params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::SetGuardianPoliciesResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
