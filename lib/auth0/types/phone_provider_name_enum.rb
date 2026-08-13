# frozen_string_literal: true

module Auth0
  module Types
    module PhoneProviderNameEnum
      extend Auth0::Internal::Types::Enum

      TWILIO = "twilio"
      CUSTOM = "custom"
    end
  end
end
