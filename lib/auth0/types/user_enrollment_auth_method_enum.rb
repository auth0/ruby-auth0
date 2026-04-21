# frozen_string_literal: true

module Auth0
  module Types
    module UserEnrollmentAuthMethodEnum
      extend Auth0::Internal::Types::Enum

      AUTHENTICATOR = "authenticator"
      GUARDIAN = "guardian"
      SMS = "sms"
      WEBAUTHN_PLATFORM = "webauthn-platform"
      WEBAUTHN_ROAMING = "webauthn-roaming"
    end
  end
end
