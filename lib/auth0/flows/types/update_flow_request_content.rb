# frozen_string_literal: true

module Auth0
  module Flows
    module Types
      class UpdateFlowRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :actions, -> { Internal::Types::Array[Auth0::Types::FlowAction] }, optional: true, nullable: false
      end
    end
  end
end
