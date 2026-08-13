# frozen_string_literal: true

module Auth0
  module Types
    # Unique identifier of the user for this identity.
    class UserID < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }

      member -> { Integer }
    end
  end
end
