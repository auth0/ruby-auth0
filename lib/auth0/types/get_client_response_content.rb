# frozen_string_literal: true

module Auth0
  module Types
    class GetClientResponseContent < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false
      field :tenant, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :global, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :app_type, -> { Auth0::Types::ClientAppTypeEnum }, optional: true, nullable: false
      field :logo_uri, -> { String }, optional: true, nullable: false
      field :is_first_party, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :oidc_conformant, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :callbacks, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :allowed_origins, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :web_origins, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :client_aliases, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :allowed_clients, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :allowed_logout_urls, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :session_transfer, -> { Auth0::Types::ClientSessionTransferConfiguration }, optional: true, nullable: false
      field :oidc_logout, -> { Auth0::Types::ClientOidcBackchannelLogoutSettings }, optional: true, nullable: false
      field :grant_types, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :jwt_configuration, -> { Auth0::Types::ClientJwtConfiguration }, optional: true, nullable: false
      field :signing_keys, -> { Internal::Types::Array[Auth0::Types::ClientSigningKey] }, optional: true, nullable: false
      field :encryption_key, -> { Auth0::Types::ClientEncryptionKey }, optional: true, nullable: false
      field :sso, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :sso_disabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :cross_origin_authentication, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :cross_origin_loc, -> { String }, optional: true, nullable: false
      field :custom_login_page_on, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :custom_login_page, -> { String }, optional: true, nullable: false
      field :custom_login_page_preview, -> { String }, optional: true, nullable: false
      field :form_template, -> { String }, optional: true, nullable: false
      field :addons, -> { Auth0::Types::ClientAddons }, optional: true, nullable: false
      field :token_endpoint_auth_method, -> { Auth0::Types::ClientTokenEndpointAuthMethodEnum }, optional: true, nullable: false
      field :is_token_endpoint_ip_header_trusted, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :client_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :mobile, -> { Auth0::Types::ClientMobile }, optional: true, nullable: false
      field :initiate_login_uri, -> { String }, optional: true, nullable: false
      field :refresh_token, -> { Auth0::Types::ClientRefreshTokenConfiguration }, optional: true, nullable: false
      field :default_organization, -> { Auth0::Types::ClientDefaultOrganization }, optional: true, nullable: false
      field :organization_usage, -> { Auth0::Types::ClientOrganizationUsageEnum }, optional: true, nullable: false
      field :organization_require_behavior, -> { Auth0::Types::ClientOrganizationRequireBehaviorEnum }, optional: true, nullable: false
      field :organization_discovery_methods, -> { Internal::Types::Array[Auth0::Types::ClientOrganizationDiscoveryEnum] }, optional: true, nullable: false
      field :client_authentication_methods, -> { Auth0::Types::ClientAuthenticationMethod }, optional: true, nullable: false
      field :require_pushed_authorization_requests, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :require_proof_of_possession, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :signed_request_object, -> { Auth0::Types::ClientSignedRequestObjectWithCredentialID }, optional: true, nullable: false
      field :compliance_level, -> { Auth0::Types::ClientComplianceLevelEnum }, optional: true, nullable: false
      field :skip_non_verifiable_callback_uri_confirmation_prompt, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :token_exchange, -> { Auth0::Types::ClientTokenExchangeConfiguration }, optional: true, nullable: false
      field :par_request_expiry, -> { Integer }, optional: true, nullable: false
      field :token_quota, -> { Auth0::Types::TokenQuota }, optional: true, nullable: false
      field :express_configuration, -> { Auth0::Types::ExpressConfiguration }, optional: true, nullable: false
      field :my_organization_configuration, -> { Auth0::Types::ClientMyOrganizationResponseConfiguration }, optional: true, nullable: false
      field :third_party_security_mode, -> { Auth0::Types::ClientThirdPartySecurityModeEnum }, optional: true, nullable: false
      field :redirection_policy, -> { Auth0::Types::ClientRedirectionPolicyEnum }, optional: true, nullable: false
      field :resource_server_identifier, -> { String }, optional: true, nullable: false
      field :async_approval_notification_channels, -> { Internal::Types::Array[Auth0::Types::AsyncApprovalNotificationsChannelsEnum] }, optional: true, nullable: false
      field :external_metadata_type, -> { Auth0::Types::ClientExternalMetadataTypeEnum }, optional: true, nullable: false
      field :external_metadata_created_by, -> { Auth0::Types::ClientExternalMetadataCreatedByEnum }, optional: true, nullable: false
      field :external_client_id, -> { String }, optional: true, nullable: false
      field :jwks_uri, -> { String }, optional: true, nullable: false
    end
  end
end
