# frozen_string_literal: true

module Auth0
  module Types
    # Refresh token settings. Omit any sub-field to use the client's own value.
    class ClientProfileClientConfigurationRefreshToken < Internal::Types::Model
      field :token_lifetime, -> { Auth0::Types::ClientProfileRefreshTokenTokenLifetime }, optional: true, nullable: false

      field :idle_token_lifetime, -> { Auth0::Types::ClientProfileRefreshTokenIdleTokenLifetime }, optional: true, nullable: false

      field :leeway, -> { Auth0::Types::ClientProfileRefreshTokenLeeway }, optional: true, nullable: false
    end
  end
end
