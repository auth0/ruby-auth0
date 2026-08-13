# frozen_string_literal: true

module Auth0
  module Types
    module ActionTriggerTypeEnum
      extend Auth0::Internal::Types::Enum

      POST_LOGIN = "post-login"
      CREDENTIALS_EXCHANGE = "credentials-exchange"
      PRE_USER_REGISTRATION = "pre-user-registration"
      POST_USER_REGISTRATION = "post-user-registration"
      POST_CHANGE_PASSWORD = "post-change-password"
      SEND_PHONE_MESSAGE = "send-phone-message"
      CUSTOM_PHONE_PROVIDER = "custom-phone-provider"
      CUSTOM_EMAIL_PROVIDER = "custom-email-provider"
      PASSWORD_RESET_POST_CHALLENGE = "password-reset-post-challenge"
      CUSTOM_TOKEN_EXCHANGE = "custom-token-exchange"
      EVENT_STREAM = "event-stream"
      PASSWORD_HASH_MIGRATION = "password-hash-migration"
      LOGIN_POST_IDENTIFIER = "login-post-identifier"
      SIGNUP_POST_IDENTIFIER = "signup-post-identifier"
    end
  end
end
