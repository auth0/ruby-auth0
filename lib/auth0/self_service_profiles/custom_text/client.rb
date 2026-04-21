# frozen_string_literal: true

module Auth0
  module SelfServiceProfiles
    module CustomText
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieves text customizations for a given self-service profile, language and Self Service SSO Flow page.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [Auth0::Types::SelfServiceProfileCustomTextLanguageEnum] :language
        # @option params [Auth0::Types::SelfServiceProfileCustomTextPageEnum] :page
        #
        # @return [Hash[String, String]]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "self-service-profiles/#{URI.encode_uri_component(params[:id].to_s)}/custom-text/#{URI.encode_uri_component(params[:language].to_s)}/#{URI.encode_uri_component(params[:page].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::ListSelfServiceProfileCustomTextResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Updates text customizations for a given self-service profile, language and Self Service SSO Flow page.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Types::SetSelfServiceProfileCustomTextRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [Auth0::Types::SelfServiceProfileCustomTextLanguageEnum] :language
        # @option params [Auth0::Types::SelfServiceProfileCustomTextPageEnum] :page
        #
        # @return [Hash[String, String]]
        def set(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "self-service-profiles/#{URI.encode_uri_component(params[:id].to_s)}/custom-text/#{URI.encode_uri_component(params[:language].to_s)}/#{URI.encode_uri_component(params[:page].to_s)}",
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
            Auth0::Types::SetSelfServiceProfileCustomTextResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
