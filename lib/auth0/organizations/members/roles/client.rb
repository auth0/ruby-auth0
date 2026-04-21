# frozen_string_literal: true

module Auth0
  module Organizations
    module Members
      module Roles
        class Client
          # @param client [Auth0::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # Retrieve detailed list of roles assigned to a given user within the context of a specific Organization.
          #
          # Users can be members of multiple Organizations with unique roles assigned for each membership. This action
          # only returns the roles associated with the specified Organization; any roles assigned to the user within
          # other Organizations are not included.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :id
          # @option params [String] :user_id
          # @option params [Integer, nil] :page
          # @option params [Integer, nil] :per_page
          # @option params [Boolean, nil] :include_totals
          #
          # @return [Auth0::Types::ListOrganizationMemberRolesOffsetPaginatedResponseContent]
          def list(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[page per_page include_totals]
            query_params = {}
            query_params["page"] = params.fetch(:page, 0)
            query_params["per_page"] = params.fetch(:per_page, 50)
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
                path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/members/#{URI.encode_uri_component(params[:user_id].to_s)}/roles",
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
                Auth0::Types::ListOrganizationMemberRolesOffsetPaginatedResponseContent.load(response.body)
              else
                error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
                raise error_class.new(response.body, code: code)
              end
            end
          end

          # Assign one or more <a href="https://auth0.com/docs/manage-users/access-control/rbac">roles</a> to a user to
          # determine their access for a specific Organization.
          #
          # Users can be members of multiple Organizations with unique roles assigned for each membership. This action
          # assigns roles to a user only for the specified Organization. Roles cannot be assigned to a user across
          # multiple Organizations in the same call.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Organizations::Members::Roles::Types::AssignOrganizationMemberRolesRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :id
          # @option params [String] :user_id
          #
          # @return [untyped]
          def assign(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request_data = Auth0::Organizations::Members::Roles::Types::AssignOrganizationMemberRolesRequestContent.new(params).to_h
            non_body_param_names = %w[id user_id]
            body = request_data.except(*non_body_param_names)

            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/members/#{URI.encode_uri_component(params[:user_id].to_s)}/roles",
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

          # Remove one or more Organization-specific <a
          # href="https://auth0.com/docs/manage-users/access-control/rbac">roles</a> from a given user.
          #
          # Users can be members of multiple Organizations with unique roles assigned for each membership. This action
          # removes roles from a user in relation to the specified Organization. Roles assigned to the user within a
          # different Organization cannot be managed in the same call.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Organizations::Members::Roles::Types::DeleteOrganizationMemberRolesRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :id
          # @option params [String] :user_id
          #
          # @return [untyped]
          def delete(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request_data = Auth0::Organizations::Members::Roles::Types::DeleteOrganizationMemberRolesRequestContent.new(params).to_h
            non_body_param_names = %w[id user_id]
            body = request_data.except(*non_body_param_names)

            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "DELETE",
              path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/members/#{URI.encode_uri_component(params[:user_id].to_s)}/roles",
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
end
