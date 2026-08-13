# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionFlowErrorMessageParams < Internal::Types::Model
      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
