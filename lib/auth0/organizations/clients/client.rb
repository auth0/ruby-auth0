# frozen_string_literal: true

module Auth0
  module Organizations
    module Clients
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # List all clients associated with an organization, using checkpoint pagination.
        # <ul>
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
        # @option params [String, nil] :from
        # @option params [Integer, nil] :take
        #
        # @return [Auth0::Types::ListOrganizationClientsResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["from"] = params[:from] if params.key?(:from)
          query_params["take"] = params.fetch(:take, 50)

          Auth0::Internal::CursorItemIterator.new(
            cursor_field: :next_,
            item_field: :clients,
            initial_cursor: query_params["from"]
          ) do |next_cursor|
            query_params["from"] = next_cursor
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/clients",
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
              parsed_response = Auth0::Types::ListOrganizationClientsResponseContent.load(response.body)
              [parsed_response, response]
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Associate one or more clients with an organization.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Organizations::Clients::Types::CreateOrganizationClientsRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Array[Auth0::Types::OrganizationClient]]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Organizations::Clients::Types::CreateOrganizationClientsRequestContent.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/clients",
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
            Auth0::Types::CreateOrganizationClientsResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Remove one or more client associations from an organization.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Organizations::Clients::Types::DeleteOrganizationClientsRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Organizations::Clients::Types::DeleteOrganizationClientsRequestContent.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/clients",
            body: body,
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

        # Get a specific client association for an organization.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :client_id
        #
        # @return [Auth0::Types::GetOrganizationClientResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/clients/#{URI.encode_uri_component(params[:client_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::GetOrganizationClientResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Update an organization client association.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Organizations::Clients::Types::UpdateOrganizationClientRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :client_id
        #
        # @return [Auth0::Types::UpdateOrganizationClientResponseContent]
        def update(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Organizations::Clients::Types::UpdateOrganizationClientRequestContent.new(params).to_h
          non_body_param_names = %w[id client_id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/clients/#{URI.encode_uri_component(params[:client_id].to_s)}",
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
            Auth0::Types::UpdateOrganizationClientResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
