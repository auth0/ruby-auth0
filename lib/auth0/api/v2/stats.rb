module Auth0
  module Api
    module V2
      # Methods to use the stats endpoints
      module Stats
        attr_reader :stats_path

        # Gets the active users count (logged in during the last 30 days).
        # @see https://auth0.com/docs/api/v2#!/Stats/get_active_users
        #
        # @return [integer] Returns the active users count.
        def active_users
          path = "#{stats_path}/active-users"
          get(path)
        end

        # Gets the daily stats for a particular period.
        # @see https://auth0.com/docs/api/v2#!/Stats/get_daily
        # @param from [string] The first day of the period (inclusive) in YYYYMMDD format.
        # @param to [string] The last day of the period (inclusive) in YYYYMMDD format.
        #
        # @return [json] Returns the daily stats.
        def daily_stats(from, to)
          path = "#{stats_path}/daily"
          request_params = {
            from: from,
            to: to
          }
          get(path, request_params)
        end

        private

        # Stats API path
        def stats_path
          @stats_path ||= '/api/v2/stats'
        end
      end
    end
  end
end
