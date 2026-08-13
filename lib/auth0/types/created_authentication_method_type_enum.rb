# frozen_string_literal: true

module Auth0
  module Types
    module CreatedAuthenticationMethodTypeEnum
      extend Auth0::Internal::Types::Enum

      PHONE = "phone"
      EMAIL = "email"
      TOTP = "totp"
      WEBAUTHN_ROAMING = "webauthn-roaming"
    end
  end
end
