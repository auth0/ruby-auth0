# frozen_string_literal: true

module Auth0
  module Roles
    module Users
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve list of users associated with a specific role. For Dashboard instructions, review [View Users
        # Assigned to
        # Roles](https://auth0.com/docs/manage-users/access-control/configure-core-rbac/roles/view-users-assigned-to-roles).
        #
        # **Note**: Returns only users with direct role assignments. For groups assigned to this role, use `GET
        # /api/v2/roles/{id}/groups`.
        #
        # This endpoint supports two types of pagination:
        #
        # - Offset pagination
        # - Checkpoint pagination
        #
        # Checkpoint pagination must be used if you need to retrieve more than 1000 organization members.
        #
        # **Checkpoint Pagination**
        #
        # To search by checkpoint, use the following parameters:
        #
        # - `from`: Optional id from which to start selection.
        # - `take`: The total amount of entries to retrieve when using the from parameter. Defaults to 50.
        #
        # **Note**: The first time you call this endpoint using checkpoint pagination, omit the `from` parameter. If
        # there are more results, a `next` value is included in the response. You can use this for subsequent API calls.
        # When `next` is no longer included in the response, no pages are remaining.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [Boolean, nil] :include_totals
        # @option params [String, nil] :from
        # @option params [Integer, nil] :take
        #
        # @return [Auth0::Types::ListRoleUsersPaginatedResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["include_totals"] = params.fetch(:include_totals, true)
          query_params["from"] = params[:from] if params.key?(:from)
          query_params["take"] = params.fetch(:take, 50)

          Auth0::Internal::CursorItemIterator.new(
            cursor_field: :next_,
            item_field: :users,
            initial_cursor: query_params["from"]
          ) do |next_cursor|
            query_params["from"] = next_cursor
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "roles/#{URI.encode_uri_component(params[:id].to_s)}/users",
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
              parsed_response = Auth0::Types::ListRoleUsersPaginatedResponseContent.load(response.body)
              [parsed_response, response]
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Assign one or more users to an existing user role. To learn more, review [Role-Based Access
        # Control](https://auth0.com/docs/manage-users/access-control/rbac).
        #
        # **Note**: New roles cannot be created through this action.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Roles::Users::Types::AssignRoleUsersRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [untyped]
        def assign(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Roles::Users::Types::AssignRoleUsersRequestContent.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "roles/#{URI.encode_uri_component(params[:id].to_s)}/users",
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
      end
    end
  end
end
