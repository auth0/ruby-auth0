# frozen_string_literal: true

module Auth0
  module Types
    module AuthenticationFlowEnum
      extend Auth0::Internal::Types::Enum

      AUTHENTICATION = "authentication"
      MFA_ENROLLMENT = "mfa_enrollment"
      MFA_CHALLENGE = "mfa_challenge"
      PASSWORD_RESET = "password_reset"
      PASSKEY_ENROLLMENT = "passkey_enrollment"
      ALL = "all"
    end
  end
end
