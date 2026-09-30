# frozen_string_literal: true

module Auth0
  module Types
    class ListVariationsResponseContent < Internal::Types::Model
      field :variations, -> { Internal::Types::Array[Auth0::Types::Variation] }, optional: false, nullable: false
    end
  end
end
