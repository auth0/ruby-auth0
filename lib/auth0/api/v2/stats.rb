module Auth0
  module Api
    module V2
      # https://auth0.com/docs/apiv2#!/stats
      module Stats
        # https://auth0.com/docs/apiv2#!/stats/get_active_users
        def active_users
          path = '/api/v2/stats/active-users'
          get(path)
        end

        # https://auth0.com/docs/apiv2#!/stats/get_daily
        def daily_stats(from, to)
          path = '/api/v2/stats/daily'
          request_params = {
            from: from,
            to: to
          }
          get(path, request_params)
        end
      end
    end
  end
end
