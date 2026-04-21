# frozen_string_literal: true

module Auth0
  module Types
    class X509CertificateCredential < Internal::Types::Model
      field :credential_type, -> { Auth0::Types::X509CertificateCredentialTypeEnum }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :pem, -> { String }, optional: false, nullable: false
    end
  end
end
