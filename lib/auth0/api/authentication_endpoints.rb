# rubocop:disable Metrics/ModuleLength
module Auth0
  module Api
    # {https://auth0.com/docs/auth-api}
    # Methods to use the authentication endpoints
    module AuthenticationEndpoints
      UP_AUTH = 'Username-Password-Authentication'.freeze
      JWT_BEARER = 'urn:ietf:params:oauth:grant-type:jwt-bearer'.freeze

      # Retrives an access token
      # @see https://auth0.com/docs/auth-api#!#post--oauth-access_token
      # @param access_token [string] Social provider's access_token
      # @param connection [string] Currently, this endpoint only works for Facebook, Google, Twitter and Weibo
      # @return [json] Returns the access token
      def obtain_access_token(access_token = nil, connection = 'facebook', scope = 'openid')
        if access_token
          request_params = { client_id: @client_id, access_token: access_token, connection: connection, scope: scope }
          post('/oauth/access_token', request_params)['access_token']
        else
          request_params = { client_id: @client_id, client_secret: @client_secret, grant_type: 'client_credentials' }
          post('/oauth/token', request_params)['access_token']
        end
      end

      # Logins using username/password
      # @see https://auth0.com/docs/auth-api#!#post--oauth-ro
      # @param username [string] Username
      # @param password [string] User's password
      # @param scope [string] Defaults to openid. Can be 'openid name email', 'openid offline_access'
      # @param id_token [string] Token's id
      # @param connection_name [string] Connection name. Works for database connections, passwordless connections,
      # Active Directory/LDAP, Windows Azure AD and ADF
      # @return [json] Returns the access token and id token
      def login(username, password, id_token = nil, connection_name = UP_AUTH, options = {})
        fail Auth0::InvalidParameter, 'Must supply a valid username' if username.to_s.empty?
        fail Auth0::InvalidParameter, 'Must supply a valid password' if password.to_s.empty?
        request_params = {
          client_id:  @client_id,
          username:   username,
          password:   password,
          scope:      options.fetch(:scope, 'openid'),
          connection: connection_name,
          grant_type: options.fetch(:grant_type, password),
          id_token:   id_token,
          device:     options.fetch(:device, nil)
        }
        post('/oauth/ro', request_params)
      end

      # Signup using username/password
      # @see https://auth0.com/docs/auth-api#!#post--dbconnections-signup
      # @param email [string] User email
      # @param password [string] User's password
      # @param connection_name [string] Connection name. Works for database connections.
      # @return [json] Returns the created user
      def signup(email, password, connection_name = UP_AUTH)
        fail Auth0::InvalidParameter, 'Must supply a valid email' if email.to_s.empty?
        fail Auth0::InvalidParameter, 'Must supply a valid password' if password.to_s.empty?
        request_params = {
          client_id:  @client_id,
          email:      email,
          connection: connection_name,
          password:   password
        }
        post('/dbconnections/signup', request_params)
      end

      # Asks to change a password for a given user.
      # Send an email to the user.
      # @see https://auth0.com/docs/auth-api#!#post--dbconnections-change_password
      # @param email [string] User email
      # @param password [string] User's new password
      # @param connection_name [string] Connection name. Works for database connections.
      def change_password(email, password, connection_name = UP_AUTH)
        fail Auth0::InvalidParameter, 'Must supply a valid email' if email.to_s.empty?
        request_params = {
          client_id:  @client_id,
          email:      email,
          connection: connection_name,
          password:   password
        }
        post('/dbconnections/change_password', request_params)
      end

      # Start passwordless workflow sending an email
      # @see https://auth0.com/docs/auth-api#!#post--with_email
      # @param email [string] User email
      # @param send [string] Defaults to 'link'. Can be 'code'. You can then authenticate with this user opening the link
      # @param auth_params [hash] Append/override parameters to the link (like scope, redirect_uri, protocol, etc.)
      def start_passwordless_email_flow(email, send = 'link', auth_params = {})
        fail Auth0::InvalidParameter, 'Must supply a valid email' if email.to_s.empty?
        request_params = {
          client_id:    @client_id,
          email:        email,
          send:         send,
          auth_params:  auth_params
        }
        post('/passwordless/start', request_params)
      end

      # Start passwordless workflow sending a SMS message
      # @see https://auth0.com/docs/auth-api#!#post--with_sms
      # @param phone_number [string] User's phone number.
      def start_passwordless_sms_flow(phone_number)
        fail Auth0::InvalidParameter, 'Must supply a valid phone number' if phone_number.to_s.empty?
        request_params = {
          client_id:    @client_id,
          connection:   'sms',
          phone_number: phone_number
        }
        post('/passwordless/start', request_params)
      end

      # Logins using phone number/verification code.
      # @see https://auth0.com/docs/auth-api#!#post--ro_with_sms
      # @param phone_number [string] User's phone number.
      # @param code [string] Verification code.
      # @return [json] Returns the access token and id token
      def phone_login(phone_number, code, scope = 'openid')
        fail Auth0::InvalidParameter, 'Must supply a valid phone number' if phone_number.to_s.empty?
        fail Auth0::InvalidParameter, 'Must supply a valid code' if code.to_s.empty?
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

      # Retrives the SAML 2.0 metadata
      # @see https://auth0.com/docs/auth-api#!#get--samlp--client_id-
      # @param client_id [string] Client id
      # @return [xml] SAML 2.0 metadata
      def saml_metadata(client_id)
        fail Auth0::InvalidParameter, 'Must supply a valid client_id' if client_id.to_s.empty?
        get("/samlp/metadata/#{client_id}")
      end

      # Retrives the WS-Federation metadata
      # @see https://auth0.com/docs/auth-api#!#get--wsfed--client_id-
      # @return [xml] Federation Metadata
      def wsfed_metadata
        get('/wsfed/FederationMetadata/2007-06/FederationMetadata.xml')
      end

      # Validates a JSON Web Token (signature and expiration)
      # @see https://auth0.com/docs/auth-api#!#post--tokeninfo
      # @param id_token [string] Token's id.
      # @return User information associated with the user id (sub property) of the token.
      def token_info(id_token)
        fail Auth0::InvalidParameter, 'Must supply a valid id_token' if id_token.to_s.empty?
        request_params = { id_token: id_token }
        post('/tokeninfo', request_params)
      end

      # Refreshes a delegation token
      # @see https://auth0.com/docs/auth-api#!#post--delegation
      # @param refresh_token [string] Token to refresh
      # @param target [string] Target to sign the new token.
      # @param scope [string] Defaults to openid. Can be 'openid name email'.
      # @param api_type [string] Defaults to app. Can be aws, azure_sb, azure_blob, firebase, layer, salesforce_api,
      #  salesforce_sandbox_api, sap_api or wams
      # @param extra_parameters [hash] Extra parameters.
      # @return [json] Returns the refreshed delegation token
      def refresh_delegation(refresh_token, target, scope = 'openid', api_type = 'app', extra_parameters = {})
        fail Auth0::InvalidParameter, 'Must supply a valid token to refresh' if refresh_token.to_s.empty?
        request_params = {
          client_id:      @client_id,
          grant_type:     JWT_BEARER,
          refresh_token:  refresh_token,
          target:         target,
          api_type:       api_type,
          scope:          scope
        }.merge(extra_parameters)
        post('/delegation', request_params)
      end

      # Retrives a delegation token
      # @see https://auth0.com/docs/auth-api#!#post--delegation
      # @param id_token [string] Token's id.
      # @param target [string] Target to sign the new token.
      # @param scope [string] Defaults to openid. Can be 'openid name email'.
      # @param api_type [string] Defaults to app. Can be aws, azure_sb, azure_blob, firebase, layer, salesforce_api,
      #  salesforce_sandbox_api, sap_api or wams
      # @param extra_parameters [hash] Extra parameters.
      # @return [json] Returns the refreshed delegation token
      def delegation(id_token, target, scope = 'openid', api_type = 'app', extra_parameters = {})
        fail Auth0::InvalidParameter, 'Must supply a valid id_token' if id_token.to_s.empty?
        request_params = {
          client_id:  @client_id,
          grant_type: JWT_BEARER,
          id_token:   id_token,
          target:     target,
          api_type:   api_type,
          scope:      scope
        }.merge(extra_parameters)
        post('/delegation', request_params)
      end

      # Retrives an impersonation URL to login as another user
      # @see https://auth0.com/docs/auth-api#!#post--users--user_id--impersonate
      # @param user_id [string] Impersonate user id
      # @param options [string] Additional Parameters
      # @return [string] Impersonation URL
      def impersonate(user_id, options)
        fail Auth0::InvalidParameter, 'Must supply a valid user_id' if user_id.to_s.empty?
        fail Auth0::MissingParameter, 'Must supply client_secret' if @client_secret.nil?
        authorization_header obtain_access_token
        result = post("/users/#{user_id}/impersonate", impersonate_request_params(options))
        authorization_header @token
        result
      end

      # Unlinks a User
      # @see https://auth0.com/docs/auth-api#!#post--unlink
      # @param access_token [string] Logged-in user access token
      # @param user_id [string] User Id
      def unlink_user(access_token, user_id)
        fail Auth0::InvalidParameter, 'Must supply a valid access_token' if access_token.to_s.empty?
        fail Auth0::InvalidParameter, 'Must supply a valid user_id' if user_id.to_s.empty?
        request_params = {
          access_token:  access_token,
          user_id: user_id
        }
        post('/unlink', request_params)
      end

      # Returns the user information based on the Auth0 access token.
      # @see https://auth0.com/docs/auth-api#!#get--userinfo
      # @return [json] User information based on the Auth0 access token
      def user_info
        get('/userinfo')
      end

      # Returns an authorization URL, triggers a redirect.
      # @see https://auth0.com/docs/auth-api#!#get--authorize_social
      # @param redirect_uri [string] Url to redirect after authorization
      # @param options [hash] Can contain response_type, connection, state and additional_parameters.
      # @return [url] Authorization URL.
      def authorization_url(redirect_uri, options = {})
        fail Auth0::InvalidParameter, 'Must supply a valid redirect_uri' if redirect_uri.to_s.empty?
        request_params = {
          client_id: @client_id,
          response_type: options.fetch(:connection, 'code'),
          connection: options.fetch(:connection, nil),
          redirect_url: redirect_uri,
          state: options.fetch(:state, nil)
        }.merge(options.fetch(:additional_parameters, {}))

        URI::HTTPS.build(host: @domain, path: '/authorize', query: to_query(request_params))
      end

      # Returns an logout  URL, triggers the logout flow.
      # @see https://auth0.com/docs/auth-api#!#get--logout
      # @param return_to [string] Url to redirect after authorization
      # @return [url] Logout URL.
      def logout_url(return_to)
        request_params = {
          returnTo: return_to
        }

        URI::HTTPS.build(host: @domain, path: '/logout', query: to_query(request_params))
      end

      # Returns a samlp URL. The SAML Request AssertionConsumerServiceURL will be used to POST back the assertion
      # and it has to match with the application callback URL.
      # @see https://auth0.com/docs/auth-api#get--samlp--client_id-
      # @param connection [string] to login with a specific provider.
      # @return [url] samlp URL.
      def samlp_url(connection = UP_AUTH)
        request_params = {
          connection: connection
        }
        URI::HTTPS.build(host: @domain, path: "/samlp/#{@client_id}", query: to_query(request_params))
      end

      # Returns a wsfed URL.
      # @see https://auth0.com/docs/auth-api#get--wsfed--client_id-
      # @param connection [string] to login with a specific provider.
      # @return [url] wsfed URL.
      def wsfed_url(connection = UP_AUTH)
        request_params = {
          whr: connection
        }
        URI::HTTPS.build(host: @domain, path: "/wsfed/#{@client_id}", query: to_query(request_params))
      end

      private

      def to_query(hash)
        hash.map { |k, v| "#{k}=#{URI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
      end

      def impersonate_request_params
        {
          client_id: @client_id,
          response_type: options.fetch(:connection, 'code'),
          connection: options.fetch(:connection, nil),
          redirect_url: redirect_uri,
          state: options.fetch(:state, nil)
        }.merge(options.fetch(:additional_parameters, {}))
      end
    end
  end
end
