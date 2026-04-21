# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'samlp' connection
    class ConnectionOptionsSAML < Internal::Types::Model
      field :debug, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :deflate, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :destination_url, -> { String }, optional: true, nullable: false, api_name: "destinationUrl"
      field :disable_signout, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "disableSignout"
      field :fields_map, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionFieldsMapSAMLValue] }, optional: true, nullable: false, api_name: "fieldsMap"
      field :global_token_revocation_jwt_iss, -> { String }, optional: true, nullable: false
      field :global_token_revocation_jwt_sub, -> { String }, optional: true, nullable: false
      field :metadata_url, -> { String }, optional: true, nullable: false, api_name: "metadataUrl"
      field :metadata_xml, -> { String }, optional: true, nullable: false, api_name: "metadataXml"
      field :recipient_url, -> { String }, optional: true, nullable: false, api_name: "recipientUrl"
      field :request_template, -> { String }, optional: true, nullable: false, api_name: "requestTemplate"
      field :signing_cert, -> { String }, optional: true, nullable: false, api_name: "signingCert"
      field :signing_key, -> { Auth0::Types::ConnectionSigningKeySAML }, optional: true, nullable: false
      field :sign_out_endpoint, -> { String }, optional: true, nullable: false, api_name: "signOutEndpoint"
      field :user_id_attribute, -> { String }, optional: true, nullable: false
    end
  end
end
