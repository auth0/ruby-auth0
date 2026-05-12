# frozen_string_literal: true

module Auth0
  module Events
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Subscribe to events via Server-Sent Events (SSE)
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :from
      # @option params [String, nil] :from_timestamp
      # @option params [Auth0::Types::EventStreamSubscribeEventsEventTypeEnum, nil] :event_type
      #
      # @return [untyped]
      def subscribe(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[from from_timestamp event_type]
        query_params = {}
        query_params["from"] = params[:from] if params.key?(:from)
        query_params["from_timestamp"] = params[:from_timestamp] if params.key?(:from_timestamp)
        query_params["event_type"] = params[:event_type] if params.key?(:event_type)
        params.except(*query_param_names)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "events",
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
