# frozen_string_literal: true

module Auth0
  module Logs
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve log entries that match the specified search criteria (or all log entries if no criteria specified).
      #
      # Set custom search criteria using the <code>q</code> parameter, or search from a specific log ID (<i>"search from
      # checkpoint"</i>).
      #
      # For more information on all possible event types, their respective acronyms, and descriptions, see <a
      # href="https://auth0.com/docs/logs/log-event-type-codes">Log Event Type Codes</a>.
      #
      # <h5>To set custom search criteria, use the following parameters:</h5>
      #
      # <ul>
      # <li><b>q:</b> Search Criteria using <a href="https://auth0.com/docs/logs/log-search-query-syntax">Query String
      # Syntax</a></li>
      #     <li><b>page:</b> Page index of the results to return. First page is 0.</li>
      #     <li><b>per_page:</b> Number of results per page.</li>
      # <li><b>sort:</b> Field to use for sorting appended with `:1` for ascending and `:-1` for descending. e.g.
      # `date:-1`</li>
      # <li><b>fields:</b> Comma-separated list of fields to include or exclude (depending on include_fields) from the
      # result, empty to retrieve all fields.</li>
      #     <li><b>include_fields:</b> Whether specified fields are to be included (true) or excluded (false).</li>
      # <li><b>include_totals:</b> Return results inside an object that contains the total result count (true) or as a
      # direct array of results (false, default). <b>Deprecated:</b> this field is deprecated and should be removed from
      # use. See <a
      # href="https://auth0.com/docs/product-lifecycle/deprecations-and-migrations/migrate-to-tenant-log-search-v3#pagination">Search
      # Engine V3 Breaking Changes</a></li>
      # </ul>
      #
      # For more information on the list of fields that can be used in <code>fields</code> and <code>sort</code>, see <a
      # href="https://auth0.com/docs/logs/log-search-query-syntax#searchable-fields">Searchable Fields</a>.
      #
      # Auth0 <a href="https://auth0.com/docs/logs/retrieve-log-events-using-mgmt-api#limitations">limits the number of
      # logs</a> you can return by search criteria to 100 logs per request. Furthermore, you may paginate only through
      # 1,000 search results. If you exceed this threshold, please redefine your search or use the <a
      # href="https://auth0.com/docs/logs/retrieve-log-events-using-mgmt-api#retrieve-logs-by-checkpoint">get logs by
      # checkpoint method</a>.
      #
      # <h5>To search from a checkpoint log ID, use the following parameters:</h5>
      # <ul>
      # <li><b>from:</b> Log Event ID from which to start retrieving logs. You can limit the number of logs returned
      # using the <code>take</code> parameter. If you use <code>from</code> at the same time as <code>q</code>,
      # <code>from</code> takes precedence and <code>q</code> is ignored.</li>
      #     <li><b>take:</b> Number of entries to retrieve when using the <code>from</code> parameter.</li>
      # </ul>
      #
      # <strong>Important:</strong> When fetching logs from a checkpoint log ID, any parameter other than
      # <code>from</code> and <code>take</code> will be ignored, and date ordering is not guaranteed.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :per_page
      # @option params [String, nil] :sort
      # @option params [String, nil] :fields
      # @option params [Boolean, nil] :include_fields
      # @option params [Boolean, nil] :include_totals
      # @option params [String, nil] :search
      #
      # @return [Auth0::Types::ListLogOffsetPaginatedResponseContent]
      def list(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[page per_page sort fields include_fields include_totals search]
        query_params = {}
        query_params["page"] = params.fetch(:page, 0)
        query_params["per_page"] = params.fetch(:per_page, 50)
        query_params["sort"] = params[:sort] if params.key?(:sort)
        query_params["fields"] = params[:fields] if params.key?(:fields)
        query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)
        query_params["include_totals"] = params.fetch(:include_totals, true)
        query_params["search"] = params[:search] if params.key?(:search)
        params.except(*query_param_names)

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
            path: "logs",
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
            Auth0::Types::ListLogOffsetPaginatedResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Retrieve an individual log event.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Auth0::Types::GetLogResponseContent]
      def get(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "logs/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::GetLogResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
