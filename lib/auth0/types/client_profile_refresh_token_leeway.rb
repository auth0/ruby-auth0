# frozen_string_literal: true

module Auth0
  module Types
    # Default refresh token rotation leeway, in seconds, applied to matched clients.
    class ClientProfileRefreshTokenLeeway < Internal::Types::Model
      field :default_value, -> { Integer }, optional: true, nullable: false
    end
  end
end
