# frozen_string_literal: true

module Auth0
  module Types
    class FormEndingNodeRedirection < Internal::Types::Model
      field :delay, -> { Integer }, optional: true, nullable: false
      field :target, -> { String }, optional: false, nullable: false
    end
  end
end
