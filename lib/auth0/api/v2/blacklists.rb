module Auth0
  module Api
    module V2
      # https://auth0.com/docs/apiv2#!/blacklists
      module Blacklists
        # https://auth0.com/docs/apiv2#!/blacklists/get_tokens
        def blacklisted_tokens
          path = '/api/v2/blacklists/tokens'
          get(path)
        end

        # https://auth0.com/docs/apiv2#!/blacklists/post_tokens
        def add_token_to_blacklist(jti, aud = nil)
          request_params = {
            jti: jti,
            aud: aud
          }
          path = '/api/v2/blacklists/tokens'
          post(path, request_params)
        end
      end
    end
  end
end
