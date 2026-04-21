# frozen_string_literal: true

module Auth0
  module Types
    class PublicKeyCredential < Internal::Types::Model
      field :credential_type, -> { Auth0::Types::PublicKeyCredentialTypeEnum }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :pem, -> { String }, optional: false, nullable: false
      field :alg, -> { Auth0::Types::PublicKeyCredentialAlgorithmEnum }, optional: true, nullable: false
      field :parse_expiry_from_cert, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :expires_at, -> { String }, optional: true, nullable: false
      field :kid, -> { String }, optional: true, nullable: false
    end
  end
end
