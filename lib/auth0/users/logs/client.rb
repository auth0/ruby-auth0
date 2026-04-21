# frozen_string_literal: true

module Auth0
  module Users
    module Logs
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve log events for a specific user.
        #
        # Note: For more information on all possible event types, their respective acronyms and descriptions, see <a
        # href="https://auth0.com/docs/logs/log-event-type-codes">Log Event Type Codes</a>.
        #
        # For more information on the list of fields that can be used in `sort`, see <a
        # href="https://auth0.com/docs/logs/log-search-query-syntax#searchable-fields">Searchable Fields</a>.
        #
        # Auth0 <a href="https://auth0.com/docs/logs/retrieve-log-events-using-mgmt-api#limitations">limits the number
        # of logs</a> you can return by search criteria to 100 logs per request. Furthermore, you may only paginate
        # through up to 1,000 search results. If you exceed this threshold, please redefine your search.
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
        # @option params [String, nil] :sort
        # @option params [Boolean, nil] :include_totals
        #
        # @return [Auth0::Types::UserListLogOffsetPaginatedResponseContent]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[page per_page sort include_totals]
          query_params = {}
          query_params["page"] = params.fetch(:page, 0)
          query_params["per_page"] = params.fetch(:per_page, 50)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          query_params["include_totals"] = params.fetch(:include_totals, true)
          params = params.except(*query_param_names)

          Auth0::Internal::OffsetItemIterator.new(
            initial_page: query_params["page"],
            item_field: :logs,
            has_next_field: nil,
            step: true
          ) do |next_page|
            query_params["page"] = next_page
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "users/#{URI.encode_uri_component(params[:id].to_s)}/logs",
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
              Auth0::Types::UserListLogOffsetPaginatedResponseContent.load(response.body)
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
