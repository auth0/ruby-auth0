# frozen_string_literal: true

module Auth0
  module Types
    # Defines `private_key_jwt` client authentication method. If this property is defined, the client is enabled to use
    # the Private Key JWT authentication method.
    class ClientAuthenticationMethodPrivateKeyJwt < Internal::Types::Model
      field :credentials, -> { Internal::Types::Array[Auth0::Types::CredentialID] }, optional: false, nullable: false
    end
  end
end
