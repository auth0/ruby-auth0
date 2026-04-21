# frozen_string_literal: true

module Auth0
  module Types
    module GuardianEnrollmentFactorEnum
      extend Auth0::Internal::Types::Enum

      PUSH_NOTIFICATION = "push-notification"
      PHONE = "phone"
      EMAIL = "email"
      OTP = "otp"
      WEBAUTHN_ROAMING = "webauthn-roaming"
      WEBAUTHN_PLATFORM = "webauthn-platform"
    end
  end
end
