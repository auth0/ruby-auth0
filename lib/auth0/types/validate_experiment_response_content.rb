# frozen_string_literal: true

module Auth0
  module Types
    class ValidateExperimentResponseContent < Internal::Types::Model
      field :is_valid, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :errors, -> { Internal::Types::Array[Auth0::Types::ExperimentValidationError] }, optional: false, nullable: false
    end
  end
end
