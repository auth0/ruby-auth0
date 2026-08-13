# frozen_string_literal: true

module Auth0
  module Types
    class ListUserBlocksByIdentifierResponseContent < Internal::Types::Model
      field :blocked_for, -> { Internal::Types::Array[Auth0::Types::UserBlockIdentifier] }, optional: true, nullable: false
    end
  end
end
