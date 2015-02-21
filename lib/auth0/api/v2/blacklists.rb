module Auth0
  module Api
    module V2
      module Blacklists
        def blacklisted_tokens
          get(path)
        end

        def add_token_to_blacklist(jti, aud=nil)
          request_params = {
            jti: jti,
            aud: aud
          }
          post(path, request_params)
        end
      end
    end
  end
end
