# frozen_string_literal: true

module Auth0
  module Types
    module EventStreamCloudEventContextTransactionProtocolEnum
      extend Auth0::Internal::Types::Enum

      OIDC_BASIC_PROFILE = "oidc-basic-profile"
      OIDC_IMPLICIT_PROFILE = "oidc-implicit-profile"
      OAUTH2DEVICE_CODE = "oauth2-device-code"
      OAUTH2RESOURCE_OWNER = "oauth2-resource-owner"
      OAUTH2RESOURCE_OWNER_JWT_BEARER = "oauth2-resource-owner-jwt-bearer"
      OAUTH2PASSWORD = "oauth2-password"
      OAUTH2WEBAUTHN = "oauth2-webauthn"
      OAUTH2ACCESS_TOKEN = "oauth2-access-token"
      OAUTH2REFRESH_TOKEN = "oauth2-refresh-token"
      OAUTH2TOKEN_EXCHANGE = "oauth2-token-exchange"
      OIDC_HYBRID_PROFILE = "oidc-hybrid-profile"
      SAMLP = "samlp"
      WSFED = "wsfed"
      WSTRUST_USERNAMEMIXED = "wstrust-usernamemixed"
    end
  end
end
