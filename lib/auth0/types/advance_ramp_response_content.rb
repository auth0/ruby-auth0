# frozen_string_literal: true

module Auth0
  module Types
    class AdvanceRampResponseContent < Internal::Types::Model
      field :experiment_id, -> { String }, optional: false, nullable: false

      field :from_level, -> { Integer }, optional: false, nullable: false

      field :to_level, -> { Integer }, optional: false, nullable: false

      field :current_level, -> { Integer }, optional: false, nullable: false
    end
  end
end
