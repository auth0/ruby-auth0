# frozen_string_literal: true

module Auth0
  module Types
    module AuthenticationMethodTypeEnum
      extend Auth0::Internal::Types::Enum

      RECOVERY_CODE = "recovery-code"
      TOTP = "totp"
      PUSH = "push"
      PHONE = "phone"
      EMAIL = "email"
      EMAIL_VERIFICATION = "email-verification"
      WEBAUTHN_ROAMING = "webauthn-roaming"
      WEBAUTHN_PLATFORM = "webauthn-platform"
      GUARDIAN = "guardian"
      PASSKEY = "passkey"
      PASSWORD = "password"
    end
  end
end
