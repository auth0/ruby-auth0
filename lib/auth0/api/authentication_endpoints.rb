# rubocop:disable Metrics/ModuleLength
module Auth0
  module Api
    # {https://auth0.com/docs/auth-api}
    # Methods to use the authentication endpoints
    module AuthenticationEndpoints
      UP_AUTH = 'Username-Password-Authentication'.freeze
      JWT_BEARER = 'urn:ietf:params:oauth:grant-type:jwt-bearer'.freeze

      # This is the OAuth 2.0 grant that server processes utilize in order to access an API.
      # Use this endpoint to directly request an access_token by using the Client Credentials
      # @see https://auth0.com/docs/api/authentication#client-credentials
      # @param audience [string] The unique identifier of the target API you want to access.
      # @return [json] Returns the access token
      def token_with_client_credentials(audience = nil)
        request_params = {
          client_id:     @client_id,
          client_secret: @client_secret,
          grant_type:    'client_credentials',
          audience:      audience
        }
        post('/oauth/token', request_params)
      end

      # Gets the user tokens using the code obtained through passive authentication in the specified connection
      # @see https://auth0.com/docs/auth-api#!#post--oauth-access_token
      # @param connection [string] Currently, this endpoint only works for Facebook, Google, Twitter and Weibo
      # @param redirect_uri [string] Url to redirect after authorization
      # @param code [string] The access code obtained through passive authentication
      # @return [json] Returns the access_token and id_token
      def user_tokens_from_code(code, redirect_uri)
        raise Auth0::InvalidParameter, 'Must supply a valid code' if code.to_s.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid redirect_uri' if redirect_uri.to_s.empty?
        request_params = {
          client_id:     @client_id,
          client_secret: @client_secret,
          grant_type:    'authorization_code',
          code:          code,
          redirect_uri:  redirect_uri
        }
        post('/oauth/token', request_params)
      end

      # This is the OAuth 2.0 grant that highly trusted apps utilize in order to access an API
      # @see https://auth0.com/docs/api/authentication#resource-owner-password
      # @param username [string] Resource Owner's identifier.
      # @param password [string] Resource Owner's secret.
      # @param audience [string] API Identifier that the client is requesting access to.
      # @param scope [string] String value of the different scopes the client is asking for.
      # @return [json] Returns the access_token and id_token
      def login_with_default_directory(username, password, audience = nil, scope = 'openid')
        raise Auth0::InvalidParameter, 'Must supply a valid username' if username.to_s.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid password' if password.to_s.empty?
        request_params = {
          grant_type:    'password',
          username:      username,
          password:      password,
          audience:      audience,
          client_id:     @client_id,
          client_secret: @client_secret,
          scope:         scope
        }
        post('/oauth/token', request_params)
      end

      # This is the OAuth 2.0 grant that highly trusted apps utilize in order to access an API
      # @see https://auth0.com/docs/api/authentication#resource-owner-password
      # @param username [string] Resource Owner's identifier.
      # @param password [string] Resource Owner's secret.
      # @param audience [string] API Identifier that the client is requesting access to.
      # @param realm [string] The realm the user belongs to. This maps to a connection in Auth0.
      # @param scope [string] String value of the different scopes the client is asking for.
      # @return [json] Returns the access_token and id_token
      def login_with_default_directory_realm(username, password, audience = nil, realm = nil, scope = 'openid')
        raise Auth0::InvalidParameter, 'Must supply a valid username' if username.to_s.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid password' if password.to_s.empty?
        request_params = {
          grant_type:    'http://auth0.com/oauth/grant-type/password-realm',
          username:      username,
          password:      password,
          audience:      audience,
          client_id:     @client_id,
          client_secret: @client_secret,
          scope:         scope,
          realm:         realm
        }
        post('/oauth/token', request_params)
      end

      # Refresh the user tokens using the code obtained through passive authentication in the specified connection
      # @see https://auth0.com/docs/auth-api#!#post--oauth-access_token
      # @param refresh_token [string] The refresh token issued to the client.
      # @param scope [string] Defaults to offline_access. Can be 'openid name email', 'openid offline_access'
      # @return [json] Returns the access_token and id_token
      def refresh_token(refresh_token, scope = nil)
        raise Auth0::InvalidParameter, 'Must supply a valid refresh_token' if refresh_token.to_s.empty?
        request_params = {
          client_id:     @client_id,
          client_secret: @client_secret,
          grant_type:    'refresh_token',
          refresh_token: refresh_token,
          scope:         scope
        }
        post('/oauth/token', request_params)
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
        raise Auth0::InvalidParameter, 'Must supply a valid username' if username.to_s.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid password' if password.to_s.empty?
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
        raise Auth0::InvalidParameter, 'Must supply a valid email' if email.to_s.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid password' if password.to_s.empty?
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
        raise Auth0::InvalidParameter, 'Must supply a valid email' if email.to_s.empty?
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
        raise Auth0::InvalidParameter, 'Must supply a valid email' if email.to_s.empty?
        request_params = {
          client_id:   @client_id,
          connection:  'email',
          email:       email,
          send:        send,
          authParams:  auth_params
        }
        post('/passwordless/start', request_params)
      end

      # Start passwordless workflow sending a SMS message
      # @see https://auth0.com/docs/auth-api#!#post--with_sms
      # @param phone_number [string] User's phone number.
      def start_passwordless_sms_flow(phone_number)
        raise Auth0::InvalidParameter, 'Must supply a valid phone number' if phone_number.to_s.empty?
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
        raise Auth0::InvalidParameter, 'Must supply a valid phone number' if phone_number.to_s.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid code' if code.to_s.empty?
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
      # @return [xml] SAML 2.0 metadata
      def saml_metadata
        get("/samlp/metadata/#{@client_id}")
      end

      # Retrives the WS-Federation metadata
      # @see https://auth0.com/docs/auth-api#!#get--wsfed--client_id-
      # @return [xml] Federation Metadata
      def wsfed_metadata
        get('/wsfed/FederationMetadata/2007-06/FederationMetadata.xml')
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
        raise Auth0::InvalidParameter, 'Must supply a valid token to refresh' if refresh_token.to_s.empty?
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
        raise Auth0::InvalidParameter, 'Must supply a valid id_token' if id_token.to_s.empty?
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

      # Unlinks a User
      # @see https://auth0.com/docs/auth-api#!#post--unlink
      # @param access_token [string] Logged-in user access token
      # @param user_id [string] User Id
      def unlink_user(access_token, user_id)
        raise Auth0::InvalidParameter, 'Must supply a valid access_token' if access_token.to_s.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid user_id' if user_id.to_s.empty?
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
      # @param audience [string] The unique identifier of the target API you want to access.
      # @param options [hash] Can contain response_type, connection, state and additional_parameters.
      # @return [url] Authorization URL.
      def authorization_url(redirect_uri, audience = nil, options = {})
        request_params = {
          audience: audience,
          client_id: @client_id,
          response_type: options.fetch(:response_type, 'code'),
          connection: options.fetch(:connection, nil),
          redirect_uri: redirect_uri,
          state: options.fetch(:state, nil),
          scope: options.fetch(:scope, nil)
        }.merge(options.fetch(:additional_parameters, {}))

        URI::HTTPS.build(host: @domain, path: '/authorize', query: to_query(request_params))
      end

      # Returns a logout  URL, triggers the logout flow.
      # @see https://auth0.com/docs/api/authentication#logout
      # @param return_to [string] Url to redirect after authorization
      # @param federated [boolean] Set to true to log the user out of their identity provider.
      # @return [url] Logout URL.
      def logout_url(return_to, federated = false)
        request_params = {
          returnTo: return_to
        }
        query = to_query(request_params)
        query += '&federated' if federated

        URI::HTTPS.build(host: @domain, path: '/v2/logout', query: query)
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
    end
  end
end
