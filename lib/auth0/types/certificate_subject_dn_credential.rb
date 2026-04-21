# frozen_string_literal: true

module Auth0
  module Types
    class CertificateSubjectDnCredential < Internal::Types::Model
      field :credential_type, -> { Auth0::Types::CertificateSubjectDnCredentialTypeEnum }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :subject_dn, -> { String }, optional: true, nullable: false
      field :pem, -> { String }, optional: true, nullable: false
    end
  end
end
