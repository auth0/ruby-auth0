# frozen_string_literal: true

module Auth0
  module Users
    module Organizations
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve list of the specified user's current Organization memberships. User must be specified by user ID. For
        # more information, review [Auth0 Organizations](https://auth0.com/docs/manage-users/organizations).
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [Integer, nil] :page
        # @option params [Integer, nil] :per_page
        # @option params [Boolean, nil] :include_totals
        #
        # @return [Auth0::Types::ListUserOrganizationsOffsetPaginatedResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["page"] = params.fetch(:page, 0)
          query_params["per_page"] = params.fetch(:per_page, 50)
          query_params["include_totals"] = params.fetch(:include_totals, true)

          Auth0::Internal::OffsetItemIterator.new(
            initial_page: query_params["page"],
            item_field: :organizations,
            has_next_field: nil,
            step: false
          ) do |next_page|
            query_params["page"] = next_page
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "users/#{URI.encode_uri_component(params[:id].to_s)}/organizations",
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
              parsed_response = Auth0::Types::ListUserOrganizationsOffsetPaginatedResponseContent.load(response.body)
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
