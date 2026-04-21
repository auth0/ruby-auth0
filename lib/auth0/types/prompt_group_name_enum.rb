# frozen_string_literal: true

module Auth0
  module Types
    module PromptGroupNameEnum
      extend Auth0::Internal::Types::Enum

      LOGIN = "login"
      LOGIN_ID = "login-id"
      LOGIN_PASSWORD = "login-password"
      LOGIN_PASSWORDLESS = "login-passwordless"
      LOGIN_EMAIL_VERIFICATION = "login-email-verification"
      SIGNUP = "signup"
      SIGNUP_ID = "signup-id"
      SIGNUP_PASSWORD = "signup-password"
      PHONE_IDENTIFIER_ENROLLMENT = "phone-identifier-enrollment"
      PHONE_IDENTIFIER_CHALLENGE = "phone-identifier-challenge"
      EMAIL_IDENTIFIER_CHALLENGE = "email-identifier-challenge"
      RESET_PASSWORD = "reset-password"
      CUSTOM_FORM = "custom-form"
      CONSENT = "consent"
      CUSTOMIZED_CONSENT = "customized-consent"
      LOGOUT = "logout"
      MFA_PUSH = "mfa-push"
      MFA_OTP = "mfa-otp"
      MFA_VOICE = "mfa-voice"
      MFA_PHONE = "mfa-phone"
      MFA_WEBAUTHN = "mfa-webauthn"
      MFA_SMS = "mfa-sms"
      MFA_EMAIL = "mfa-email"
      MFA_RECOVERY_CODE = "mfa-recovery-code"
      MFA = "mfa"
      STATUS = "status"
      DEVICE_FLOW = "device-flow"
      EMAIL_VERIFICATION = "email-verification"
      EMAIL_OTP_CHALLENGE = "email-otp-challenge"
      ORGANIZATIONS = "organizations"
      INVITATION = "invitation"
      COMMON = "common"
      PASSKEYS = "passkeys"
      CAPTCHA = "captcha"
      BRUTE_FORCE_PROTECTION = "brute-force-protection"
      ASYNC_APPROVAL_FLOW = "async-approval-flow"
    end
  end
end
