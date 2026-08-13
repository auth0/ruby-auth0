# frozen_string_literal: true

module Auth0
  module Types
    # Defines `self_signed_tls_client_auth` client authentication method. If the property is defined, the client is
    # configured to use mTLS authentication method utilizing self-signed certificate.
    class CreateClientAuthenticationMethodSelfSignedTLSClientAuth < Internal::Types::Model
      field :credentials, -> { Internal::Types::Array[Auth0::Types::X509CertificateCredential] }, optional: false, nullable: false
    end
  end
end
