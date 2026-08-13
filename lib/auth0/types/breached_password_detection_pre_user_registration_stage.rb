# frozen_string_literal: true

module Auth0
  module Types
    class BreachedPasswordDetectionPreUserRegistrationStage < Internal::Types::Model
      field :shields, -> { Internal::Types::Array[Auth0::Types::BreachedPasswordDetectionPreUserRegistrationShieldsEnum] }, optional: true, nullable: false
    end
  end
end
