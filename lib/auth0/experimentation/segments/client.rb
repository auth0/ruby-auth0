# frozen_string_literal: true

module Auth0
  module Experimentation
    module Segments
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve a paginated list of segments for the tenant.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :from
        # @option params [Integer, nil] :take
        # @option params [Auth0::Types::SegmentTypeFilterEnum, nil] :type
        #
        # @example
        #   client.experimentation.segments.list(
        #     from: "from",
        #     take: 1,
        #     type: "auth0"
        #   )
        #
        # @return [Auth0::Types::ListSegmentsResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["from"] = params[:from] if params.key?(:from)
          query_params["take"] = params.fetch(:take, 50)
          query_params["type"] = params[:type] if params.key?(:type)

          Auth0::Internal::CursorItemIterator.new(
            cursor_field: :next_,
            item_field: :segments,
            initial_cursor: query_params["from"]
          ) do |next_cursor|
            query_params["from"] = next_cursor
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "experimentation/segments",
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
              parsed_response = (response.body.to_s.empty? ? nil : Auth0::Types::ListSegmentsResponseContent.load(response.body))
              [parsed_response, response]
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Create a new segment with rule-based membership criteria for use in experiments.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Experimentation::Segments::Types::CreateSegmentRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.experimentation.segments.create(
        #     name: "name",
        #     rules: [{}]
        #   )
        #
        # @return [Auth0::Types::CreateSegmentResponseContent]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "experimentation/segments",
            body: Auth0::Experimentation::Segments::Types::CreateSegmentRequestContent.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::CreateSegmentResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve a single segment by its ID.
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
        #   client.experimentation.segments.get(id: "id")
        #
        # @return [Auth0::Types::GetSegmentResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "experimentation/segments/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::GetSegmentResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Delete a segment by ID. Idempotent: returns 204 even if segment does not exist.
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
        #   client.experimentation.segments.delete(id: "id")
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "experimentation/segments/#{URI.encode_uri_component(params[:id].to_s)}",
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

        # Partially update a segment by ID. Only provided fields are updated. Sending rules replaces the entire rules
        # array.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Experimentation::Segments::Types::UpdateSegmentRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.experimentation.segments.update(id: "id")
        #
        # @return [Auth0::Types::UpdateSegmentResponseContent]
        def update(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Experimentation::Segments::Types::UpdateSegmentRequestContent.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "experimentation/segments/#{URI.encode_uri_component(params[:id].to_s)}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::UpdateSegmentResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
