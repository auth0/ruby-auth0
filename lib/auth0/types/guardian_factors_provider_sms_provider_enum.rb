# frozen_string_literal: true

module Auth0
  module Types
    module GuardianFactorsProviderSmsProviderEnum
      extend Auth0::Internal::Types::Enum

      AUTH0 = "auth0"
      TWILIO = "twilio"
      PHONE_MESSAGE_HOOK = "phone-message-hook"
    end
  end
end
