module Auth0
  module Api
    module V2
      # Methods to use the logs endpoints
      module Logs

        # Retrieves log entries that match the specified search criteria.
        # @see https://auth0.com/docs/api/v2#!/Logs/get_logs
        # @param q [string] Query in Lucene query string syntax.
        # @param page [integer] The page number. Zero based.
        # @param per_page [integer] The amount of entries per page. Default: 50. Max value: 100
        # @param sort [string] The field to use for sorting. 1 == ascending and -1 == descending
        # @param fields [string] A comma separated list of fields to include or exclude from the result.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        # @param include_totals [string]  True if a query summary must be included in the result, false otherwise.
        # @param from [string] Log Event Id to start retrieving logs. You can limit the amount of logs using the take parameter.
        # @param take [integer] The total amount of entries to retrieve when using the from parameter. Default: 50. Max value: 100.
        #
        # @return [json] The list of existing log entries.
        def logs(options = {})
          request_params = {
            q: options.fetch(:q, nil),
            page: options.fetch(:page, nil),
            per_page: options.fetch(:per_page, nil),
            sort: options.fetch(:sort, nil),
            fields: options.fetch(:fields, nil),
            include_fields: options.fetch(:include_fields, nil),
            include_totals: options.fetch(:include_totals, nil),
            from: options.fetch(:from, nil),
            take: options.fetch(:take, nil)
          }
          get(logs_path, request_params)
        end
        alias_method :get_logs, :logs


        # Retrieves log entries that match the specified search criteria.
        # @see https://auth0.com/docs/api/v2#!/Logs/get_logs_by_id
        # @param id [string]  The log_id of the log to retrieve.
        #
        # @return [json] the log with the given id if exists
        def log(log_id)
          fail Auth0::MissingParameter, 'Must supply a valid log_id' if log_id.to_s.empty?
          path = "#{logs_path}/#{log_id}"
          get(path)
        end
        alias_method :get_logs_by_id, :log

        # Users API path
        def logs_path
          @logs_path ||= '/api/v2/logs'
        end
      end
    end
  end
end
