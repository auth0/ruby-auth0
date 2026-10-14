# frozen_string_literal: true

module Auth0
  module Types
    # Default idle refresh token lifetime, in seconds, applied to matched clients.
    class ClientProfileRefreshTokenIdleTokenLifetime < Internal::Types::Model
      field :default_value, -> { Integer }, optional: true, nullable: false
    end
  end
end
