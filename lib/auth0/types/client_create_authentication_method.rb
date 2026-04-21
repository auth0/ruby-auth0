# frozen_string_literal: true

module Auth0
  module Types
    # Defines client authentication methods.
    class ClientCreateAuthenticationMethod < Internal::Types::Model
      field :private_key_jwt, -> { Auth0::Types::ClientCreateAuthenticationMethodPrivateKeyJwt }, optional: true, nullable: false
      field :tls_client_auth, -> { Auth0::Types::ClientCreateAuthenticationMethodTLSClientAuth }, optional: true, nullable: false
      field :self_signed_tls_client_auth, -> { Auth0::Types::CreateClientAuthenticationMethodSelfSignedTLSClientAuth }, optional: true, nullable: false
    end
  end
end
