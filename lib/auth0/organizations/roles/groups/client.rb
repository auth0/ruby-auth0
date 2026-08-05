# frozen_string_literal: true

module Auth0
  module Organizations
    module Roles
      module Groups
        class Client
          # @param client [Auth0::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # Retrieve the list of groups assigned to a role in the context of an organization.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :organization_id
          # @option params [String] :role_id
          # @option params [String, nil] :from
          # @option params [Integer, nil] :take
          #
          # @return [Auth0::Types::ListOrganizationRoleGroupsResponseContent]
          def list(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            query_params = {}
            query_params["from"] = params[:from] if params.key?(:from)
            query_params["take"] = params.fetch(:take, 50)

            Auth0::Internal::CursorItemIterator.new(
              cursor_field: :next_,
              item_field: :groups,
              initial_cursor: query_params["from"]
            ) do |next_cursor|
              query_params["from"] = next_cursor
              request = Auth0::Internal::JSON::Request.new(
                base_url: request_options[:base_url],
                method: "GET",
                path: "organizations/#{URI.encode_uri_component(params[:organization_id].to_s)}/roles/#{URI.encode_uri_component(params[:role_id].to_s)}/groups",
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
                parsed_response = Auth0::Types::ListOrganizationRoleGroupsResponseContent.load(response.body)
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
