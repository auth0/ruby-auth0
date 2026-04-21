# frozen_string_literal: true

module Auth0
  module Types
    class PatchClientCredentialResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :kid, -> { String }, optional: true, nullable: false
      field :alg, -> { Auth0::Types::ClientCredentialAlgorithmEnum }, optional: true, nullable: false
      field :credential_type, -> { Auth0::Types::ClientCredentialTypeEnum }, optional: true, nullable: false
      field :subject_dn, -> { String }, optional: true, nullable: false
      field :thumbprint_sha256, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :expires_at, -> { String }, optional: true, nullable: false
    end
  end
end
