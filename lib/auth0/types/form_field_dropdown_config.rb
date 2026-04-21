# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldDropdownConfig < Internal::Types::Model
      field :multiple, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :options, -> { Internal::Types::Array[Auth0::Types::FormFieldDropdownConfigOption] }, optional: true, nullable: false
      field :placeholder, -> { String }, optional: true, nullable: false
    end
  end
end
