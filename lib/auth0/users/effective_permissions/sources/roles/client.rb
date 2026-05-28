# frozen_string_literal: true

module Auth0
  module Users
    module EffectivePermissions
      module Sources
        module Roles
          class Client
            # @param client [Auth0::Internal::Http::RawClient]
            #
            # @return [void]
            def initialize(client:)
              @client = client
            end

            # Lists the roles which grant the user a given permission, including roles assigned directly to the user and
            # those inherited through group memberships.
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
            # @option params [String] :resource_server_identifier
            # @option params [String] :permission_name
            #
            # @return [Auth0::Types::ListUserEffectivePermissionRoleSourcesResponseContent]
            def list(request_options: {}, **params)
              params = Auth0::Internal::Types::Utils.normalize_keys(params)
              query_params = {}
              query_params["from"] = params[:from] if params.key?(:from)
              query_params["take"] = params.fetch(:take, 50)
              query_params["resource_server_identifier"] = params[:resource_server_identifier] if params.key?(:resource_server_identifier)
              query_params["permission_name"] = params[:permission_name] if params.key?(:permission_name)

              Auth0::Internal::CursorItemIterator.new(
                cursor_field: :next_,
                item_field: :roles,
                initial_cursor: query_params["from"]
              ) do |next_cursor|
                query_params["from"] = next_cursor
                request = Auth0::Internal::JSON::Request.new(
                  base_url: request_options[:base_url],
                  method: "GET",
                  path: "users/#{URI.encode_uri_component(params[:id].to_s)}/effective-permissions/sources/effective-roles",
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
                  parsed_response = Auth0::Types::ListUserEffectivePermissionRoleSourcesResponseContent.load(response.body)
                  [parsed_response, response]
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
  end
end
