# frozen_string_literal: true

module Auth0
  module Connections
    module Clients
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve all clients that have the specified <a
        # href="https://auth0.com/docs/authenticate/identity-providers">connection</a> enabled.
        #
        # <b>Note</b>: The first time you call this endpoint, omit the <code>from</code> parameter. If there are more
        # results, a <code>next</code> value is included in the response. You can use this for subsequent API calls.
        # When <code>next</code> is no longer included in the response, no further results are remaining.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [Integer, nil] :take
        # @option params [String, nil] :from
        #
        # @return [Auth0::Types::GetConnectionEnabledClientsResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[take from]
          query_params = {}
          query_params["take"] = params.fetch(:take, 50)
          query_params["from"] = params[:from] if params.key?(:from)
          params = params.except(*query_param_names)

          Auth0::Internal::CursorItemIterator.new(
            cursor_field: :next_,
            item_field: :clients,
            initial_cursor: query_params["from"]
          ) do |next_cursor|
            query_params["from"] = next_cursor
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "connections/#{URI.encode_uri_component(params[:id].to_s)}/clients",
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
              Auth0::Types::GetConnectionEnabledClientsResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # @param request_options [Hash]
        # @param params [Auth0::Types::UpdateEnabledClientConnectionsRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [untyped]
        def update(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "connections/#{URI.encode_uri_component(params[:id].to_s)}/clients",
            body: params,
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
