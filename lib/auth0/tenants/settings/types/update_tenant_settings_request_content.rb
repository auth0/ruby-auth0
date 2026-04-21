# frozen_string_literal: true

module Auth0
  module Tenants
    module Settings
      module Types
        class UpdateTenantSettingsRequestContent < Internal::Types::Model
          field :change_password, -> { Auth0::Types::TenantSettingsPasswordPage }, optional: true, nullable: false
          field :device_flow, -> { Auth0::Types::TenantSettingsDeviceFlow }, optional: true, nullable: false
          field :guardian_mfa_page, -> { Auth0::Types::TenantSettingsGuardianPage }, optional: true, nullable: false
          field :default_audience, -> { String }, optional: true, nullable: false
          field :default_directory, -> { String }, optional: true, nullable: false
          field :error_page, -> { Auth0::Types::TenantSettingsErrorPage }, optional: true, nullable: false
          field :default_token_quota, -> { Auth0::Types::DefaultTokenQuota }, optional: true, nullable: false
          field :flags, -> { Auth0::Types::TenantSettingsFlags }, optional: true, nullable: false
          field :friendly_name, -> { String }, optional: true, nullable: false
          field :picture_url, -> { String }, optional: true, nullable: false
          field :support_email, -> { String }, optional: true, nullable: false
          field :support_url, -> { String }, optional: true, nullable: false
          field :allowed_logout_urls, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :session_lifetime, -> { Integer }, optional: true, nullable: false
          field :idle_session_lifetime, -> { Integer }, optional: true, nullable: false
          field :ephemeral_session_lifetime, -> { Integer }, optional: true, nullable: false
          field :idle_ephemeral_session_lifetime, -> { Integer }, optional: true, nullable: false
          field :sandbox_version, -> { String }, optional: true, nullable: false
          field :legacy_sandbox_version, -> { String }, optional: true, nullable: false
          field :default_redirection_uri, -> { String }, optional: true, nullable: false
          field :enabled_locales, -> { Internal::Types::Array[Auth0::Types::TenantSettingsSupportedLocalesEnum] }, optional: true, nullable: false
          field :session_cookie, -> { Auth0::Types::SessionCookieSchema }, optional: true, nullable: false
          field :sessions, -> { Auth0::Types::TenantSettingsSessions }, optional: true, nullable: false
          field :oidc_logout, -> { Auth0::Types::TenantOidcLogoutSettings }, optional: true, nullable: false
          field :customize_mfa_in_postlogin_action, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :allow_organization_name_in_authentication_api, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :acr_values_supported, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :mtls, -> { Auth0::Types::TenantSettingsMtls }, optional: true, nullable: false
          field :pushed_authorization_requests_supported, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :authorization_response_iss_parameter_supported, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :skip_non_verifiable_callback_uri_confirmation_prompt, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :resource_parameter_profile, -> { Auth0::Types::TenantSettingsResourceParameterProfile }, optional: true, nullable: false
          field :client_id_metadata_document_supported, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :enable_ai_guide, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :phone_consolidated_experience, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :dynamic_client_registration_security_mode, -> { Auth0::Types::TenantSettingsDynamicClientRegistrationSecurityMode }, optional: true, nullable: false
        end
      end
    end
  end
end
