# rubocop:disable Metrics/ModuleLength
module Auth0
  module Api
    # {https://auth0.com/docs/auth-api}
    # Describing functionality of auth0 authentication endpoints
    module AuthenticationEndpoints
      UP_AUTH = 'Username-Password-Authentication'

      # {https://auth0.com/docs/auth-api#!#post--oauth-access_token}
      def obtain_access_token(access_token = nil, connection = 'facebook', scope = 'openid')
        if access_token
          request_params = { client_id: @client_id, access_token: access_token, connection: connection, scope: scope }
          post('/oauth/access_token', request_params)['access_token']
        else
          request_params = { client_id: @client_id, client_secret: @client_secret, grant_type: 'client_credentials' }
          post('/oauth/token', request_params)['access_token']
        end
      end

      # {https://auth0.com/docs/auth-api#!#post--delegation}
      def refresh_delegation(refresh_token, target, scope = 'openid', api_type = 'app', extra_parameters = {})
        request_params = {
          client_id:      @client_id,
          grant_type:     'urn:ietf:params:oauth:grant-type:jwt-bearer',
          refresh_token:  refresh_token,
          target:         target,
          api_type:       api_type,
          scope:          scope
        }.merge(extra_parameters)
        post('/delegation', request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--delegation}
      def delegation(id_token, target, scope = 'openid', api_type = 'app', extra_parameters = {})
        request_params = {
          client_id:  @client_id,
          grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
          id_token:   id_token,
          target:     target,
          api_type:   api_type,
          scope:      scope
        }.merge(extra_parameters)
        post('/delegation', request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--delegation}
      def refresh_delegation(refresh_token, target, scope = 'openid', api_type = 'app', extra_parameters = {})
        request_params = {
          client_id:      @client_id,
          grant_type:     'urn:ietf:params:oauth:grant-type:jwt-bearer',
          refresh_token:  refresh_token,
          target:         target,
          api_type:       api_type,
          scope:          scope
        }.merge(extra_parameters)
        post('/delegation', request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--users--user_id--impersonate}
      def impersonate(user_id, app_client_id, impersonator_id, options)
        request_params = {
          protocol:         options.fetch(:protocol, 'oauth2'),
          impersonator_id:  impersonator_id,
          client_id:        app_client_id,
          ttl:              options.fetch(:ttl, 120),
          additionalParameters: {
            response_type:  options.fetch(:response_type, 'code'),
            state:          options.fetch(:state, ''),
            scope:          options.fetch(:scope, 'openid'),
            callback_url:   options.fetch(:callback_url, '')
          }
        }
        post("/users/#{user_id}/impersonate", request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--oauth-ro}
      def login(username, password, scope = 'openid', id_token = nil, connection_name = UP_AUTH)
        request_params = {
          client_id:  @client_id,
          username:   username,
          password:   password,
          scope:      scope,
          connection: connection_name,
          grant_type: 'password',
          id_token:   id_token
        }
        post('/oauth/ro', request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--ro_with_sms}
      def phone_login(phone_number, code, scope = 'openid')
        request_params = {
          client_id:  @client_id,
          username:   phone_number,
          password:   code,
          scope:      scope,
          connection: 'sms',
          grant_type: 'password'
        }
        post('/oauth/ro', request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--dbconnections-signup}
      def signup(email, password, connection_name = UP_AUTH)
        request_params = {
          client_id:  @client_id,
          email:      email,
          connection: connection_name,
          password:   password
        }
        post('/dbconnections/signup', request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--dbconnections-change_password}
      def change_password(email, password, connection_name = UP_AUTH)
        request_params = {
          client_id:  @client_id,
          email:      email,
          connection: connection_name,
          password:   password
        }
        post('/dbconnections/change_password', request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--with_email}
      def start_passwordless_email_flow(email, send = 'link', auth_params = {})
        request_params = {
          client_id:  @client_id,
          email:      email,
          send: send,
          auth_params: auth_params
        }
        post('/passwordless/start', request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--with_email}
      def start_passwordless_sms_flow(phone_number)
        request_params = {
          client_id:  @client_id,
          connection: 'sms',
          phone_number: phone_number
        }
        post('/passwordless/start', request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--unlink}
      def unlink_user(access_token, user_id)
        request_params = {
          access_token:  access_token,
          user_id: user_id
        }
        post('/unlink', request_params)
      end

      # {https://auth0.com/docs/auth-api#!#post--tokeninfo}
      def token_info(id_token)
        request_params = { id_token: id_token }
        post('/tokeninfo', request_params)
      end

      # {https://auth0.com/docs/auth-api#!#get--userinfo}
      def user_info
        get('/userinfo')
      end

      # {https://auth0.com/docs/auth-api#!#get--samlp--client_id-}
      def saml_metadata(client_id)
        get("/samlp/metadata/#{client_id}")
      end

      # {https://auth0.com/docs/auth-api#!#get--samlp--client_id-}
      def wsfed_metadata
        get('/wsfed/FederationMetadata/2007-06/FederationMetadata.xml')
      end
    end
  end
end
