# frozen_string_literal: true

module Auth0
  module Guardian
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
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
      #   client.guardian.get
      #
      # @return [Auth0::Types::GetGuardianSettingsResponseContent]
      def get(request_options: {}, **_params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "guardian/settings",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Auth0::Types::GetGuardianSettingsResponseContent.load(response.body))
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update a tenant's guardian settings such as Remember Me
      #
      # @param request_options [Hash]
      # @param params [Auth0::Guardian::Types::SetGuardianSettingsRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.guardian.set(
      #     display_remember_me_checkbox: true,
      #     remember_me_default_value: true,
      #     mfa_session_inactivity_timeout: 1,
      #     mfa_session_overall_timeout: 1
      #   )
      #
      # @return [Auth0::Types::SetGuardianSettingsResponseContent]
      def set(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "guardian/settings",
          body: Auth0::Guardian::Types::SetGuardianSettingsRequestContent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Auth0::Types::SetGuardianSettingsResponseContent.load(response.body))
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Auth0::Enrollments::Client]
      def enrollments
        @enrollments ||= Auth0::Guardian::Enrollments::Client.new(client: @client)
      end

      # @return [Auth0::Factors::Client]
      def factors
        @factors ||= Auth0::Guardian::Factors::Client.new(client: @client)
      end

      # @return [Auth0::Policies::Client]
      def policies
        @policies ||= Auth0::Guardian::Policies::Client.new(client: @client)
      end
    end
  end
end
