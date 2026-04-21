# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionFlowStoreVarsParams < Internal::Types::Model
      field :vars, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
