module Auth0
  module Api
    module V2
      # Describing all simple routes
      module Router
        private
        # Building simple routes. mb should be removed
        def path
          routes = {
            blacklisted_tokens:       "/api/v2/blacklists/tokens",
            add_token_to_blacklist:   "/api/v2/blacklists/tokens",
            clients:                  "/api/v2/clients",
            get_clients:              "/api/v2/clients",
            create_client:            "/api/v2/clients",
            active_users:             "/api/v2/stats/active-users",
            daily_stats:              "/api/v2/stats/daily",
            users:                    "/api/v2/users",
            get_users:                "/api/v2/users",
            create_user:              "/api/v2/users",
            delete_users:             "/api/v2/users"
          }
          called_method = caller[0][/`.*'/][1..-2]
          routes[called_method.to_sym]
        end
      end
    end
  end
end
