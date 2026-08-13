# frozen_string_literal: true

module Auth0
  module Types
    module CreatedUserAuthenticationMethodTypeEnum
      extend Auth0::Internal::Types::Enum

      PHONE = "phone"
      EMAIL = "email"
      TOTP = "totp"
      WEBAUTHN_ROAMING = "webauthn-roaming"
      PASSKEY = "passkey"
    end
  end
end
