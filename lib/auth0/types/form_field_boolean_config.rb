# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldBooleanConfig < Internal::Types::Model
      field :default_value, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :options, -> { Auth0::Types::FormFieldBooleanConfigOptions }, optional: true, nullable: false
    end
  end
end
