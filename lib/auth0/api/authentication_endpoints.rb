# rubocop:disable Metrics/ModuleLength
module Auth0
  module Api
    # {https://auth0.com/docs/api/authentication}
    # Methods to use the Authentication API
    module AuthenticationEndpoints
      UP_AUTH = 'Username-Password-Authentication'.freeze
      JWT_BEARER = 'urn:ietf:params:oauth:grant-type:jwt-bearer'.freeze

      # Request an API access token using a Client Credentials grant
      # @see https://auth0.com/docs/api-auth/tutorials/client-credentials
      # @param audience [string] API audience to use
      # @return [json] Returns the API token
      # def api_token(audience = "https://#{@domain}/api/v2/")
      def api_token(
        client_id: @client_id,
        client_secret: @client_secret,
        audience: "https://#{@domain}/api/v2/"
      )
        request_params = {
          grant_type: 'client_credentials',
          client_id: client_id,
          client_secret: client_secret,
          audience: audience
        }
        response = post('/oauth/token', request_params)
        ApiToken.new(response['access_token'], response['scope'], response['expires_in'])
      end

      # Get access and ID tokens using an Authorization Code.
      # @see https://auth0.com/docs/api/authentication#authorization-code
      # @param code [string] The authentication code obtained from /authorize
      # @param redirect_uri [string] Url to redirect after authorization
      # @return [json] Returns the access_token and id_token
      def exchange_auth_code_for_tokens(
        code,
        redirect_uri,
        client_id: @client_id,
        client_secret: @client_secret
      )
        raise Auth0::InvalidParameter, 'Must provide an authorization code' if code.to_s.empty?
        raise Auth0::InvalidParameter, 'Must provide a redirect URI' if redirect_uri.to_s.empty?
        request_params = {
          grant_type:    'authorization_code',
          client_id:     client_id,
          client_secret: client_secret,
          code:          code,
          redirect_uri:  redirect_uri
        }
        AccessToken.from_response post('/oauth/token', request_params)
      end

      # Retrieve an access token.
      # TODO: Deprecate, use the api_token method in this module instead.
      # @see https://auth0.com/docs/api/authentication#client-credentials
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

      # Get access and ID tokens using an Authorization Code.
      # TODO: Deprecate, use the auth_code_exchange method in this module instead.
      # @see https://auth0.com/docs/api/authentication#authorization-code
      # @param code [string] The access code obtained through passive authentication
      # @param redirect_uri [string] Url to redirect after authorization
      # @param connection [string] Currently, this endpoint only works for Facebook, Google, Twitter and Weibo
      # @param scope [string] Defaults to openid. Can be 'openid name email', 'openid offline_access'
      # @return [json] Returns the access_token and id_token
      def obtain_user_tokens(code, redirect_uri, connection = 'facebook', scope = 'openid')
        raise Auth0::InvalidParameter, 'Must supply a valid code' if code.to_s.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid redirect_uri' if redirect_uri.to_s.empty?
        request_params = {
          client_id:     @client_id,
          client_secret: @client_secret,
          connection:    connection,
          grant_type:    'authorization_code',
          code:          code,
          scope:         scope,
          redirect_uri:  redirect_uri
        }
        post('/oauth/token', request_params)
      end

      # Get access and ID tokens using Resource Owner Password.
      # Requires that your tenant has a Default Audience or Default Directory.
      # @see https://auth0.com/docs/api/authentication#resource-owner-password
      # @param login_name [string] Email or username for the connection
      # @param password [string] Password
      # @param client_id [string] Client ID from Application settings
      # @param client_secret [string] Client Secret from Application settings
      # @param realm [string] Specific realm to authenticate against
      # @param audience [string] API audience
      # @param scope [string] Scope(s) requested
      #   - Include an audience (above) for API access scopes
      #   - Use the default "openid" for userinfo calls
      # @return [json] Returns the access_token and id_token
      def login_ro(
        login_name,
        password,
        client_id: @client_id,
        client_secret: @client_secret,
        realm: nil,
        audience: nil,
        scope: 'openid'
      )
        raise Auth0::InvalidParameter,
              'Must supply a valid login_name' if login_name.empty?
        raise Auth0::InvalidParameter,
              'Must supply a valid password' if password.empty?
        request_params = {
          username:      login_name,
          password:      password,
          client_id:     client_id,
          client_secret: client_secret,
          realm:         realm,
          scope:         scope,
          audience:      audience,
          grant_type:    realm ? 'http://auth0.com/oauth/grant-type/password-realm' : 'password'
        }
        post('/oauth/token', request_params)
      end

      # Get access and ID tokens using Resource Owner Password.
      # TODO: Deprecate, use the login_ro method in this module instead.
      # @see https://auth0.com/docs/api/authentication#resource-owner-password
      # @param username [string] Username or email
      # @param password [string] Password
      # @param id_token [string] Token's id
      # @param connection_name [string] Connection name; use a database or
      #    passwordless connection, Active Directory/LDAP, Windows Azure or ADF
      # @param options [hash] Additional options - :scope, :grant_type, :device
      # @return [json] Returns the access_token and id_token
      def login(username, password, id_token = nil, connection_name = UP_AUTH, options = {})
        raise Auth0::InvalidParameter, 'Must supply a valid username' if username.to_s.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid password' if password.to_s.empty?
        request_params = {
          client_id:     @client_id,
          client_secret: @client_secret,
          username:      username,
          password:      password,
          scope:         options.fetch(:scope, 'openid'),
          connection:    connection_name,
          grant_type:    options.fetch(:grant_type, 'password'),
          id_token:      id_token,
          device:        options.fetch(:device, nil)
        }
        post('/oauth/token', request_params)
      end

      # Sign up with a database connection using a username and password.
      # @see https://auth0.com/docs/api/authentication#signup
      # @param email [string] New user's email
      # @param password [string] New user's password
      # @param connection_name [string] Database connection name
      # @return [json] Returns the created user
      def signup(email, password, connection_name = UP_AUTH)
        raise Auth0::InvalidParameter, 'Must supply a valid email' if email.to_s.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid password' if password.to_s.empty?
        request_params = {
          email:      email,
          password:   password,
          connection: connection_name,
          client_id:  @client_id
        }
        post('/dbconnections/signup', request_params)
      end

      # Change a user's password or trigger a password reset email.
      # @see https://auth0.com/docs/api/authentication#change-password
      # @see https://auth0.com/docs/connections/database/password-change
      # @param email [string] User's current email
      # @param password [string] User's new password; empty to trigger a
      #   password reset email
      # @param connection_name [string] Database connection name
      def change_password(email, password, connection_name = UP_AUTH)
        raise Auth0::InvalidParameter, 'Must supply a valid email' if email.to_s.empty?
        request_params = {
          email:      email,
          password:   password,
          connection: connection_name,
          client_id:  @client_id
        }
        post('/dbconnections/change_password', request_params)
      end

      # Start Passwordless email login flow.
      # @see https://auth0.com/docs/api/authentication#get-code-or-link
      # @see https://auth0.com/docs/connections/passwordless#passwordless-on-regular-web-apps
      # @param email [string] Email to send a link or code
      # @param send [string] Pass 'link' to send a magic link, 'code' to send a code
      # @param auth_params [hash] Append or override the magic link parameters
      def start_passwordless_email_flow(email, send = 'link', auth_params = {})
        raise Auth0::InvalidParameter, 'Must supply a valid email' if email.to_s.empty?
        request_params = {
          email:       email,
          send:        send,
          authParams:  auth_params,
          connection:  'email',
          client_id:   @client_id
        }
        post('/passwordless/start', request_params)
      end

      # Start Passwordless SMS login flow.
      # @see https://auth0.com/docs/api/authentication#get-code-or-link
      # @see https://auth0.com/docs/connections/passwordless#passwordless-on-regular-web-apps
      # @param phone_number [string] User's phone number.
      def start_passwordless_sms_flow(phone_number)
        raise Auth0::InvalidParameter, 'Must supply a valid phone number' if phone_number.to_s.empty?
        request_params = {
          phone_number: phone_number,
          connection:   'sms',
          client_id:    @client_id
        }
        post('/passwordless/start', request_params)
      end

      # Retrive SAML 2.0 metadata XML for an Application.
      # @see https://auth0.com/docs/api/authentication#get-metadata
      # @return [xml] SAML 2.0 metadata
      def saml_metadata
        get("/samlp/metadata/#{@client_id}")
      end

      # Retrieve WS-Federation metadata XML for a tenant.
      # @see https://auth0.com/docs/api/authentication#get-metadata36
      # @return [xml] WS-Federation metadata
      def wsfed_metadata
        get('/wsfed/FederationMetadata/2007-06/FederationMetadata.xml')
      end

      # Return the user information based on the Auth0 access token.
      # @see https://auth0.com/docs/api/authentication#get-user-info
      # @return [json] User information based on the Auth0 access token
      def userinfo(access_token)
        get('/userinfo', {}, {'Authorization' => "Bearer #{access_token}"})
      end

      # Return the user information based on the Auth0 access token.
      # TODO: Deprecate, use the userinfo method in this module instead.
      # @see https://auth0.com/docs/api/authentication#get-user-info
      # @return [json] User information based on the Auth0 access token
      def user_info
        get('/userinfo')
      end

      # Return an authorization URL.
      # @see https://auth0.com/docs/api/authentication#authorization-code-grant
      # @param redirect_uri [string] URL to redirect after authorization
      # @param options [hash] Can contain response_type, connection, state and additional_parameters.
      # @return [url] Authorization URL.
      def authorization_url(redirect_uri, options = {})
        raise Auth0::InvalidParameter, 'Must supply a valid redirect_uri' if redirect_uri.to_s.empty?
        request_params = {
          client_id: @client_id,
          response_type: options.fetch(:response_type, 'code'),
          connection: options.fetch(:connection, nil),
          redirect_uri: redirect_uri,
          state: options.fetch(:state, nil),
          scope: options.fetch(:scope, nil)
        }.merge(options.fetch(:additional_parameters, {}))

        URI::HTTPS.build(host: @domain, path: '/authorize', query: to_query(request_params))
      end

      # Returns an Auth0 logout URL with a return URL.
      # @see https://auth0.com/docs/api/authentication#logout
      # @see https://auth0.com/docs/logout
      # @param return_to [string] URL to redirect after logout.
      # @param include_client [bool] Include the client_id in the logout URL.
      # @param federated [boolean] Perform a federated logout.
      # @return [url] Logout URI
      def logout_url(return_to, include_client: false, federated: false)
        request_params = {
          returnTo: return_to,
          client_id: include_client ? @client_id : nil,
          federated: federated ? '1' : nil
        }

        URI::HTTPS.build(
          host: @domain,
          path: '/v2/logout',
          query: to_query(request_params)
        )
      end

      # Return a SAMLP URL.
      # The SAML Request AssertionConsumerServiceURL will be used to POST back
      # the assertion and it must match with the application callback URL.
      # @see https://auth0.com/docs/api/authentication#accept-request
      # @param connection [string] Connection to use; empty to show all
      # @return [url] SAMLP URL
      def samlp_url(connection = UP_AUTH)
        request_params = {
          connection: connection
        }
        URI::HTTPS.build(host: @domain, path: "/samlp/#{@client_id}", query: to_query(request_params))
      end

      # Return a WS-Federation URL.
      # @see https://auth0.com/docs/api/authentication#accept-request35
      # @param connection [string] Connection to use; empty to show all
      # @param options [hash] Extra options; supports wtrealm, wctx, wreply
      # @return [url] WS-Federation URL
      def wsfed_url(connection = UP_AUTH, options = {})
        request_params = {
          whr: connection,
          wtrealm: options[:wtrealm],
          wctx: options[:wctx],
          wreply: options[:wreply]
        }

        url_client_id = @client_id if !request_params[:wtrealm]
        URI::HTTPS.build(
          host: @domain,
          path: "/wsfed/#{url_client_id}",
          query: to_query(request_params)
        )
      end

      #
      # DEPRECATED
      #

      # Login using phone number + verification code.
      # @deprecated 4.5.0 - Legacy authentication pipeline; use a Password Grant
      #   instead - https://auth0.com/docs/api-auth/tutorials/password-grant
      # @see https://auth0.com/docs/api/authentication#resource-owner
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

      # Validate a JSON Web Token (signature and expiration).
      # @deprecated 4.5.0 - Legacy endpoint, use /userinfo instead.
      # @see https://auth0.com/docs/api/authentication#get-token-info
      # @param id_token [string] ID Token to use
      # @return User information associated with the user id (sub property) of the token.
      def token_info(id_token)
        raise Auth0::InvalidParameter, 'Must supply a valid id_token' if id_token.to_s.empty?
        request_params = { id_token: id_token }
        post('/tokeninfo', request_params)
      end

      # Refresh a delegation token.
      # @deprecated 4.5.0 - Feature is disabled, no replacement currently; see
      #   https://auth0.com/docs/api-auth/tutorials/adoption/delegation
      # @see https://auth0.com/docs/api/authentication#delegation
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

      # Retrieve a delegation token.
      # @deprecated 4.5.0 - Feature is disabled, no replacement currently; see
      #   https://auth0.com/docs/api-auth/tutorials/adoption/delegation
      # @see https://auth0.com/docs/api/authentication#delegation
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

      # Retrieve an impersonation URL to login as another user.
      # @deprecated 4.5.0 - Feature is disabled.
      # @see https://auth0.com/docs/api/authentication#impersonation
      # @param user_id [string] Impersonate user id
      # @param app_client_id [string] Application client id
      # @param impersonator_id [string] Impersonator user id id.
      # @param options [string] Additional Parameters
      # @return [string] Impersonation URL
      # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
      def impersonate(user_id, app_client_id, impersonator_id, options)
        raise Auth0::InvalidParameter, 'Must supply a valid user_id' if user_id.to_s.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid app_client_id' if app_client_id.to_s.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid impersonator_id' if impersonator_id.to_s.empty?
        raise Auth0::MissingParameter, 'Must supply client_secret' if @client_secret.nil?
        authorization_header obtain_access_token
        request_params = {
          protocol:         options.fetch(:protocol, 'oauth2'),
          impersonator_id:  impersonator_id,
          client_id:        app_client_id,
          additionalParameters: {
            response_type:  options.fetch(:response_type, 'code'),
            state:          options.fetch(:state, ''),
            scope:          options.fetch(:scope, 'openid'),
            callback_url:   options.fetch(:callback_url, '')
          }
        }
        result = post("/users/#{user_id}/impersonate", request_params)
        authorization_header @token
        result
      end
      # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

      # Unlink a user's account from the identity provider.
      # @deprecated 4.5.0 - Endpoint is disabled in favor of the Management API;
      #   see https://auth0.com/docs/migrations/guides/account-linking
      # @see https://auth0.com/docs/api/authentication#unlink
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

      private

      # Build a URL query string from a hash.
      def to_query(hash)
        hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
      end
    end
  end
end
# rubocop:enable Metrics/ModuleLength
