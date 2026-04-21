# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldDropdownConfigOption < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false
      field :label, -> { String }, optional: false, nullable: false
    end
  end
end
