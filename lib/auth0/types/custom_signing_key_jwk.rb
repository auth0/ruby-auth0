# frozen_string_literal: true

module Auth0
  module Types
    # JWK representing a custom public signing key.
    class CustomSigningKeyJwk < Internal::Types::Model
      field :kty, -> { Auth0::Types::CustomSigningKeyTypeEnum }, optional: false, nullable: false
      field :kid, -> { String }, optional: true, nullable: false
      field :use, -> { Auth0::Types::CustomSigningKeyUseEnum }, optional: true, nullable: false
      field :key_ops, -> { Internal::Types::Array[Auth0::Types::CustomSigningKeyOperationEnum] }, optional: true, nullable: false
      field :alg, -> { Auth0::Types::CustomSigningKeyAlgorithmEnum }, optional: true, nullable: false
      field :n, -> { String }, optional: true, nullable: false
      field :e, -> { String }, optional: true, nullable: false
      field :crv, -> { Auth0::Types::CustomSigningKeyCurveEnum }, optional: true, nullable: false
      field :x, -> { String }, optional: true, nullable: false
      field :y, -> { String }, optional: true, nullable: false
      field :x5u, -> { String }, optional: true, nullable: false
      field :x5c, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :x5t, -> { String }, optional: true, nullable: false
      field :x5t_s256, -> { String }, optional: true, nullable: false, api_name: "x5t#S256"
    end
  end
end
