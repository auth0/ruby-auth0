# frozen_string_literal: true

module Auth0
  module Organizations
    module Members
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # List organization members.
        # This endpoint is subject to eventual consistency. New users may not be immediately included in the response
        # and deleted users may not be immediately removed from it.
        #
        # <ul>
        #   <li>
        # Use the <code>fields</code> parameter to optionally define the specific member details retrieved. If
        # <code>fields</code> is left blank, all fields (except roles) are returned.
        #   </li>
        #   <li>
        # Member roles are not sent by default. Use <code>fields=roles</code> to retrieve the roles assigned to each
        # listed member. To use this parameter, you must include the <code>read:organization_member_roles</code> scope
        # in the token.
        #   </li>
        # </ul>
        #
        # This endpoint supports two types of pagination:
        #
        # - Offset pagination
        # - Checkpoint pagination
        #
        # Checkpoint pagination must be used if you need to retrieve more than 1000 organization members.
        #
        # <h2>Checkpoint Pagination</h2>
        #
        # To search by checkpoint, use the following parameters: - from: Optional id from which to start selection. -
        # take: The total amount of entries to retrieve when using the from parameter. Defaults to 50. Note: The first
        # time you call this endpoint using Checkpoint Pagination, you should omit the <code>from</code> parameter. If
        # there are more results, a <code>next</code> value will be included in the response. You can use this for
        # subsequent API calls. When <code>next</code> is no longer included in the response, this indicates there are
        # no more pages remaining.
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
        # @option params [String, nil] :fields
        # @option params [Boolean, nil] :include_fields
        #
        # @return [Auth0::Types::ListOrganizationMembersPaginatedResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[from take fields include_fields]
          query_params = {}
          query_params["from"] = params[:from] if params.key?(:from)
          query_params["take"] = params.fetch(:take, 50)
          query_params["fields"] = params[:fields] if params.key?(:fields)
          query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)
          params = params.except(*query_param_names)

          Auth0::Internal::CursorItemIterator.new(
            cursor_field: :next_,
            item_field: :members,
            initial_cursor: query_params["from"]
          ) do |next_cursor|
            query_params["from"] = next_cursor
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/members",
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
              Auth0::Types::ListOrganizationMembersPaginatedResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Set one or more existing users as members of a specific <a
        # href="https://auth0.com/docs/manage-users/organizations">Organization</a>.
        #
        # To add a user to an Organization through this action, the user must already exist in your tenant. If a user
        # does not yet exist, you can <a
        # href="https://auth0.com/docs/manage-users/organizations/configure-organizations/invite-members">invite them to
        # create an account</a>, manually create them through the Auth0 Dashboard, or use the Management API.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Organizations::Members::Types::CreateOrganizationMemberRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [untyped]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Organizations::Members::Types::CreateOrganizationMemberRequestContent.new(params).to_h
          non_body_param_names = ["id"]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/members",
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

        # @param request_options [Hash]
        # @param params [Auth0::Organizations::Members::Types::DeleteOrganizationMembersRequestContent]
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
          request_data = Auth0::Organizations::Members::Types::DeleteOrganizationMembersRequestContent.new(params).to_h
          non_body_param_names = ["id"]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/members",
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

        # @return [Auth0::Roles::Client]
        def roles
          @roles ||= Auth0::Organizations::Members::Roles::Client.new(client: @client)
        end
      end
    end
  end
end
