# frozen_string_literal: true

module Auth0
  module Types
    class FormStepConfig < Internal::Types::Model
      field :components, -> { Internal::Types::Array[Auth0::Types::FormComponent] }, optional: true, nullable: false
      field :next_node, -> { Auth0::Types::FormNodePointer }, optional: true, nullable: false
    end
  end
end
