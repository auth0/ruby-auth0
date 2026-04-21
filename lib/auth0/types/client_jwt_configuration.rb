# frozen_string_literal: true

module Auth0
  module Types
    # Configuration related to JWTs for the client.
    class ClientJwtConfiguration < Internal::Types::Model
      field :lifetime_in_seconds, -> { Integer }, optional: true, nullable: false
      field :secret_encoded, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :scopes, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :alg, -> { Auth0::Types::SigningAlgorithmEnum }, optional: true, nullable: false
    end
  end
end
