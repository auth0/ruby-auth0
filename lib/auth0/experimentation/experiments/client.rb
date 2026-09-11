# frozen_string_literal: true

module Auth0
  module Experimentation
    module Experiments
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Increments the current ramp index to the requested target level. Up-only: the target must be the immediate
        # next level in the schedule. Idempotent: calling with the current level returns success without writing
        # anything.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Experimentation::Experiments::Types::AdvanceRampRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Auth0::Types::AdvanceRampResponseContent]
        def advance_ramp(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Experimentation::Experiments::Types::AdvanceRampRequestContent.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "experimentation/experiments/#{URI.encode_uri_component(params[:id].to_s)}/advance-ramp",
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
            Auth0::Types::AdvanceRampResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
