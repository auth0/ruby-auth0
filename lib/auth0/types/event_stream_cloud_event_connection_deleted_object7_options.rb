# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'waad' connection
    class EventStreamCloudEventConnectionDeletedObject7Options < Internal::Types::Model
      field :api_enable_users, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :app_domain, -> { String }, optional: true, nullable: false

      field :app_id, -> { String }, optional: true, nullable: false

      field :basic_profile, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :cert_rollover_notification, -> { String }, optional: true, nullable: false

      field :client_id, -> { String }, optional: false, nullable: false

      field :domain, -> { String }, optional: true, nullable: false

      field :domain_aliases, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :ext_groups, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :ext_nested_groups, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :ext_profile, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :federated_connections_access_tokens, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject7OptionsFederatedConnectionsAccessTokens }, optional: true, nullable: false

      field :granted, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :icon_url, -> { String }, optional: true, nullable: false

      field :identity_api, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject7OptionsIdentityAPIEnum }, optional: true, nullable: false

      field :max_groups_to_retrieve, -> { String }, optional: true, nullable: false

      field :non_persistent_attrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :scope, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :set_user_root_attributes, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject7OptionsSetUserRootAttributesEnum }, optional: true, nullable: false

      field :should_trust_email_verified_connection, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject7OptionsShouldTrustEmailVerifiedConnectionEnum }, optional: true, nullable: false

      field :tenant_domain, -> { String }, optional: true, nullable: false

      field :tenant_id, -> { String }, optional: true, nullable: false, api_name: "tenantId"

      field :thumbprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :upstream_params, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :use_wsfed, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :use_common_endpoint, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "useCommonEndpoint"

      field :userid_attribute, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject7OptionsUseridAttributeEnum }, optional: true, nullable: false

      field :waad_protocol, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject7OptionsWaadProtocolEnum }, optional: true, nullable: false
    end
  end
end
