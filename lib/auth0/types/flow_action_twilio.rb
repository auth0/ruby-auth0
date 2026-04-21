# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionTwilio < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionTwilioMakeCall }
      member -> { Auth0::Types::FlowActionTwilioSendSms }
    end
  end
end
