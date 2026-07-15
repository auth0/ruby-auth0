# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'pingfederate' connection
    class EventStreamCloudEventConnectionCreatedObject3Options < Internal::Types::Model
      field :assertion_decryption_settings, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject3OptionsAssertionDecryptionSettings }, optional: true, nullable: false

      field :cert, -> { String }, optional: true, nullable: false

      field :cert_rollover_notification, -> { String }, optional: true, nullable: false

      field :digest_algorithm, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject3OptionsDigestAlgorithmEnum }, optional: true, nullable: false, api_name: "digestAlgorithm"

      field :domain_aliases, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :entity_id, -> { String }, optional: true, nullable: false, api_name: "entityId"

      field :expires, -> { String }, optional: true, nullable: false

      field :icon_url, -> { String }, optional: true, nullable: false

      field :idpinitiated, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject3OptionsIdpinitiated }, optional: true, nullable: false

      field :non_persistent_attrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :protocol_binding, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject3OptionsProtocolBindingEnum }, optional: true, nullable: false, api_name: "protocolBinding"

      field :set_user_root_attributes, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject3OptionsSetUserRootAttributesEnum }, optional: true, nullable: false

      field :signature_algorithm, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject3OptionsSignatureAlgorithmEnum }, optional: true, nullable: false, api_name: "signatureAlgorithm"

      field :sign_in_endpoint, -> { String }, optional: true, nullable: false, api_name: "signInEndpoint"

      field :signing_cert, -> { String }, optional: true, nullable: false, api_name: "signingCert"

      field :sign_saml_request, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "signSAMLRequest"

      field :subject, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject3OptionsSubject }, optional: true, nullable: false

      field :tenant_domain, -> { String }, optional: true, nullable: false

      field :thumbprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :upstream_params, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :ping_federate_base_url, -> { String }, optional: false, nullable: false, api_name: "pingFederateBaseUrl"
    end
  end
end
