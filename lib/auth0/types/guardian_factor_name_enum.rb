# frozen_string_literal: true

module Auth0
  module Types
    module GuardianFactorNameEnum
      extend Auth0::Internal::Types::Enum

      PUSH_NOTIFICATION = "push-notification"
      SMS = "sms"
      EMAIL = "email"
      DUO = "duo"
      OTP = "otp"
      WEBAUTHN_ROAMING = "webauthn-roaming"
      WEBAUTHN_PLATFORM = "webauthn-platform"
      RECOVERY_CODE = "recovery-code"
    end
  end
end
