# frozen_string_literal: true

module Auth0
  module Clients
    module Credentials
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Get the details of a client credential.
        #
        # <b>Important</b>: To enable credentials to be used for a client authentication method, set the
        # <code>client_authentication_methods</code> property on the client. To enable credentials to be used for
        # JWT-Secured Authorization requests set the <code>signed_request_object</code> property on the client.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :client_id
        #
        # @return [Array[Auth0::Types::ClientCredential]]
        def list(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "clients/#{URI.encode_uri_component(params[:client_id].to_s)}/credentials",
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

        # Create a client credential associated to your application. Credentials can be used to configure Private Key
        # JWT and mTLS authentication methods, as well as for JWT-secured Authorization requests.
        #
        # <h5>Public Key</h5>Public Key credentials can be used to set up Private Key JWT client authentication and
        # JWT-secured Authorization requests.
        #
        # Sample: <pre><code>{
        #   "credential_type": "public_key",
        #   "name": "string",
        #   "pem": "string",
        #   "alg": "RS256",
        #   "parse_expiry_from_cert": false,
        #   "expires_at": "2022-12-31T23:59:59Z"
        # }</code></pre>
        # <h5>Certificate (CA-signed & self-signed)</h5>Certificate credentials can be used to set up mTLS client
        # authentication. CA-signed certificates can be configured either with a signed certificate or with just the
        # certificate Subject DN.
        #
        # CA-signed Certificate Sample (pem): <pre><code>{
        #   "credential_type": "x509_cert",
        #   "name": "string",
        #   "pem": "string"
        # }</code></pre>CA-signed Certificate Sample (subject_dn): <pre><code>{
        #   "credential_type": "cert_subject_dn",
        #   "name": "string",
        #   "subject_dn": "string"
        # }</code></pre>Self-signed Certificate Sample: <pre><code>{
        #   "credential_type": "cert_subject_dn",
        #   "name": "string",
        #   "pem": "string"
        # }</code></pre>
        #
        # The credential will be created but not yet enabled for use until you set the corresponding properties in the
        # client:
        # <ul>
        # <li>To enable the credential for Private Key JWT or mTLS authentication methods, set the
        # <code>client_authentication_methods</code> property on the client. For more information, read <a
        # href="https://auth0.com/docs/get-started/applications/configure-private-key-jwt">Configure Private Key JWT
        # Authentication</a> and <a href="https://auth0.com/docs/get-started/applications/configure-mtls">Configure mTLS
        # Authentication</a></li>
        # <li>To enable the credential for JWT-secured Authorization requests, set the
        # <code>signed_request_object</code>property on the client. For more information, read <a
        # href="https://auth0.com/docs/get-started/applications/configure-jar">Configure JWT-secured Authorization
        # Requests (JAR)</a></li>
        # </ul>
        #
        # @param request_options [Hash]
        # @param params [Auth0::Clients::Credentials::Types::PostClientCredentialRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :client_id
        #
        # @return [Auth0::Types::PostClientCredentialResponseContent]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Clients::Credentials::Types::PostClientCredentialRequestContent.new(params).to_h
          non_body_param_names = ["client_id"]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "clients/#{URI.encode_uri_component(params[:client_id].to_s)}/credentials",
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
            Auth0::Types::PostClientCredentialResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Get the details of a client credential.
        #
        # <b>Important</b>: To enable credentials to be used for a client authentication method, set the
        # <code>client_authentication_methods</code> property on the client. To enable credentials to be used for
        # JWT-Secured Authorization requests set the <code>signed_request_object</code> property on the client.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :client_id
        # @option params [String] :credential_id
        #
        # @return [Auth0::Types::GetClientCredentialResponseContent]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "clients/#{URI.encode_uri_component(params[:client_id].to_s)}/credentials/#{URI.encode_uri_component(params[:credential_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Auth0::Types::GetClientCredentialResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Delete a client credential you previously created. May be enabled or disabled. For more information, read <a
        # href="https://www.auth0.com/docs/get-started/authentication-and-authorization-flow/client-credentials-flow">Client
        # Credential Flow</a>.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :client_id
        # @option params [String] :credential_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "clients/#{URI.encode_uri_component(params[:client_id].to_s)}/credentials/#{URI.encode_uri_component(params[:credential_id].to_s)}",
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

        # Change a client credential you previously created. May be enabled or disabled. For more information, read <a
        # href="https://www.auth0.com/docs/get-started/authentication-and-authorization-flow/client-credentials-flow">Client
        # Credential Flow</a>.
        #
        # @param request_options [Hash]
        # @param params [Auth0::Clients::Credentials::Types::PatchClientCredentialRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :client_id
        # @option params [String] :credential_id
        #
        # @return [Auth0::Types::PatchClientCredentialResponseContent]
        def update(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::Clients::Credentials::Types::PatchClientCredentialRequestContent.new(params).to_h
          non_body_param_names = %w[client_id credential_id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "clients/#{URI.encode_uri_component(params[:client_id].to_s)}/credentials/#{URI.encode_uri_component(params[:credential_id].to_s)}",
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
            Auth0::Types::PatchClientCredentialResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
