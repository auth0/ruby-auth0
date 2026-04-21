# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldTelConfig < Internal::Types::Model
      field :default_value, -> { String }, optional: true, nullable: false
      field :placeholder, -> { String }, optional: true, nullable: false
      field :min_length, -> { Integer }, optional: true, nullable: false
      field :max_length, -> { Integer }, optional: true, nullable: false
      field :country_picker, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :strings, -> { Auth0::Types::FormFieldTelConfigStrings }, optional: true, nullable: false
    end
  end
end
