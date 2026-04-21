# frozen_string_literal: true

module Auth0
  module Clients
    module Connections
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve all connections that are enabled for the specified <a
        # href="https://www.auth0.com/docs/get-started/applications"> Application</a>, using checkpoint pagination. A
        # list of fields to include or exclude for each connection may also be specified.
        # <ul>
        #   <li>
        # This endpoint requires the <code>read:connections</code> scope and any one of <code>read:clients</code> or
        # <code>read:client_summary</code>.
        #   </li>
        #   <li>
        # <b>Note</b>: The first time you call this endpoint, omit the <code>from</code> parameter. If there are more
        # results, a <code>next</code> value is included in the response. You can use this for subsequent API calls.
        # When <code>next</code> is no longer included in the response, no further results are remaining.
        #   </li>
        # </ul>
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [Auth0::Types::ConnectionStrategyEnum, nil] :strategy
        # @option params [String, nil] :from
        # @option params [Integer, nil] :take
        # @option params [String, nil] :fields
        # @option params [Boolean, nil] :include_fields
        #
        # @return [Auth0::Types::ListClientConnectionsResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[strategy from take fields include_fields]
          query_params = {}
          query_params["strategy"] = params[:strategy] if params.key?(:strategy)
          query_params["from"] = params[:from] if params.key?(:from)
          query_params["take"] = params.fetch(:take, 50)
          query_params["fields"] = params[:fields] if params.key?(:fields)
          query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)
          params = params.except(*query_param_names)

          Auth0::Internal::CursorItemIterator.new(
            cursor_field: :next_,
            item_field: :connections,
            initial_cursor: query_params["from"]
          ) do |next_cursor|
            query_params["from"] = next_cursor
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "clients/#{URI.encode_uri_component(params[:id].to_s)}/connections",
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
              Auth0::Types::ListClientConnectionsResponseContent.load(response.body)
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
