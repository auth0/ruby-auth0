# frozen_string_literal: true

module Auth0
  module Types
    class GuardianFactor < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :trial_expired, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :name, -> { Auth0::Types::GuardianFactorNameEnum }, optional: true, nullable: false
    end
  end
end
