# frozen_string_literal: true

module Auth0
  module Types
    class FormNodeCoordinates < Internal::Types::Model
      field :x, -> { Integer }, optional: false, nullable: false
      field :y, -> { Integer }, optional: false, nullable: false
    end
  end
end
