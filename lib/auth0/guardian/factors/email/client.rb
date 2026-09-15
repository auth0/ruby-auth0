# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module Email
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
          #   client.guardian.factors.email.get
          #
          # @return [Auth0::Types::GetEmailFactorSettingsResponseContent]
          def get(request_options: {}, **_params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "guardian/factors/email/settings",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::GetEmailFactorSettingsResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # TODO: Link this endpoint to relevant documentation when available.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Guardian::Factors::Email::Types::SetEmailFactorSettingsRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @example
          #   client.guardian.factors.email.set(
          #     otp_length: 1,
          #     otp_expiration_time: 1
          #   )
          #
          # @return [Auth0::Types::SetEmailFactorSettingsResponseContent]
          def set(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PUT",
              path: "guardian/factors/email/settings",
              body: Auth0::Guardian::Factors::Email::Types::SetEmailFactorSettingsRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::SetEmailFactorSettingsResponseContent.load(response.body))
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
