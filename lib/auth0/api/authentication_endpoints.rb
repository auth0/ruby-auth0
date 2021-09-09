# frozen_string_literal: true
# rubocop:disable Metrics/ModuleLength

require 'jwt'

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
      # @param organization [string] Organization ID
      # @return [json] Returns the API token
      def api_token(
        client_id: @client_id,
        client_secret: @client_secret,
        organization: @organization,
        audience: nil
      )

        request_params = {
          grant_type: 'client_credentials',
          client_id: client_id,
          client_secret: client_secret,
          audience: audience,
          organization: organization
        }

        response = post('/oauth/token', request_params)
        ::Auth0::ApiToken.new(response['access_token'], response['scope'], response['expires_in'])
      end

      # Get access and ID tokens using an Authorization Code.
      # @see https://auth0.com/docs/api/authentication#authorization-code
      # @param code [string] The authentication code obtained from /authorize
      # @param redirect_uri [string] URL to redirect to after authorization.
      #   Required only if it was set at the GET /authorize endpoint
      # @param client_id [string] Client ID for the Application
      # @param client_secret [string] Client Secret for the Application.
      # @return [Auth0::AccessToken] Returns the access_token and id_token
      def exchange_auth_code_for_tokens(
        code,
        redirect_uri: nil,
        client_id: @client_id,
        client_secret: @client_secret
      )
        raise Auth0::InvalidParameter, 'Must provide an authorization code' if code.to_s.empty?

        request_params = {
          grant_type: 'authorization_code',
          client_id: client_id,
          client_secret: client_secret,
          code: code,
          redirect_uri: redirect_uri
        }
        ::Auth0::AccessToken.from_response post('/oauth/token', request_params)
      end

      # Get access and ID tokens using a refresh token.
      # @see https://auth0.com/docs/api/authentication#refresh-token
      # @param refresh_token [string] Refresh token to use. Request this with
      #   the offline_access scope when logging in.
      # @param client_id [string] Client ID for the Application
      # @param client_secret [string] Client Secret for the Application.
      #   Required when the Application's Token Endpoint Authentication Method
      #   is Post or Basic.
      # @return [Auth0::AccessToken] Returns tokens allowed in the refresh_token
      def exchange_refresh_token(
        refresh_token,
        client_id: @client_id,
        client_secret: @client_secret
      )
        raise Auth0::InvalidParameter, 'Must provide a refresh token' if refresh_token.to_s.empty?

        request_params = {
          grant_type: 'refresh_token',
          client_id: client_id,
          client_secret: client_secret,
          refresh_token: refresh_token
        }
        ::Auth0::AccessToken.from_response post('/oauth/token', request_params)
      end

      # rubocop:disable Metrics/ParameterLists
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
      def login_with_resource_owner(
        login_name,
        password,
        client_id: @client_id,
        client_secret: @client_secret,
        realm: nil,
        audience: nil,
        scope: 'openid'
      )

        raise Auth0::InvalidParameter, 'Must supply a valid login_name' if login_name.empty?
        raise Auth0::InvalidParameter, 'Must supply a valid password' if password.empty?

        request_params = {
          username: login_name,
          password: password,
          client_id: client_id,
          client_secret: client_secret,
          realm: realm,
          scope: scope,
          audience: audience,
          grant_type: realm ? 'http://auth0.com/oauth/grant-type/password-realm' : 'password'
        }
        ::Auth0::AccessToken.from_response post('/oauth/token', request_params)
      end
      # rubocop:enable Metrics/ParameterLists

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
          email: email,
          password: password,
          connection: connection_name,
          client_id: @client_id
        }
        post('/dbconnections/signup', request_params)
      end

      # Change a user's password or trigger a password reset email.
      # @see https://auth0.com/docs/api/authentication#change-password
      # @see https://auth0.com/docs/connections/database/password-change
      # @param email [string] User's current email
      # @param password [string] User's new password. This is only available
      #   on legacy tenants with change password v1 flow enabled
      # @param connection_name [string] Database connection name
      # @deprecated Use {#password_reset} instead.
      def change_password(email, password, connection_name = UP_AUTH)
        raise Auth0::InvalidParameter, 'Must supply a valid email' if email.to_s.empty?

        request_params = {
          email: email,
          password: password,
          connection: connection_name,
          client_id: @client_id
        }
        post('/dbconnections/change_password', request_params)
      end

      # Trigger a password reset email.
      # @see https://auth0.com/docs/api/authentication#change-password
      # @see https://auth0.com/docs/connections/database/password-change
      # @param email [string] User's current email
      # @param password [string] User's new password; empty to trigger a
      #   password reset email
      # @param connection_name [string] Database connection name
      def reset_password(email, connection_name = UP_AUTH)
        raise Auth0::InvalidParameter, 'Must supply a valid email' if email.to_s.empty?

        request_params = {
          email: email,
          connection: connection_name,
          client_id: @client_id
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
          email: email,
          send: send,
          authParams: auth_params,
          connection: 'email',
          client_id: @client_id,
          client_secret: @client_secret
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
          connection: 'sms',
          client_id: @client_id,
          client_secret: @client_secret
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
        get('/userinfo', {}, 'Authorization' => "Bearer #{access_token}")
      end

      # Return an authorization URL.
      # @see https://auth0.com/docs/api/authentication#authorization-code-grant
      # @param redirect_uri [string] URL to redirect after authorization
      # @param options [hash] Can contain response_type, connection, state, organization, invitation, and additional_parameters.
      # @return [url] Authorization URL.
      def authorization_url(redirect_uri, options = {})
        raise Auth0::InvalidParameter, 'Must supply a valid redirect_uri' if redirect_uri.to_s.empty?

        request_params = {
          client_id: @client_id,
          response_type: options.fetch(:response_type, 'code'),
          connection: options.fetch(:connection, nil),
          redirect_uri: redirect_uri,
          state: options.fetch(:state, nil),
          scope: options.fetch(:scope, nil),
          organization: options.fetch(:organization, @organization),
          invitation: options.fetch(:invitation, nil)
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

        url_client_id = @client_id unless request_params[:wtrealm]
        URI::HTTPS.build(
          host: @domain,
          path: "/wsfed/#{url_client_id}",
          query: to_query(request_params)
        )
      end

      # Validate an ID token (signature and expiration).
      # @see https://auth0.com/docs/tokens/guides/validate-id-tokens
      # @param id_token [string] The JWT to validate.
      # @param algorithm [JWKAlgorithm] The expected signing algorithm.

      # @param leeway [integer] The clock skew to accept when verifying date related claims in seconds.
      #   Must be a non-negative value. Defaults to *60 seconds*.
      # @param nonce [string] The nonce value sent during authentication.
      # @param max_age [integer] The max_age value sent during authentication.
      #   Must be a non-negative value.
      # @param issuer [string] The expected issuer claim value.
      #   Defaults to +https://YOUR_AUTH0_DOMAIN/+.
      # @param audience [string] The expected audience claim value.
      #   Defaults to your *Auth0 Client ID*.
      # @param organization [string] Organization ID
      #   Defaults to your *Auth0 Organization ID*.
      # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/ParameterLists
      def validate_id_token(id_token, algorithm: nil, leeway: 60, nonce: nil, max_age: nil, issuer: nil, audience: nil, organization: @organization)
        context = {
          issuer: issuer || "https://#{@domain}/",
          audience: audience || @client_id,
          algorithm: algorithm || Auth0::Algorithm::RS256.jwks_url("https://#{@domain}/.well-known/jwks.json"),
          leeway: leeway
        }

        context[:nonce] = nonce unless nonce.nil?
        context[:max_age] = max_age unless max_age.nil?
        context[:organization] = organization unless !organization

        Auth0::Mixins::Validation::IdTokenValidator.new(context).validate(id_token)
      end
      # rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/ParameterLists

      private

      # Build a URL query string from a hash.
      def to_query(hash)
        hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
      end
    end
  end
end
# rubocop:enable Metrics/ModuleLength
