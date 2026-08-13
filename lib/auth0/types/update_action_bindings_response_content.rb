# frozen_string_literal: true

module Auth0
  module Types
    class UpdateActionBindingsResponseContent < Internal::Types::Model
      field :bindings, -> { Internal::Types::Array[Auth0::Types::ActionBinding] }, optional: true, nullable: false
    end
  end
end
