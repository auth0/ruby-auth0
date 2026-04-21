# frozen_string_literal: true

module Auth0
  module Types
    module ClientCredentialTypeEnum
      extend Auth0::Internal::Types::Enum

      PUBLIC_KEY = "public_key"
      CERT_SUBJECT_DN = "cert_subject_dn"
      X509CERT = "x509_cert"
    end
  end
end
