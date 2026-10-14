# frozen_string_literal: true

module Auth0
  module Types
    # Default refresh token lifetime, in seconds, applied to matched clients.
    class ClientProfileRefreshTokenTokenLifetime < Internal::Types::Model
      field :default_value, -> { Integer }, optional: true, nullable: false
    end
  end
end
