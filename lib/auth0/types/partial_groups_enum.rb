# frozen_string_literal: true

module Auth0
  module Types
    module PartialGroupsEnum
      extend Auth0::Internal::Types::Enum

      LOGIN = "login"
      LOGIN_ID = "login-id"
      LOGIN_PASSWORD = "login-password"
      LOGIN_PASSWORDLESS = "login-passwordless"
      SIGNUP = "signup"
      SIGNUP_ID = "signup-id"
      SIGNUP_PASSWORD = "signup-password"
      CUSTOMIZED_CONSENT = "customized-consent"
      PASSKEYS = "passkeys"
    end
  end
end
