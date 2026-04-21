# frozen_string_literal: true

module Auth0
  module Types
    # Common options for SAML-based enterprise connections (shared by samlp and pingfederate).
    class ConnectionOptionsCommonSAML < Internal::Types::Model
      field :cert, -> { String }, optional: true, nullable: false
      field :decryption_key, -> { Auth0::Types::ConnectionDecryptionKeySAML }, optional: true, nullable: false, api_name: "decryptionKey"
      field :digest_algorithm, -> { Auth0::Types::ConnectionDigestAlgorithmEnumSAML }, optional: true, nullable: false, api_name: "digestAlgorithm"
      field :domain_aliases, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :entity_id, -> { String }, optional: true, nullable: false, api_name: "entityId"
      field :icon_url, -> { String }, optional: true, nullable: false
      field :idpinitiated, -> { Auth0::Types::ConnectionOptionsIdpinitiatedSAML }, optional: true, nullable: false
      field :protocol_binding, -> { Auth0::Types::ConnectionProtocolBindingEnumSAML }, optional: true, nullable: false, api_name: "protocolBinding"
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :sign_in_endpoint, -> { String }, optional: true, nullable: false, api_name: "signInEndpoint"
      field :sign_saml_request, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "signSAMLRequest"
      field :signature_algorithm, -> { Auth0::Types::ConnectionSignatureAlgorithmEnumSAML }, optional: true, nullable: false, api_name: "signatureAlgorithm"
      field :tenant_domain, -> { String }, optional: true, nullable: false
      field :thumbprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
    end
  end
end
