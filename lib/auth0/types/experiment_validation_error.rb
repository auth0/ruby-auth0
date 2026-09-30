# frozen_string_literal: true

module Auth0
  module Types
    class ExperimentValidationError < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: false

      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
