# frozen_string_literal: true

module Auth0
  module Types
    class RotateConnectionKeysRequestContent < Internal::Types::Model
      field :key_use, -> { Auth0::Types::ConnectionKeyUseEnum }, optional: true, nullable: false

      field :signing_alg, -> { Auth0::Types::RotateConnectionKeysSigningAlgEnum }, optional: true, nullable: false
    end
  end
end
