# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'adfs' connection
    class ConnectionOptionsAdfs < Internal::Types::Model
      field :adfs_server, -> { String }, optional: true, nullable: false
      field :domain_aliases, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :entity_id, -> { String }, optional: true, nullable: false, api_name: "entityId"
      field :fed_metadata_xml, -> { String }, optional: true, nullable: false, api_name: "fedMetadataXml"
      field :icon_url, -> { String }, optional: true, nullable: false
      field :prev_thumbprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :should_trust_email_verified_connection, -> { Auth0::Types::ConnectionShouldTrustEmailVerifiedConnectionEnum }, optional: true, nullable: false
      field :sign_in_endpoint, -> { String }, optional: true, nullable: false, api_name: "signInEndpoint"
      field :tenant_domain, -> { String }, optional: true, nullable: false
      field :thumbprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
      field :user_id_attribute, -> { String }, optional: true, nullable: false
    end
  end
end
