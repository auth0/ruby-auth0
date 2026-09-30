# frozen_string_literal: true

module Auth0
  module Experimentation
    module FeatureFlags
      module Variations
        class Client
          # @param client [Auth0::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # Retrieve all variations defined for a specific feature flag.
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
          #   client.experimentation.feature_flags.variations.list(id: "id")
          #
          # @return [Auth0::Types::ListVariationsResponseContent]
          def list(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "experimentation/feature-flags/#{URI.encode_uri_component(params[:id].to_s)}/variations",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::ListVariationsResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Create a new variation with parameter overrides for a specific feature flag.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Experimentation::FeatureFlags::Variations::Types::CreateVariationRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :id
          #
          # @example
          #   client.experimentation.feature_flags.variations.create(
          #     id: "id",
          #     name: "name",
          #     overrides: {
          #       key: "value"
          #     }
          #   )
          #
          # @return [Auth0::Types::CreateVariationResponseContent]
          def create(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request_data = Auth0::Experimentation::FeatureFlags::Variations::Types::CreateVariationRequestContent.new(params).to_h
            non_body_param_names = %w[id]
            body = request_data.except(*non_body_param_names)

            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "experimentation/feature-flags/#{URI.encode_uri_component(params[:id].to_s)}/variations",
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
              (response.body.to_s.empty? ? nil : Auth0::Types::CreateVariationResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Retrieve a single variation by its ID.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :id
          # @option params [String] :vid
          #
          # @example
          #   client.experimentation.feature_flags.variations.get(
          #     id: "id",
          #     vid: "vid"
          #   )
          #
          # @return [Auth0::Types::GetVariationResponseContent]
          def get(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "experimentation/feature-flags/#{URI.encode_uri_component(params[:id].to_s)}/variations/#{URI.encode_uri_component(params[:vid].to_s)}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              (response.body.to_s.empty? ? nil : Auth0::Types::GetVariationResponseContent.load(response.body))
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Delete a variation by ID. Returns 204 if the variation does not exist. Returns 404 if the parent feature
          # flag does not exist.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :id
          # @option params [String] :vid
          #
          # @example
          #   client.experimentation.feature_flags.variations.delete(
          #     id: "id",
          #     vid: "vid"
          #   )
          #
          # @return [untyped]
          def delete(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "DELETE",
              path: "experimentation/feature-flags/#{URI.encode_uri_component(params[:id].to_s)}/variations/#{URI.encode_uri_component(params[:vid].to_s)}",
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

          # Partially update a variation by ID. Only provided fields are updated.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Experimentation::FeatureFlags::Variations::Types::UpdateVariationRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :id
          # @option params [String] :vid
          #
          # @example
          #   client.experimentation.feature_flags.variations.update(
          #     id: "id",
          #     vid: "vid"
          #   )
          #
          # @return [Auth0::Types::UpdateVariationResponseContent]
          def update(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request_data = Auth0::Experimentation::FeatureFlags::Variations::Types::UpdateVariationRequestContent.new(params).to_h
            non_body_param_names = %w[id vid]
            body = request_data.except(*non_body_param_names)

            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PATCH",
              path: "experimentation/feature-flags/#{URI.encode_uri_component(params[:id].to_s)}/variations/#{URI.encode_uri_component(params[:vid].to_s)}",
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
              (response.body.to_s.empty? ? nil : Auth0::Types::UpdateVariationResponseContent.load(response.body))
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
