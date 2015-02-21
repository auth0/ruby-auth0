module Auth0
  module Api
    module V2
      module Stats
        def active_users
          get(path)
        end

        def daily_stats(from, to)
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
