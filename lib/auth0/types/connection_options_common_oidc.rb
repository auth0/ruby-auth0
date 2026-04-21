# frozen_string_literal: true

module Auth0
  module Types
    # common options for OIDC connections
    class ConnectionOptionsCommonOidc < Internal::Types::Model
      field :authorization_endpoint, -> { String }, optional: true, nullable: false
      field :client_id, -> { String }, optional: false, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :connection_settings, -> { Auth0::Types::ConnectionConnectionSettings }, optional: true, nullable: false
      field :domain_aliases, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :dpop_signing_alg, -> { Auth0::Types::ConnectionDpopSigningAlgEnum }, optional: true, nullable: false
      field :federated_connections_access_tokens, -> { Auth0::Types::ConnectionFederatedConnectionsAccessTokens }, optional: true, nullable: false
      field :icon_url, -> { String }, optional: true, nullable: false
      field :id_token_signed_response_algs, -> { Internal::Types::Array[Auth0::Types::ConnectionIDTokenSignedResponseAlgEnum] }, optional: true, nullable: false
      field :issuer, -> { String }, optional: true, nullable: false
      field :jwks_uri, -> { String }, optional: true, nullable: false
      field :oidc_metadata, -> { Auth0::Types::ConnectionOptionsOidcMetadata }, optional: true, nullable: false
      field :scope, -> { String }, optional: true, nullable: false
      field :send_back_channel_nonce, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :tenant_domain, -> { String }, optional: true, nullable: false
      field :token_endpoint, -> { String }, optional: true, nullable: false
      field :token_endpoint_auth_method, -> { Auth0::Types::ConnectionTokenEndpointAuthMethodEnum }, optional: true, nullable: false
      field :token_endpoint_auth_signing_alg, -> { Auth0::Types::ConnectionTokenEndpointAuthSigningAlgEnum }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
      field :userinfo_endpoint, -> { String }, optional: true, nullable: false
    end
  end
end
