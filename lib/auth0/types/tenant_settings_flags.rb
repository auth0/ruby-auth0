# frozen_string_literal: true

module Auth0
  module Types
    # Flags used to change the behavior of this tenant.
    class TenantSettingsFlags < Internal::Types::Model
      field :change_pwd_flow_v1, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enable_apis_section, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :disable_impersonation, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enable_client_connections, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enable_pipeline2, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :allow_legacy_delegation_grant_types, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :allow_legacy_ro_grant_types, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :allow_legacy_tokeninfo_endpoint, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enable_legacy_profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enable_idtoken_api2, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enable_public_signup_user_exists_error, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enable_sso, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :allow_changing_enable_sso, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :disable_clickjack_protection_headers, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :no_disclose_enterprise_connections, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enforce_client_authentication_on_passwordless_start, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enable_adfs_waad_email_verification, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :revoke_refresh_token_grant, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :dashboard_log_streams_next, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :dashboard_insights_view, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :disable_fields_map_fix, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :mfa_show_factor_list_on_enrollment, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :remove_alg_from_jwks, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :improved_signup_bot_detection_in_classic, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :genai_trial, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enable_dynamic_client_registration, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :disable_management_api_sms_obfuscation, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :trust_azure_adfs_email_verified_connection_property, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :custom_domains_provisioning, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
