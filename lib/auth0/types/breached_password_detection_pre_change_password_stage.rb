# frozen_string_literal: true

module Auth0
  module Types
    class BreachedPasswordDetectionPreChangePasswordStage < Internal::Types::Model
      field :shields, -> { Internal::Types::Array[Auth0::Types::BreachedPasswordDetectionPreChangePasswordShieldsEnum] }, optional: true, nullable: false
    end
  end
end
