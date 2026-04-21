# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionFlowBooleanConditionParams < Internal::Types::Model
      field :then_, -> { Internal::Types::Array[Auth0::Types::FlowAction] }, optional: true, nullable: false, api_name: "then"
      field :else_, -> { Internal::Types::Array[Auth0::Types::FlowAction] }, optional: true, nullable: false, api_name: "else"
    end
  end
end
