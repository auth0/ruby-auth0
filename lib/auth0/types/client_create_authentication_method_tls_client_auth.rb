# frozen_string_literal: true

module Auth0
  module Types
    # Defines `tls_client_auth` client authentication method. If the property is defined, the client is configured to
    # use CA-based mTLS authentication method.
    class ClientCreateAuthenticationMethodTLSClientAuth < Internal::Types::Model
      field :credentials, -> { Internal::Types::Array[Auth0::Types::CertificateSubjectDnCredential] }, optional: false, nullable: false
    end
  end
end
