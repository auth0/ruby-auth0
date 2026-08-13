# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionProviderEnumSms
      extend Auth0::Internal::Types::Enum

      SMS_GATEWAY = "sms_gateway"
      TWILIO = "twilio"
    end
  end
end
