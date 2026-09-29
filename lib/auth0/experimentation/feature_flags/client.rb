# frozen_string_literal: true

module Auth0
  module Experimentation
    module FeatureFlags
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve a paginated list of feature flags for the tenant.
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
        # @option params [Auth0::Types::FeatureFlagTypeEnum, nil] :type
        # @option params [Auth0::Types::FeatureFlagStatusEnum, nil] :status
        #
        # @example
        #   client.experimentation.feature_flags.list(
        #     from: "from",
        #     take: 1,
        #     type: "auth0",
        #     status: "draft"
        #   )
        #
        # @return [Auth0::Types::ListFeatureFlagsResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["from"] = params[:from] if params.key?(:from)
          query_params["take"] = params.fetch(:take, 50)
          query_params["type"] = params[:type] if params.key?(:type)
          query_params["status"] = params[:status] if params.key?(:status)

          Auth0::Internal::CursorItemIterator.new(
            cursor_field: :next_,
            item_field: :feature_flags,
            initial_cursor: query_params["from"]
          ) do |next_cursor|
            query_params["from"] = next_cursor
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "experimentation/feature-flags",
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
              parsed_response = (response.body.to_s.empty? ? nil : Auth0::Types::ListFeatureFlagsResponseContent.load(response.body))
              [parsed_response, response]
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Create a new feature flag with parameters for use in experiments.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Experimentation::FeatureFlags::Types::CreateFeatureFlagRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.experimentation.feature_flags.create(
        #     name: "name",
        #     parameters: {}
        #   )
        #
        # @return [Auth0::Types::CreateFeatureFlagResponseContent]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "experimentation/feature-flags",
            body: Auth0::Experimentation::FeatureFlags::Types::CreateFeatureFlagRequestContent.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::CreateFeatureFlagResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve a single feature flag by its ID.
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
        #   client.experimentation.feature_flags.get(id: "id")
        #
        # @return [Auth0::Types::GetFeatureFlagResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "experimentation/feature-flags/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::GetFeatureFlagResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Delete a feature flag by ID. Idempotent: returns 204 even if flag does not exist.
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
        #   client.experimentation.feature_flags.delete(id: "id")
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "experimentation/feature-flags/#{URI.encode_uri_component(params[:id].to_s)}",
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

        # Partially update a feature flag by ID. Only provided fields are updated.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Experimentation::FeatureFlags::Types::UpdateFeatureFlagRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.experimentation.feature_flags.update(id: "id")
        #
        # @return [Auth0::Types::UpdateFeatureFlagResponseContent]
        def update(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Experimentation::FeatureFlags::Types::UpdateFeatureFlagRequestContent.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "experimentation/feature-flags/#{URI.encode_uri_component(params[:id].to_s)}",
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
            (response.body.to_s.empty? ? nil : Auth0::Types::UpdateFeatureFlagResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Transitions a feature flag through its lifecycle states: draft → active, draft → archived, active → archived.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Experimentation::FeatureFlags::Types::UpdateFeatureFlagStatusRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.experimentation.feature_flags.update_status(
        #     id: "id",
        #     status: "draft"
        #   )
        #
        # @return [Auth0::Types::UpdateFeatureFlagStatusResponseContent]
        def update_status(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Experimentation::FeatureFlags::Types::UpdateFeatureFlagStatusRequestContent.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "experimentation/feature-flags/#{URI.encode_uri_component(params[:id].to_s)}/status",
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
            (response.body.to_s.empty? ? nil : Auth0::Types::UpdateFeatureFlagStatusResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @return [Auth0::Variations::Client]
        def variations
          @variations ||= Auth0::Experimentation::FeatureFlags::Variations::Client.new(client: @client)
        end
      end
    end
  end
end
