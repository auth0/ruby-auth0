# frozen_string_literal: true

module Auth0
  module Types
    # Defines client authentication methods.
    class ClientAuthenticationMethod < Internal::Types::Model
      field :private_key_jwt, -> { Auth0::Types::ClientAuthenticationMethodPrivateKeyJwt }, optional: true, nullable: false
      field :tls_client_auth, -> { Auth0::Types::ClientAuthenticationMethodTLSClientAuth }, optional: true, nullable: false
      field :self_signed_tls_client_auth, -> { Auth0::Types::ClientAuthenticationMethodSelfSignedTLSClientAuth }, optional: true, nullable: false
    end
  end
end
