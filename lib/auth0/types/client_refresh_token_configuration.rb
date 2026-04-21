# frozen_string_literal: true

module Auth0
  module Types
    # Refresh token configuration
    class ClientRefreshTokenConfiguration < Internal::Types::Model
      field :rotation_type, -> { Auth0::Types::RefreshTokenRotationTypeEnum }, optional: false, nullable: false
      field :expiration_type, -> { Auth0::Types::RefreshTokenExpirationTypeEnum }, optional: false, nullable: false
      field :leeway, -> { Integer }, optional: true, nullable: false
      field :token_lifetime, -> { Integer }, optional: true, nullable: false
      field :infinite_token_lifetime, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :idle_token_lifetime, -> { Integer }, optional: true, nullable: false
      field :infinite_idle_token_lifetime, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :policies, -> { Internal::Types::Array[Auth0::Types::ClientRefreshTokenPolicy] }, optional: true, nullable: false
    end
  end
end
