# frozen_string_literal: true

module Auth0
  module Clients
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve clients (applications and SSO integrations) matching provided filters. A list of fields to include or
      # exclude may also be specified.
      # For more information, read <a href="https://www.auth0.com/docs/get-started/applications"> Applications in
      # Auth0</a> and <a href="https://www.auth0.com/docs/authenticate/single-sign-on"> Single Sign-On</a>.
      #
      # <ul>
      #   <li>
      #     The following can be retrieved with any scope:
      #     <code>client_id</code>, <code>app_type</code>, <code>name</code>, and <code>description</code>.
      #   </li>
      #   <li>
      #     The following properties can only be retrieved with the <code>read:clients</code> or
      #     <code>read:client_keys</code> scope:
      #     <code>callbacks</code>, <code>oidc_logout</code>, <code>allowed_origins</code>,
      #     <code>web_origins</code>, <code>tenant</code>, <code>global</code>, <code>config_route</code>,
      #     <code>callback_url_template</code>, <code>jwt_configuration</code>,
      #     <code>jwt_configuration.lifetime_in_seconds</code>, <code>jwt_configuration.secret_encoded</code>,
      #     <code>jwt_configuration.scopes</code>, <code>jwt_configuration.alg</code>, <code>api_type</code>,
      #     <code>logo_uri</code>, <code>allowed_clients</code>, <code>owners</code>, <code>custom_login_page</code>,
      #     <code>custom_login_page_off</code>, <code>sso</code>, <code>addons</code>, <code>form_template</code>,
      #     <code>custom_login_page_codeview</code>, <code>resource_servers</code>, <code>client_metadata</code>,
      #     <code>mobile</code>, <code>mobile.android</code>, <code>mobile.ios</code>, <code>allowed_logout_urls</code>,
      #     <code>token_endpoint_auth_method</code>, <code>is_first_party</code>, <code>oidc_conformant</code>,
      #     <code>is_token_endpoint_ip_header_trusted</code>, <code>initiate_login_uri</code>, <code>grant_types</code>,
      # <code>refresh_token</code>, <code>refresh_token.rotation_type</code>,
      # <code>refresh_token.expiration_type</code>,
      # <code>refresh_token.leeway</code>, <code>refresh_token.token_lifetime</code>,
      # <code>refresh_token.policies</code>, <code>organization_usage</code>,
      #     <code>organization_require_behavior</code>.
      #   </li>
      #   <li>
      #     The following properties can only be retrieved with the
      #     <code>read:client_keys</code> or <code>read:client_credentials</code> scope:
      #     <code>encryption_key</code>, <code>encryption_key.pub</code>, <code>encryption_key.cert</code>,
      #     <code>client_secret</code>, <code>client_authentication_methods</code> and <code>signing_key</code>.
      #   </li>
      # </ul>
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :fields
      # @option params [Boolean, nil] :include_fields
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :per_page
      # @option params [Boolean, nil] :include_totals
      # @option params [Boolean, nil] :is_global
      # @option params [Boolean, nil] :is_first_party
      # @option params [String, nil] :app_type
      # @option params [String, nil] :external_client_id
      # @option params [String, nil] :q
      #
      # @return [Auth0::Types::ListClientsOffsetPaginatedResponseContent]
      def list(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[fields include_fields page per_page include_totals is_global is_first_party app_type external_client_id q]
        query_params = {}
        query_params["fields"] = params[:fields] if params.key?(:fields)
        query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)
        query_params["page"] = params.fetch(:page, 0)
        query_params["per_page"] = params.fetch(:per_page, 50)
        query_params["include_totals"] = params.fetch(:include_totals, true)
        query_params["is_global"] = params[:is_global] if params.key?(:is_global)
        query_params["is_first_party"] = params[:is_first_party] if params.key?(:is_first_party)
        query_params["app_type"] = params[:app_type] if params.key?(:app_type)
        query_params["external_client_id"] = params[:external_client_id] if params.key?(:external_client_id)
        query_params["q"] = params[:q] if params.key?(:q)
        params.except(*query_param_names)

        Auth0::Internal::OffsetItemIterator.new(
          initial_page: query_params["page"],
          item_field: :clients,
          has_next_field: nil,
          step: true
        ) do |next_page|
          query_params["page"] = next_page
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "clients",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::ListClientsOffsetPaginatedResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Create a new client (application or SSO integration). For more information, read <a
      # href="https://www.auth0.com/docs/get-started/auth0-overview/create-applications">Create Applications</a>
      # <a href="https://www.auth0.com/docs/authenticate/single-sign-on/api-endpoints-for-single-sign-on>">API Endpoints
      # for Single Sign-On</a>.
      #
      # Notes:
      # - We recommend leaving the `client_secret` parameter unspecified to allow the generation of a safe secret.
      # - The <code>client_authentication_methods</code> and <code>token_endpoint_auth_method</code> properties are
      # mutually exclusive. Use
      # <code>client_authentication_methods</code> to configure the client with Private Key JWT authentication method.
      # Otherwise, use <code>token_endpoint_auth_method</code>
      # to configure the client with client secret (basic or post) or with no authentication method (none).
      # - When using <code>client_authentication_methods</code> to configure the client with Private Key JWT
      # authentication method, specify fully defined credentials.
      # These credentials will be automatically enabled for Private Key JWT authentication on the client.
      # - To configure <code>client_authentication_methods</code>, the <code>create:client_credentials</code> scope is
      # required.
      # - To configure <code>client_authentication_methods</code>, the property <code>jwt_configuration.alg</code> must
      # be set to RS256.
      #
      # <div class="alert alert-warning">SSO Integrations created via this endpoint will accept login requests and share
      # user profile information.</div>
      #
      # @param request_options [Hash]
      # @param params [Auth0::Clients::Types::CreateClientRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Auth0::Types::CreateClientResponseContent]
      def create(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "clients",
          body: Auth0::Clients::Types::CreateClientRequestContent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::CreateClientResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      #
      #       Fetches and validates a Client ID Metadata Document without creating a client.
      #       Returns the raw metadata and how it would be mapped to Auth0 client fields.
      #       This endpoint is useful for testing metadata URIs before creating CIMD clients.
      #
      #
      # @param request_options [Hash]
      # @param params [Auth0::Clients::Types::PreviewCimdMetadataRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Auth0::Types::PreviewCimdMetadataResponseContent]
      def preview_cimd_metadata(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "clients/cimd/preview",
          body: Auth0::Clients::Types::PreviewCimdMetadataRequestContent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::PreviewCimdMetadataResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      #
      #       Idempotent registration for Client ID Metadata Document (CIMD) clients.
      #       Uses external_client_id as the unique identifier for upsert operations.
      #       **Create:** Returns 201 when a new client is created (requires \
      #
      # @param request_options [Hash]
      # @param params [Auth0::Clients::Types::RegisterCimdClientRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Auth0::Types::RegisterCimdClientResponseContent]
      def register_cimd_client(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "clients/cimd/register",
          body: Auth0::Clients::Types::RegisterCimdClientRequestContent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::RegisterCimdClientResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve client details by ID. Clients are SSO connections or Applications linked with your Auth0 tenant. A list
      # of fields to include or exclude may also be specified.
      # For more information, read <a href="https://www.auth0.com/docs/get-started/applications"> Applications in
      # Auth0</a> and <a href="https://www.auth0.com/docs/authenticate/single-sign-on"> Single Sign-On</a>.
      # <ul>
      #   <li>
      #     The following properties can be retrieved with any of the scopes:
      #     <code>client_id</code>, <code>app_type</code>, <code>name</code>, and <code>description</code>.
      #   </li>
      #   <li>
      #     The following properties can only be retrieved with the <code>read:clients</code> or
      #     <code>read:client_keys</code> scopes:
      #     <code>callbacks</code>, <code>oidc_logout</code>, <code>allowed_origins</code>,
      #     <code>web_origins</code>, <code>tenant</code>, <code>global</code>, <code>config_route</code>,
      #     <code>callback_url_template</code>, <code>jwt_configuration</code>,
      #     <code>jwt_configuration.lifetime_in_seconds</code>, <code>jwt_configuration.secret_encoded</code>,
      #     <code>jwt_configuration.scopes</code>, <code>jwt_configuration.alg</code>, <code>api_type</code>,
      #     <code>logo_uri</code>, <code>allowed_clients</code>, <code>owners</code>, <code>custom_login_page</code>,
      #     <code>custom_login_page_off</code>, <code>sso</code>, <code>addons</code>, <code>form_template</code>,
      #     <code>custom_login_page_codeview</code>, <code>resource_servers</code>, <code>client_metadata</code>,
      #     <code>mobile</code>, <code>mobile.android</code>, <code>mobile.ios</code>, <code>allowed_logout_urls</code>,
      #     <code>token_endpoint_auth_method</code>, <code>is_first_party</code>, <code>oidc_conformant</code>,
      #     <code>is_token_endpoint_ip_header_trusted</code>, <code>initiate_login_uri</code>, <code>grant_types</code>,
      # <code>refresh_token</code>, <code>refresh_token.rotation_type</code>,
      # <code>refresh_token.expiration_type</code>,
      # <code>refresh_token.leeway</code>, <code>refresh_token.token_lifetime</code>,
      # <code>refresh_token.policies</code>, <code>organization_usage</code>,
      #     <code>organization_require_behavior</code>.
      #   </li>
      #   <li>
      # The following properties can only be retrieved with the <code>read:client_keys</code> or
      # <code>read:client_credentials</code> scopes:
      #     <code>encryption_key</code>, <code>encryption_key.pub</code>, <code>encryption_key.cert</code>,
      #     <code>client_secret</code>, <code>client_authentication_methods</code> and <code>signing_key</code>.
      #   </li>
      # </ul>
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String, nil] :fields
      # @option params [Boolean, nil] :include_fields
      #
      # @return [Auth0::Types::GetClientResponseContent]
      def get(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[fields include_fields]
        query_params = {}
        query_params["fields"] = params[:fields] if params.key?(:fields)
        query_params["include_fields"] = params[:include_fields] if params.key?(:include_fields)
        params = params.except(*query_param_names)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "clients/#{URI.encode_uri_component(params[:id].to_s)}",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::GetClientResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete a client and related configuration (rules, connections, etc).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [untyped]
      def delete(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "clients/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Updates a client's settings. For more information, read <a
      # href="https://www.auth0.com/docs/get-started/applications"> Applications in Auth0</a> and <a
      # href="https://www.auth0.com/docs/authenticate/single-sign-on"> Single Sign-On</a>.
      #
      # Notes:
      # - The `client_secret` and `signing_key` attributes can only be updated with the `update:client_keys` scope.
      # - The <code>client_authentication_methods</code> and <code>token_endpoint_auth_method</code> properties are
      # mutually exclusive. Use <code>client_authentication_methods</code> to configure the client with Private Key JWT
      # authentication method. Otherwise, use <code>token_endpoint_auth_method</code> to configure the client with
      # client secret (basic or post) or with no authentication method (none).
      # - When using <code>client_authentication_methods</code> to configure the client with Private Key JWT
      # authentication method, only specify the credential IDs that were generated when creating the credentials on the
      # client.
      # - To configure <code>client_authentication_methods</code>, the <code>update:client_credentials</code> scope is
      # required.
      # - To configure <code>client_authentication_methods</code>, the property <code>jwt_configuration.alg</code> must
      # be set to RS256.
      # - To change a client's <code>is_first_party</code> property to <code>false</code>, the
      # <code>organization_usage</code> and <code>organization_require_behavior</code> properties must be unset.
      #
      # @param request_options [Hash]
      # @param params [Auth0::Clients::Types::UpdateClientRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Auth0::Types::UpdateClientResponseContent]
      def update(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request_data = Auth0::Clients::Types::UpdateClientRequestContent.new(params).to_h
        non_body_param_names = ["id"]
        body = request_data.except(*non_body_param_names)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "clients/#{URI.encode_uri_component(params[:id].to_s)}",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::UpdateClientResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Rotate a client secret.
      #
      # This endpoint cannot be used with clients configured with Private Key JWT authentication method
      # (client_authentication_methods configured with private_key_jwt). The generated secret is NOT base64 encoded.
      #
      # For more information, read <a
      # href="https://www.auth0.com/docs/get-started/applications/rotate-client-secret">Rotate Client Secrets</a>.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Auth0::Types::RotateClientSecretResponseContent]
      def rotate_secret(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "clients/#{URI.encode_uri_component(params[:id].to_s)}/rotate-secret",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::RotateClientSecretResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Auth0::Credentials::Client]
      def credentials
        @credentials ||= Auth0::Clients::Credentials::Client.new(client: @client)
      end

      # @return [Auth0::Connections::Client]
      def connections
        @connections ||= Auth0::Clients::Connections::Client.new(client: @client)
      end
    end
  end
end
