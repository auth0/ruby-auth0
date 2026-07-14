# frozen_string_literal: true

module Auth0
  module Types
    # Additional OIDC metadata to include in the discovery document. Only applicable when strategy=oidc, okta, or samlp.
    class ConnectionsOidcMetadata < Internal::Types::Model
      field :issuer, -> { String }, optional: true, nullable: false

      field :authorization_endpoint, -> { String }, optional: true, nullable: false

      field :token_endpoint, -> { String }, optional: true, nullable: false

      field :userinfo_endpoint, -> { String }, optional: true, nullable: false

      field :jwks_uri, -> { String }, optional: true, nullable: false

      field :registration_endpoint, -> { String }, optional: true, nullable: false

      field :scopes_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :response_modes_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :response_types_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :grant_types_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :acr_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :subject_types_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :id_token_signing_alg_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :id_token_encryption_alg_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :id_token_encryption_enc_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :userinfo_signing_alg_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :userinfo_encryption_alg_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :userinfo_encryption_enc_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :request_object_signing_alg_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :request_object_encryption_alg_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :request_object_encryption_enc_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :token_endpoint_auth_methods_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :token_endpoint_auth_signing_alg_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :display_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :claim_types_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :claims_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :service_documentation, -> { String }, optional: true, nullable: false

      field :claims_locales_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :ui_locales_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :claims_parameter_supported, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :request_parameter_supported, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :request_uri_parameter_supported, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :require_request_uri_registration, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :op_policy_uri, -> { String }, optional: true, nullable: false

      field :op_tos_uri, -> { String }, optional: true, nullable: false

      field :end_session_endpoint, -> { String }, optional: true, nullable: false

      field :dpop_signing_alg_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
