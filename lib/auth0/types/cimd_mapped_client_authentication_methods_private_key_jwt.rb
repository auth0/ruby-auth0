# frozen_string_literal: true

module Auth0
  module Types
    # Private Key JWT authentication configuration
    class CimdMappedClientAuthenticationMethodsPrivateKeyJwt < Internal::Types::Model
      field :credentials, -> { Internal::Types::Array[Auth0::Types::CimdMappedPrivateKeyJwtCredential] }, optional: false, nullable: false
    end
  end
end
