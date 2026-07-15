# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'samlp' connection
    class EventStreamCloudEventConnectionCreatedObject2Options < Internal::Types::Model
      field :assertion_decryption_settings, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject2OptionsAssertionDecryptionSettings }, optional: true, nullable: false

      field :cert, -> { String }, optional: true, nullable: false

      field :cert_rollover_notification, -> { String }, optional: true, nullable: false

      field :digest_algorithm, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject2OptionsDigestAlgorithmEnum }, optional: true, nullable: false, api_name: "digestAlgorithm"

      field :domain_aliases, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :entity_id, -> { String }, optional: true, nullable: false, api_name: "entityId"

      field :expires, -> { String }, optional: true, nullable: false

      field :icon_url, -> { String }, optional: true, nullable: false

      field :idpinitiated, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject2OptionsIdpinitiated }, optional: true, nullable: false

      field :non_persistent_attrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :protocol_binding, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject2OptionsProtocolBindingEnum }, optional: true, nullable: false, api_name: "protocolBinding"

      field :set_user_root_attributes, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject2OptionsSetUserRootAttributesEnum }, optional: true, nullable: false

      field :signature_algorithm, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject2OptionsSignatureAlgorithmEnum }, optional: true, nullable: false, api_name: "signatureAlgorithm"

      field :sign_in_endpoint, -> { String }, optional: true, nullable: false, api_name: "signInEndpoint"

      field :signing_cert, -> { String }, optional: true, nullable: false, api_name: "signingCert"

      field :sign_saml_request, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "signSAMLRequest"

      field :subject, -> { Auth0::Types::EventStreamCloudEventConnectionCreatedObject2OptionsSubject }, optional: true, nullable: false

      field :tenant_domain, -> { String }, optional: true, nullable: false

      field :thumbprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :upstream_params, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :debug, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :deflate, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :destination_url, -> { String }, optional: true, nullable: false, api_name: "destinationUrl"

      field :disable_signout, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "disableSignout"

      field :fields_map, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "fieldsMap"

      field :global_token_revocation_jwt_iss, -> { String }, optional: true, nullable: false

      field :global_token_revocation_jwt_sub, -> { String }, optional: true, nullable: false

      field :metadata_url, -> { String }, optional: true, nullable: false, api_name: "metadataUrl"

      field :recipient_url, -> { String }, optional: true, nullable: false, api_name: "recipientUrl"

      field :request_template, -> { String }, optional: true, nullable: false, api_name: "requestTemplate"

      field :sign_out_endpoint, -> { String }, optional: true, nullable: false, api_name: "signOutEndpoint"

      field :user_id_attribute, -> { String }, optional: true, nullable: false
    end
  end
end
