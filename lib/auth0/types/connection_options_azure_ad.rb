# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'waad' connection
    class ConnectionOptionsAzureAd < Internal::Types::Model
      field :api_enable_users, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :app_domain, -> { String }, optional: true, nullable: false
      field :app_id, -> { String }, optional: true, nullable: false
      field :basic_profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :client_id, -> { String }, optional: false, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :domain_aliases, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :ext_access_token, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_account_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_admin, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_agreed_terms, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_assigned_licenses, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_assigned_plans, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_azure_id, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_city, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_country, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_department, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_dir_sync_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_email, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_expires_in, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_family_name, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_fax, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_given_name, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_group_ids, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_groups, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_is_suspended, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_job_title, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_last_sync, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_mobile, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_name, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_nested_groups, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_nickname, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_oid, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_phone, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_physical_delivery_office_name, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_postal_code, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_preferred_language, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_provisioned_plans, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_provisioning_errors, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_proxy_addresses, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_puid, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_refresh_token, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_roles, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_state, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_street, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_telephone_number, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "ext_telephoneNumber"
      field :ext_tenantid, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_upn, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_usage_location, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ext_user_id, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :federated_connections_access_tokens, -> { Auth0::Types::ConnectionFederatedConnectionsAccessTokens }, optional: true, nullable: false
      field :granted, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :icon_url, -> { String }, optional: true, nullable: false
      field :identity_api, -> { Auth0::Types::ConnectionIdentityAPIEnumAzureAd }, optional: true, nullable: false
      field :max_groups_to_retrieve, -> { String }, optional: true, nullable: false
      field :scope, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :should_trust_email_verified_connection, -> { Auth0::Types::ConnectionShouldTrustEmailVerifiedConnectionEnum }, optional: true, nullable: false
      field :tenant_domain, -> { String }, optional: true, nullable: false
      field :tenant_id, -> { String }, optional: true, nullable: false, api_name: "tenantId"
      field :thumbprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
      field :use_wsfed, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :use_common_endpoint, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "useCommonEndpoint"
      field :userid_attribute, -> { Auth0::Types::ConnectionUseridAttributeEnumAzureAd }, optional: true, nullable: false
      field :waad_protocol, -> { Auth0::Types::ConnectionWaadProtocolEnumAzureAd }, optional: true, nullable: false
    end
  end
end
