# frozen_string_literal: true

module Auth0
  module Types
    class ListActionTriggersResponseContent < Internal::Types::Model
      field :triggers, -> { Internal::Types::Array[Auth0::Types::ActionTrigger] }, optional: true, nullable: false
    end
  end
end
