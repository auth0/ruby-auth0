# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module Types
        class SetGuardianFactorRequestContent < Internal::Types::Model
          field :name, -> { Auth0::Types::GuardianFactorNameEnum }, optional: false, nullable: false
          field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
        end
      end
    end
  end
end
