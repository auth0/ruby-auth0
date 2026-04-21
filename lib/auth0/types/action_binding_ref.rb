# frozen_string_literal: true

module Auth0
  module Types
    # A reference to an action. An action can be referred to by ID or by Name.
    class ActionBindingRef < Internal::Types::Model
      field :type, -> { Auth0::Types::ActionBindingRefTypeEnum }, optional: true, nullable: false
      field :value, -> { String }, optional: true, nullable: false
    end
  end
end
