# frozen_string_literal: true

module Auth0
  module Types
    module PhoneTemplateNotificationTypeEnum
      extend Auth0::Internal::Types::Enum

      OTP_VERIFY = "otp_verify"
      OTP_ENROLL = "otp_enroll"
      CHANGE_PASSWORD = "change_password"
      BLOCKED_ACCOUNT = "blocked_account"
      PASSWORD_BREACH = "password_breach"
    end
  end
end
