# frozen_string_literal: true

module Auth0
  module Types
    class RotateConnectionKeysRequestContent < Internal::Types::Model
      field :signing_alg, -> { Auth0::Types::RotateConnectionKeysSigningAlgEnum }, optional: true, nullable: false
    end
  end
end
