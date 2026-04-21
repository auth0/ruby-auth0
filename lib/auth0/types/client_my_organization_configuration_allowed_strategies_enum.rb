# frozen_string_literal: true

module Auth0
  module Types
    module ClientMyOrganizationConfigurationAllowedStrategiesEnum
      extend Auth0::Internal::Types::Enum

      PINGFEDERATE = "pingfederate"
      ADFS = "adfs"
      WAAD = "waad"
      GOOGLE_APPS = "google-apps"
      OKTA = "okta"
      OIDC = "oidc"
      SAMLP = "samlp"
    end
  end
end
