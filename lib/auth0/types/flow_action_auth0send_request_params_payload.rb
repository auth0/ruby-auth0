# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAuth0SendRequestParamsPayload < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }
      member -> { Internal::Types::Array[Object] }
      member -> { Internal::Types::Hash[String, Object] }
    end
  end
end
