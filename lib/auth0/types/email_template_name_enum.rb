# frozen_string_literal: true

module Auth0
  module Types
    module EmailTemplateNameEnum
      extend Auth0::Internal::Types::Enum

      VERIFY_EMAIL = "verify_email"
      VERIFY_EMAIL_BY_CODE = "verify_email_by_code"
      RESET_EMAIL = "reset_email"
      RESET_EMAIL_BY_CODE = "reset_email_by_code"
      WELCOME_EMAIL = "welcome_email"
      BLOCKED_ACCOUNT = "blocked_account"
      STOLEN_CREDENTIALS = "stolen_credentials"
      ENROLLMENT_EMAIL = "enrollment_email"
      MFA_OOB_CODE = "mfa_oob_code"
      USER_INVITATION = "user_invitation"
      CHANGE_PASSWORD = "change_password"
      PASSWORD_RESET = "password_reset"
      ASYNC_APPROVAL = "async_approval"
    end
  end
end
