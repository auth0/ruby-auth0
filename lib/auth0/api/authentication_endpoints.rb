module Auth0
  module Api
    # {https://auth0.com/docs/auth-api}
    # Describing functionality of auth0 authentication endpoints
    module AuthenticationEndpoints
      # {https://auth0.com/docs/auth-api#!#post--oauth-access_token}
      def obtain_access_token
        request_params = {
            client_id:      @client_id,
            client_secret:  @client_secret,
            grant_type:     'client_credentials'
        }
        post("/oauth/token", request_params)["access_token"]
      end

      # {https://auth0.com/docs/auth-api#!#post--delegation}
      def delegation(id_token, target, scope = "openid", api_type = "app")
        request_params = {
                      client_id:  @client_id,
                      grant_type: "urn:ietf:params:oauth:grant-type:jwt-bearer",
                      id_token:   id_token,
                      target:     target,
                      api_type:   api_type,
                      scope:      scope
        }
        post("/delegation", request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--oauth-ro}
      def login(username, password, scope = "openid", id_token=nil, connection_name="Username-Password-Authentication")
        request_params = {
          client_id:  @client_id,
          username:   username,
          password:   password,
          scope:      scope,
          connection: connection_name,
          grant_type: "password",
          id_token:   id_token
        }
        post("/oauth/ro", request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--dbconnections-signup}
      def signup(email, password, connection_name= "Username-Password-Authentication")
        request_params = {
          client_id:  @client_id,
          email:      email,
          connection: connection_name,
          password:   password
        }
        post("/dbconnections/signup", request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--dbconnections-change_password}
      def change_password(email, password, connection_name = "Username-Password-Authentication")
        request_params = {
          client_id:  @client_id,
          email:      email,
          connection: connection_name,
          password:   password
        }
        post("/dbconnections/change_password", request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--tokeninfo}
      def token_info(id_token)
        request_params = { id_token: id_token}
        post("/tokeninfo", request_params)
      end
    end
  end
end
