# frozen_string_literal: true

module Auth0
  module Types
    # Additional property for session actor, can be string, boolean, or number.
    class SessionActorClaimValue < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }

      member -> { Internal::Types::Boolean }

      member -> { Integer }
    end
  end
end
