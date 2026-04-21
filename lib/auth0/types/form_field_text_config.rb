# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldTextConfig < Internal::Types::Model
      field :multiline, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :default_value, -> { String }, optional: true, nullable: false
      field :placeholder, -> { String }, optional: true, nullable: false
      field :min_length, -> { Integer }, optional: true, nullable: false
      field :max_length, -> { Integer }, optional: true, nullable: false
    end
  end
end
