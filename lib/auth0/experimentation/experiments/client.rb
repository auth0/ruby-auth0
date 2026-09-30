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

        # Retrieve a paginated list of experiments for the tenant, with optional filters.
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
        # @option params [Auth0::Types::ExperimentStatusEnum, nil] :status
        # @option params [String, nil] :authentication_flow
        # @option params [String, nil] :feature_flag_id
        #
        # @example
        #   client.experimentation.experiments.list(
        #     from: "from",
        #     take: 1,
        #     status: "draft",
        #     authentication_flow: "authentication_flow",
        #     feature_flag_id: "feature_flag_id"
        #   )
        #
        # @return [Auth0::Types::ListExperimentsResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["from"] = params[:from] if params.key?(:from)
          query_params["take"] = params.fetch(:take, 50)
          query_params["status"] = params[:status] if params.key?(:status)
          query_params["authentication_flow"] = params[:authentication_flow] if params.key?(:authentication_flow)
          query_params["feature_flag_id"] = params[:feature_flag_id] if params.key?(:feature_flag_id)

          Auth0::Internal::CursorItemIterator.new(
            cursor_field: :next_,
            item_field: :experiments,
            initial_cursor: query_params["from"]
          ) do |next_cursor|
            query_params["from"] = next_cursor
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "experimentation/experiments",
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
              parsed_response = (response.body.to_s.empty? ? nil : Auth0::Types::ListExperimentsResponseContent.load(response.body))
              [parsed_response, response]
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Create a new experiment for A/B testing.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Experimentation::Experiments::Types::CreateExperimentRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.experimentation.experiments.create(
        #     name: "name",
        #     feature_flag_id: "feature_flag_id",
        #     authentication_flow: "authentication"
        #   )
        #
        # @return [Auth0::Types::CreateExperimentResponseContent]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "experimentation/experiments",
            body: Auth0::Experimentation::Experiments::Types::CreateExperimentRequestContent.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::CreateExperimentResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve a single experiment with its allocations by ID.
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
        #   client.experimentation.experiments.get(id: "id")
        #
        # @return [Auth0::Types::GetExperimentResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "experimentation/experiments/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::GetExperimentResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Permanently delete an experiment and its allocations by ID. Active experiments cannot be deleted; pause or
        # complete first. Idempotent: returns 204 even if the experiment does not exist.
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
        #   client.experimentation.experiments.delete(id: "id")
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "experimentation/experiments/#{URI.encode_uri_component(params[:id].to_s)}",
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

        # Partially update an experiment by ID. Only provided fields are updated. Providing allocations replaces the
        # entire allocations set.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Experimentation::Experiments::Types::UpdateExperimentRequestParameters]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.experimentation.experiments.update(id: "id")
        #
        # @return [Auth0::Types::UpdateExperimentResponseContent]
        def update(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Experimentation::Experiments::Types::UpdateExperimentRequestParameters.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "experimentation/experiments/#{URI.encode_uri_component(params[:id].to_s)}",
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
            (response.body.to_s.empty? ? nil : Auth0::Types::UpdateExperimentResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
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
        # @example
        #   client.experimentation.experiments.advance_ramp(
        #     id: "id",
        #     target_level: 1
        #   )
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
            (response.body.to_s.empty? ? nil : Auth0::Types::AdvanceRampResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Transitions an experiment through its lifecycle: draft → active, active → paused, paused → active,
        # active/paused → completed. Activation runs full readiness validation.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Experimentation::Experiments::Types::UpdateExperimentStatusRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.experimentation.experiments.update_status(
        #     id: "id",
        #     status: "active"
        #   )
        #
        # @return [Auth0::Types::UpdateExperimentStatusResponseContent]
        def update_status(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Experimentation::Experiments::Types::UpdateExperimentStatusRequestContent.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "experimentation/experiments/#{URI.encode_uri_component(params[:id].to_s)}/status",
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
            (response.body.to_s.empty? ? nil : Auth0::Types::UpdateExperimentStatusResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Checks whether an experiment is ready to be activated. Returns is_valid boolean and an errors array describing
        # any blockers. Read-only; no state is modified.
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
        #   client.experimentation.experiments.validate(id: "id")
        #
        # @return [Auth0::Types::ValidateExperimentResponseContent]
        def validate(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "experimentation/experiments/#{URI.encode_uri_component(params[:id].to_s)}/validate",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::ValidateExperimentResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
