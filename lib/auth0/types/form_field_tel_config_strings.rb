# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldTelConfigStrings < Internal::Types::Model
      field :filter_placeholder, -> { String }, optional: true, nullable: false
    end
  end
end
