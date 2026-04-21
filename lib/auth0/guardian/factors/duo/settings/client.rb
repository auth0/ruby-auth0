# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module Duo
        module Settings
          class Client
            # @param client [Auth0::Internal::Http::RawClient]
            #
            # @return [void]
            def initialize(client:)
              @client = client
            end

            # Retrieves the DUO account and factor configuration.
            #
            # @param request_options [Hash]
            # @param params [Hash]
            # @option request_options [String] :base_url
            # @option request_options [Hash{String => Object}] :additional_headers
            # @option request_options [Hash{String => Object}] :additional_query_parameters
            # @option request_options [Hash{String => Object}] :additional_body_parameters
            # @option request_options [Integer] :timeout_in_seconds
            #
            # @return [Auth0::Types::GetGuardianFactorDuoSettingsResponseContent]
            def get(request_options: {}, **params)
              Auth0::Internal::Types::Utils.normalize_keys(params)
              request = Auth0::Internal::JSON::Request.new(
                base_url: request_options[:base_url],
                method: "GET",
                path: "guardian/factors/duo/settings",
                request_options: request_options
              )
              begin
                response = @client.send(request)
              rescue Net::HTTPRequestTimeout
                raise Auth0::Errors::TimeoutError
              end
              code = response.code.to_i
              if code.between?(200, 299)
                Auth0::Types::GetGuardianFactorDuoSettingsResponseContent.load(response.body)
              else
                error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
                raise error_class.new(response.body, code: code)
              end
            end

            # Set the DUO account configuration and other properties specific to this factor.
            #
            # @param request_options [Hash]
            # @param params [Auth0::Guardian::Factors::Duo::Settings::Types::SetGuardianFactorDuoSettingsRequestContent]
            # @option request_options [String] :base_url
            # @option request_options [Hash{String => Object}] :additional_headers
            # @option request_options [Hash{String => Object}] :additional_query_parameters
            # @option request_options [Hash{String => Object}] :additional_body_parameters
            # @option request_options [Integer] :timeout_in_seconds
            #
            # @return [Auth0::Types::SetGuardianFactorDuoSettingsResponseContent]
            def set(request_options: {}, **params)
              params = Auth0::Internal::Types::Utils.normalize_keys(params)
              request = Auth0::Internal::JSON::Request.new(
                base_url: request_options[:base_url],
                method: "PUT",
                path: "guardian/factors/duo/settings",
                body: Auth0::Guardian::Factors::Duo::Settings::Types::SetGuardianFactorDuoSettingsRequestContent.new(params).to_h,
                request_options: request_options
              )
              begin
                response = @client.send(request)
              rescue Net::HTTPRequestTimeout
                raise Auth0::Errors::TimeoutError
              end
              code = response.code.to_i
              if code.between?(200, 299)
                Auth0::Types::SetGuardianFactorDuoSettingsResponseContent.load(response.body)
              else
                error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
                raise error_class.new(response.body, code: code)
              end
            end

            # @param request_options [Hash]
            # @param params [Auth0::Guardian::Factors::Duo::Settings::Types::UpdateGuardianFactorDuoSettingsRequestContent]
            # @option request_options [String] :base_url
            # @option request_options [Hash{String => Object}] :additional_headers
            # @option request_options [Hash{String => Object}] :additional_query_parameters
            # @option request_options [Hash{String => Object}] :additional_body_parameters
            # @option request_options [Integer] :timeout_in_seconds
            #
            # @return [Auth0::Types::UpdateGuardianFactorDuoSettingsResponseContent]
            def update(request_options: {}, **params)
              params = Auth0::Internal::Types::Utils.normalize_keys(params)
              request = Auth0::Internal::JSON::Request.new(
                base_url: request_options[:base_url],
                method: "PATCH",
                path: "guardian/factors/duo/settings",
                body: Auth0::Guardian::Factors::Duo::Settings::Types::UpdateGuardianFactorDuoSettingsRequestContent.new(params).to_h,
                request_options: request_options
              )
              begin
                response = @client.send(request)
              rescue Net::HTTPRequestTimeout
                raise Auth0::Errors::TimeoutError
              end
              code = response.code.to_i
              if code.between?(200, 299)
                Auth0::Types::UpdateGuardianFactorDuoSettingsResponseContent.load(response.body)
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
end
