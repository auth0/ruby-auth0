# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve details of all <a
        # href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors">multi-factor
        # authentication factors</a> associated with your tenant.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Array[Auth0::Types::GuardianFactor]]
        def list(request_options: {}, **params)
          Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "guardian/factors",
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

        # Update the status (i.e., enabled or disabled) of a specific multi-factor authentication factor.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Guardian::Factors::Types::SetGuardianFactorRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Auth0::Types::GuardianFactorNameEnum] :name
        #
        # @return [Auth0::Types::SetGuardianFactorResponseContent]
        def set(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Guardian::Factors::Types::SetGuardianFactorRequestContent.new(params).to_h
          non_body_param_names = ["name"]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "guardian/factors/#{URI.encode_uri_component(params[:name].to_s)}",
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
            Auth0::Types::SetGuardianFactorResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @return [Auth0::Phone::Client]
        def phone
          @phone ||= Auth0::Guardian::Factors::Phone::Client.new(client: @client)
        end

        # @return [Auth0::PushNotification::Client]
        def push_notification
          @push_notification ||= Auth0::Guardian::Factors::PushNotification::Client.new(client: @client)
        end

        # @return [Auth0::Sms::Client]
        def sms
          @sms ||= Auth0::Guardian::Factors::Sms::Client.new(client: @client)
        end

        # @return [Auth0::Duo::Client]
        def duo
          @duo ||= Auth0::Guardian::Factors::Duo::Client.new(client: @client)
        end
      end
    end
  end
end
