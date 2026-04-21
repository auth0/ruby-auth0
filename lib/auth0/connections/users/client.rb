# frozen_string_literal: true

module Auth0
  module Connections
    module Users
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Deletes a specified connection user by its email (you cannot delete all users from specific connection).
        # Currently, only Database Connections are supported.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :email
        #
        # @return [untyped]
        def delete_by_email(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[email]
          query_params = {}
          query_params["email"] = params[:email] if params.key?(:email)
          params = params.except(*query_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "connections/#{URI.encode_uri_component(params[:id].to_s)}/users",
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
      end
    end
  end
end
