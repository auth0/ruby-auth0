# frozen_string_literal: true

module Auth0
  module Types
    # Client authentication methods derived from the JWKS document
    class CimdMappedClientAuthenticationMethods < Internal::Types::Model
      field :private_key_jwt, -> { Auth0::Types::CimdMappedClientAuthenticationMethodsPrivateKeyJwt }, optional: true, nullable: false
    end
  end
end
