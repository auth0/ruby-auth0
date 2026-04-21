# frozen_string_literal: true

module Auth0
  module Types
    class ActionBindingWithRef < Internal::Types::Model
      field :ref, -> { Auth0::Types::ActionBindingRef }, optional: false, nullable: false
      field :display_name, -> { String }, optional: true, nullable: false
      field :secrets, -> { Internal::Types::Array[Auth0::Types::ActionSecretRequest] }, optional: true, nullable: false
    end
  end
end
