# frozen_string_literal: true

module Auth0
  module Types
    class FormStyle < Internal::Types::Model
      field :css, -> { String }, optional: true, nullable: false
    end
  end
end
