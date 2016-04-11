module Auth0
  module Api
    module V2
      # https://auth0.com/docs/api/v2#!/Logs
      module Logs
        # https://auth0.com/docs/api/v2#!/Logs/get_logs
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

          path = '/api/v2/logs'
          get(path, request_params)
        end

        # https://auth0.com/docs/api/v2#!/Logs/get_logs_by_id
        def log(log_id)
          path = "/api/v2/logs/#{log_id}"
          get(path)
        end
      end
    end
  end
end
