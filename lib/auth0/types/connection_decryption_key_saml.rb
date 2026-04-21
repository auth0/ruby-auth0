# frozen_string_literal: true

module Auth0
  module Types
    # Private key used to decrypt encrypted SAML Assertions received from the identity provider. Required when the
    # identity provider encrypts assertions for enhanced security. Can be a string (PEM) or an object with key-value
    # pairs.
    class ConnectionDecryptionKeySAML < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::ConnectionDecryptionKeySAMLCert }
      member -> { String }
    end
  end
end
