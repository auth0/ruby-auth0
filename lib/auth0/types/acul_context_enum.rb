# frozen_string_literal: true

module Auth0
  module Types
    module AculContextEnum
      extend Auth0::Internal::Types::Enum

      BRANDING_SETTINGS = "branding.settings"
      BRANDING_THEMES_DEFAULT = "branding.themes.default"
      CLIENT_LOGO_URI = "client.logo_uri"
      CLIENT_DESCRIPTION = "client.description"
      ORGANIZATION_DISPLAY_NAME = "organization.display_name"
      ORGANIZATION_BRANDING = "organization.branding"
      SCREEN_TEXTS = "screen.texts"
      TENANT_NAME = "tenant.name"
      TENANT_FRIENDLY_NAME = "tenant.friendly_name"
      TENANT_LOGO_URL = "tenant.logo_url"
      TENANT_ENABLED_LOCALES = "tenant.enabled_locales"
      UNTRUSTED_DATA_SUBMITTED_FORM_DATA = "untrusted_data.submitted_form_data"
      UNTRUSTED_DATA_AUTHORIZATION_PARAMS_LOGIN_HINT = "untrusted_data.authorization_params.login_hint"
      UNTRUSTED_DATA_AUTHORIZATION_PARAMS_SCREEN_HINT = "untrusted_data.authorization_params.screen_hint"
      UNTRUSTED_DATA_AUTHORIZATION_PARAMS_UI_LOCALES = "untrusted_data.authorization_params.ui_locales"
      USER_ORGANIZATIONS = "user.organizations"
      TRANSACTION_CUSTOM_DOMAIN_DOMAIN = "transaction.custom_domain.domain"
    end
  end
end
