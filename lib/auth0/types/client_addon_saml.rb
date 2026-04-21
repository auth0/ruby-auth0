# frozen_string_literal: true

module Auth0
  module Types
    # SAML2 addon indicator (no configuration settings needed for SAML2 addon).
    class ClientAddonSAML < Internal::Types::Model
      field :mappings, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :audience, -> { String }, optional: true, nullable: false
      field :recipient, -> { String }, optional: true, nullable: false
      field :create_upn_claim, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "createUpnClaim"
      field :map_unknown_claims_as_is, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "mapUnknownClaimsAsIs"
      field :passthrough_claims_with_no_mapping, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "passthroughClaimsWithNoMapping"
      field :map_identities, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "mapIdentities"
      field :signature_algorithm, -> { String }, optional: true, nullable: false, api_name: "signatureAlgorithm"
      field :digest_algorithm, -> { String }, optional: true, nullable: false, api_name: "digestAlgorithm"
      field :issuer, -> { String }, optional: true, nullable: false
      field :destination, -> { String }, optional: true, nullable: false
      field :lifetime_in_seconds, -> { Integer }, optional: true, nullable: false, api_name: "lifetimeInSeconds"
      field :sign_response, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "signResponse"
      field :name_identifier_format, -> { String }, optional: true, nullable: false, api_name: "nameIdentifierFormat"
      field :name_identifier_probes, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "nameIdentifierProbes"
      field :authn_context_class_ref, -> { String }, optional: true, nullable: false, api_name: "authnContextClassRef"
    end
  end
end
