# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldNumberConfig < Internal::Types::Model
      field :default_value, -> { Integer }, optional: true, nullable: false
      field :placeholder, -> { String }, optional: true, nullable: false
      field :min_value, -> { Integer }, optional: true, nullable: false
      field :max_value, -> { Integer }, optional: true, nullable: false
    end
  end
end
