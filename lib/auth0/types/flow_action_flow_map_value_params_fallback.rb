# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionFlowMapValueParamsFallback < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }
      member -> { Integer }
      member -> { Internal::Types::Hash[String, Object] }
      member -> { Internal::Types::Array[Object] }
    end
  end
end
