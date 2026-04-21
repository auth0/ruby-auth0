# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionWhatsappSendMessageParamsPayload < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Internal::Types::Hash[String, Object] }
      member -> { String }
    end
  end
end
