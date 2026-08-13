# frozen_string_literal: true

module Auth0
  module UserBlocks
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve details of all [Brute-force
      # Protection](https://auth0.com/docs/secure/attack-protection/brute-force-protection) blocks for a user with the
      # given identifier (username, phone number, or email).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :identifier
      # @option params [Boolean, nil] :consider_brute_force_enablement
      #
      # @return [Auth0::Types::ListUserBlocksByIdentifierResponseContent]
      def list_by_identifier(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["identifier"] = params[:identifier] if params.key?(:identifier)
        query_params["consider_brute_force_enablement"] = params[:consider_brute_force_enablement] if params.key?(:consider_brute_force_enablement)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "user-blocks",
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
          Auth0::Types::ListUserBlocksByIdentifierResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Remove all [Brute-force Protection](https://auth0.com/docs/secure/attack-protection/brute-force-protection)
      # blocks for the user with the given identifier (username, phone number, or email).
      #
      # Note: This endpoint does not unblock users that were [blocked by a tenant
      # administrator](https://auth0.com/docs/user-profile#block-and-unblock-a-user).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :identifier
      #
      # @return [untyped]
      def delete_by_identifier(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["identifier"] = params[:identifier] if params.key?(:identifier)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "user-blocks",
          query: query_params,
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

      # Retrieve details of all [Brute-force
      # Protection](https://auth0.com/docs/secure/attack-protection/brute-force-protection) blocks for the user with the
      # given ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [Boolean, nil] :consider_brute_force_enablement
      #
      # @return [Auth0::Types::ListUserBlocksResponseContent]
      def list(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["consider_brute_force_enablement"] = params[:consider_brute_force_enablement] if params.key?(:consider_brute_force_enablement)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "user-blocks/#{URI.encode_uri_component(params[:id].to_s)}",
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
          Auth0::Types::ListUserBlocksResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Remove all [Brute-force Protection](https://auth0.com/docs/secure/attack-protection/brute-force-protection)
      # blocks for the user with the given ID.
      #
      # Note: This endpoint does not unblock users that were [blocked by a tenant
      # administrator](https://auth0.com/docs/user-profile#block-and-unblock-a-user).
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
          path: "user-blocks/#{URI.encode_uri_component(params[:id].to_s)}",
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
    end
  end
end
