# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionFlowDelayFlowParams < Internal::Types::Model
      field :number, -> { Auth0::Types::FlowActionFlowDelayFlowParamsNumber }, optional: false, nullable: false
      field :units, -> { Auth0::Types::FlowActionFlowDelayFlowParamsUnits }, optional: true, nullable: false
    end
  end
end
