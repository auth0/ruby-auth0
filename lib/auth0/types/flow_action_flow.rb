# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionFlow < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionFlowBooleanCondition }
      member -> { Auth0::Types::FlowActionFlowDelayFlow }
      member -> { Auth0::Types::FlowActionFlowDoNothing }
      member -> { Auth0::Types::FlowActionFlowErrorMessage }
      member -> { Auth0::Types::FlowActionFlowMapValue }
      member -> { Auth0::Types::FlowActionFlowReturnJSON }
      member -> { Auth0::Types::FlowActionFlowStoreVars }
    end
  end
end
