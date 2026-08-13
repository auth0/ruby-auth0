# frozen_string_literal: true

module Auth0
  module Types
    module SelfServiceProfileAllowedStrategyEnum
      extend Auth0::Internal::Types::Enum

      OIDC = "oidc"
      SAMLP = "samlp"
      WAAD = "waad"
      GOOGLE_APPS = "google-apps"
      ADFS = "adfs"
      OKTA = "okta"
      AUTH0SAMLP = "auth0-samlp"
      OKTA_SAMLP = "okta-samlp"
      KEYCLOAK_SAMLP = "keycloak-samlp"
      PINGFEDERATE = "pingfederate"
    end
  end
end
