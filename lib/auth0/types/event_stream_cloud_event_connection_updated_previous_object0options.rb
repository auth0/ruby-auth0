# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'oidc' connection
    class EventStreamCloudEventConnectionUpdatedPreviousObject0Options < Internal::Types::Model
      field :authorization_endpoint, -> { String }, optional: true, nullable: false

      field :client_id, -> { String }, optional: false, nullable: false

      field :connection_settings, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0OptionsConnectionSettings }, optional: true, nullable: false

      field :domain_aliases, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :dpop_signing_alg, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0OptionsDpopSigningAlgEnum }, optional: true, nullable: false

      field :federated_connections_access_tokens, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0OptionsFederatedConnectionsAccessTokens }, optional: true, nullable: false

      field :icon_url, -> { String }, optional: true, nullable: false

      field :id_token_session_expiry_supported, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :id_token_signed_response_algs, -> { Internal::Types::Array[Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0OptionsIDTokenSignedResponseAlgsItemEnum] }, optional: true, nullable: false

      field :issuer, -> { String }, optional: true, nullable: false

      field :jwks_uri, -> { String }, optional: true, nullable: false

      field :non_persistent_attrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :oidc_metadata, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0OptionsOidcMetadata }, optional: true, nullable: false

      field :schema_version, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0OptionsSchemaVersionEnum }, optional: true, nullable: false

      field :scope, -> { String }, optional: true, nullable: false

      field :send_back_channel_nonce, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :set_user_root_attributes, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0OptionsSetUserRootAttributesEnum }, optional: true, nullable: false

      field :tenant_domain, -> { String }, optional: true, nullable: false

      field :token_endpoint, -> { String }, optional: true, nullable: false

      field :token_endpoint_auth_method, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0OptionsTokenEndpointAuthMethodEnum }, optional: true, nullable: false

      field :token_endpoint_auth_signing_alg, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0OptionsTokenEndpointAuthSigningAlgEnum }, optional: true, nullable: false

      field :token_endpoint_jwtca_aud_format, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0OptionsTokenEndpointJwtcaAudFormatEnum }, optional: true, nullable: false

      field :upstream_params, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :use_oauth_spec_scope, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "useOauthSpecScope"

      field :userinfo_endpoint, -> { String }, optional: true, nullable: false

      field :attribute_map, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0OptionsAttributeMap }, optional: true, nullable: false

      field :discovery_url, -> { String }, optional: true, nullable: false

      field :type, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedPreviousObject0OptionsTypeEnum }, optional: true, nullable: false
    end
  end
end
