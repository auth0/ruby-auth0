# frozen_string_literal: true

module Auth0
  module Types
    # JWKS representing an array of custom public signing keys.
    class SetCustomSigningKeysResponseContent < Internal::Types::Model
      field :keys, -> { Internal::Types::Array[Auth0::Types::CustomSigningKeyJwk] }, optional: true, nullable: false
    end
  end
end
