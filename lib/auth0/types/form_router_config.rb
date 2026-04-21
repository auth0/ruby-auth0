# frozen_string_literal: true

module Auth0
  module Types
    class FormRouterConfig < Internal::Types::Model
      field :rules, -> { Internal::Types::Array[Auth0::Types::FormRouterRule] }, optional: true, nullable: false
      field :fallback, -> { Auth0::Types::FormNodePointer }, optional: true, nullable: false
    end
  end
end
