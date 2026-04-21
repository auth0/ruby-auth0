# frozen_string_literal: true

module Auth0
  module Users
    module Roles
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve detailed list of all user roles currently assigned to a user.
        #
        # <b>Note</b>: This action retrieves all roles assigned to a user in the context of your whole tenant. To
        # retrieve Organization-specific roles, use the following endpoint: <a
        # href="https://auth0.com/docs/api/management/v2/organizations/get-organization-member-roles">Get user roles
        # assigned to an Organization member</a>.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [Integer, nil] :per_page
        # @option params [Integer, nil] :page
        # @option params [Boolean, nil] :include_totals
        #
        # @return [Auth0::Types::ListUserRolesOffsetPaginatedResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[per_page page include_totals]
          query_params = {}
          query_params["per_page"] = params.fetch(:per_page, 50)
          query_params["page"] = params.fetch(:page, 0)
          query_params["include_totals"] = params.fetch(:include_totals, true)
          params = params.except(*query_param_names)

          Auth0::Internal::OffsetItemIterator.new(
            initial_page: query_params["page"],
            item_field: :roles,
            has_next_field: nil,
            step: true
          ) do |next_page|
            query_params["page"] = next_page
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "users/#{URI.encode_uri_component(params[:id].to_s)}/roles",
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
              Auth0::Types::ListUserRolesOffsetPaginatedResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Assign one or more existing user roles to a user. For more information, review <a
        # href="https://auth0.com/docs/manage-users/access-control/rbac">Role-Based Access Control</a>.
        #
        # <b>Note</b>: New roles cannot be created through this action. Additionally, this action is used to assign
        # roles to a user in the context of your whole tenant. To assign roles in the context of a specific
        # Organization, use the following endpoint: <a
        # href="https://auth0.com/docs/api/management/v2/organizations/post-organization-member-roles">Assign user roles
        # to an Organization member</a>.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Users::Roles::Types::AssignUserRolesRequestContent]
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
          request_data = Auth0::Users::Roles::Types::AssignUserRolesRequestContent.new(params).to_h
          non_body_param_names = ["id"]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "users/#{URI.encode_uri_component(params[:id].to_s)}/roles",
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

        # Remove one or more specified user roles assigned to a user.
        #
        # <b>Note</b>: This action removes a role from a user in the context of your whole tenant. If you want to
        # unassign a role from a user in the context of a specific Organization, use the following endpoint: <a
        # href="https://auth0.com/docs/api/management/v2/organizations/delete-organization-member-roles">Delete user
        # roles from an Organization member</a>.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Users::Roles::Types::DeleteUserRolesRequestContent]
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
          request_data = Auth0::Users::Roles::Types::DeleteUserRolesRequestContent.new(params).to_h
          non_body_param_names = ["id"]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "users/#{URI.encode_uri_component(params[:id].to_s)}/roles",
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
