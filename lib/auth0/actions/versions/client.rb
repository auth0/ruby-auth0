# frozen_string_literal: true

module Auth0
  module Actions
    module Versions
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve all of an action's versions. An action version is created whenever an action is deployed. An action
        # version is immutable, once created.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :action_id
        # @option params [Integer, nil] :page
        # @option params [Integer, nil] :per_page
        #
        # @return [Auth0::Types::ListActionVersionsPaginatedResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[page per_page]
          query_params = {}
          query_params["page"] = params.fetch(:page, 0)
          query_params["per_page"] = params.fetch(:per_page, 50)
          params = params.except(*query_param_names)

          Auth0::Internal::OffsetItemIterator.new(
            initial_page: query_params["page"],
            item_field: :versions,
            has_next_field: nil,
            step: true
          ) do |next_page|
            query_params["page"] = next_page
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "actions/actions/#{URI.encode_uri_component(params[:action_id].to_s)}/versions",
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
              Auth0::Types::ListActionVersionsPaginatedResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Retrieve a specific version of an action. An action version is created whenever an action is deployed. An
        # action version is immutable, once created.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :action_id
        # @option params [String] :id
        #
        # @return [Auth0::Types::GetActionVersionResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "actions/actions/#{URI.encode_uri_component(params[:action_id].to_s)}/versions/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::GetActionVersionResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Performs the equivalent of a roll-back of an action to an earlier, specified version. Creates a new, deployed
        # action version that is identical to the specified version. If this action is currently bound to a trigger, the
        # system will begin executing the newly-created version immediately.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :action_id
        # @option params [String] :id
        #
        # @return [Auth0::Types::DeployActionVersionResponseContent]
        def deploy(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "actions/actions/#{URI.encode_uri_component(params[:action_id].to_s)}/versions/#{URI.encode_uri_component(params[:id].to_s)}/deploy",
            body: params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::DeployActionVersionResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
