# frozen_string_literal: true

module Auth0
  module EventStreams
    module Deliveries
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String, nil] :statuses
        # @option params [String, nil] :event_types
        # @option params [String, nil] :date_from
        # @option params [String, nil] :date_to
        # @option params [String, nil] :from
        # @option params [Integer, nil] :take
        #
        # @return [Array[Auth0::Types::EventStreamDelivery]]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[statuses event_types date_from date_to from take]
          query_params = {}
          query_params["statuses"] = params[:statuses] if params.key?(:statuses)
          query_params["event_types"] = params[:event_types] if params.key?(:event_types)
          query_params["date_from"] = params[:date_from] if params.key?(:date_from)
          query_params["date_to"] = params[:date_to] if params.key?(:date_to)
          query_params["from"] = params[:from] if params.key?(:from)
          query_params["take"] = params.fetch(:take, 50)
          params = params.except(*query_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "event-streams/#{URI.encode_uri_component(params[:id].to_s)}/deliveries",
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

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :event_id
        #
        # @return [Auth0::Types::GetEventStreamDeliveryHistoryResponseContent]
        def get_history(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "event-streams/#{URI.encode_uri_component(params[:id].to_s)}/deliveries/#{URI.encode_uri_component(params[:event_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::GetEventStreamDeliveryHistoryResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
