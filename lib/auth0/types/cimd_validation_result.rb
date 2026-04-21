# frozen_string_literal: true

module Auth0
  module Types
    # Validation result for the Client ID Metadata Document
    class CimdValidationResult < Internal::Types::Model
      field :valid, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :violations, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :warnings, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
