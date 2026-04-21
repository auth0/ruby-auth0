# frozen_string_literal: true

module Auth0
  module Types
    class FormStartNode < Internal::Types::Model
      field :hidden_fields, -> { Internal::Types::Array[Auth0::Types::FormHiddenField] }, optional: true, nullable: false
      field :next_node, -> { Auth0::Types::FormNodePointer }, optional: true, nullable: false
      field :coordinates, -> { Auth0::Types::FormNodeCoordinates }, optional: true, nullable: false
    end
  end
end
