module Auth0
  module Api
    module V2
      # Methods to use the blacklist endpoints
      module Blacklists
        # Retrieves the jti and aud of all tokens in the blacklist.
        # @see https://auth0.com/docs/api/v2#!/Blacklists/get_tokens
        # @param aud [string] The JWT's aud claim. The client_id of the client for which it was issued
        #
        # @return [json] Returns the blacklisted tokens
        #
        def blacklisted_tokens(aud = nil)
          path = '/api/v2/blacklists/tokens'
          request_params = {
            aud: aud
          }
          get(path, request_params)
        end

        # Adds the token identified by the jti to a blacklist for the tenant.
        # @see https://auth0.com/docs/api/v2#!/blacklists/post_tokens
        # @param jti [string] The jti of the JWT to blacklist
        # @param aud [string] The JWT's aud claim. The client_id of the client for which it was issued
        # @return [json] Returns the blacklisted token
        #
        def add_token_to_blacklist(jti, aud = nil)
          fail Auth0::MissingParameter, 'Must specify a valid JTI' if jti.to_s.empty?
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
