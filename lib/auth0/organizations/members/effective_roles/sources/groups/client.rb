# frozen_string_literal: true

module Auth0
  module Organizations
    module Members
      module EffectiveRoles
        module Sources
          module Groups
            class Client
              # @param client [Auth0::Internal::Http::RawClient]
              #
              # @return [void]
              def initialize(client:)
                @client = client
              end

              # Lists the groups which grant the org member a given role.
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
              # @option params [String, nil] :from
              # @option params [Integer, nil] :take
              # @option params [String] :role_id
              #
              # @return [Auth0::Types::ListOrganizationMemberRoleSourceGroupsResponseContent]
              def list(request_options: {}, **params)
                params = Auth0::Internal::Types::Utils.normalize_keys(params)
                query_params = {}
                query_params["from"] = params[:from] if params.key?(:from)
                query_params["take"] = params.fetch(:take, 50)
                query_params["role_id"] = params[:role_id] if params.key?(:role_id)

                Auth0::Internal::CursorItemIterator.new(
                  cursor_field: :next_,
                  item_field: :groups,
                  initial_cursor: query_params["from"]
                ) do |next_cursor|
                  query_params["from"] = next_cursor
                  request = Auth0::Internal::JSON::Request.new(
                    base_url: request_options[:base_url],
                    method: "GET",
                    path: "organizations/#{URI.encode_uri_component(params[:id].to_s)}/members/#{URI.encode_uri_component(params[:user_id].to_s)}/effective-roles/sources/groups",
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
                    parsed_response = Auth0::Types::ListOrganizationMemberRoleSourceGroupsResponseContent.load(response.body)
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
end
