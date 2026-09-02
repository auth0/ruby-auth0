# frozen_string_literal: true

module Auth0
  module Types
    module OrganizationTemplateAllowedStrategyEnum
      extend Auth0::Internal::Types::Enum

      ADFS = "adfs"
      GOOGLE_APPS = "google-apps"
      OIDC = "oidc"
      OKTA = "okta"
      PINGFEDERATE = "pingfederate"
      SAMLP = "samlp"
      WAAD = "waad"
    end
  end
end
