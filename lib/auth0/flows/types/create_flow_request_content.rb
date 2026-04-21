# frozen_string_literal: true

module Auth0
  module Flows
    module Types
      class CreateFlowRequestContent < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
        field :actions, -> { Internal::Types::Array[Auth0::Types::FlowAction] }, optional: true, nullable: false
      end
    end
  end
end
