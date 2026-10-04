# frozen_string_literal: true

module Auth0
  module Connections
    module Keys
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Gets the connection keys for the Okta or OIDC connection strategy.
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
        # @example
        #   client.connections.keys.get(id: "id")
        #
        # @return [Array[Auth0::Types::ConnectionKey]]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "connections/#{URI.encode_uri_component(params[:id].to_s)}/keys",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Internal::Types::Utils.coerce(Internal::Types::Array[Auth0::Types::ConnectionKey], (response.body.to_s.empty? ? nil : JSON.parse(response.body, symbolize_names: true)))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Provision initial connection keys for Okta or OIDC connection strategies. This endpoint allows you to create
        # keys before configuring the connection to use Private Key JWT authentication, enabling zero-downtime
        # transitions.
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
        # @example
        #   client.connections.keys.create(
        #     id: "id",
        #     request: {}
        #   )
        #
        # @return [Array[Auth0::Types::PostConnectionsKeysResponseContentItem]]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[id]
          body_params = params.except(*path_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "connections/#{URI.encode_uri_component(params[:id].to_s)}/keys",
            body: body_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::PostConnectionsKeysResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Rotates the connection keys for the Okta or OIDC connection strategies.
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
        # @example
        #   client.connections.keys.rotate(
        #     id: "id",
        #     request: {}
        #   )
        #
        # @return [Auth0::Types::RotateConnectionsKeysResponseContent]
        def rotate(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[id]
          body_params = params.except(*path_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "connections/#{URI.encode_uri_component(params[:id].to_s)}/keys/rotate",
            body: body_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::RotateConnectionsKeysResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
