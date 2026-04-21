# frozen_string_literal: true

module Auth0
  module Types
    class FormBlockJumpButtonConfig < Internal::Types::Model
      field :text, -> { String }, optional: false, nullable: false
      field :next_node, -> { Auth0::Types::FormNodePointer }, optional: false, nullable: false
      field :style, -> { Auth0::Types::FormBlockJumpButtonConfigStyle }, optional: true, nullable: false
    end
  end
end
