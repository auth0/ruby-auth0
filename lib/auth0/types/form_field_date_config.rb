# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldDateConfig < Internal::Types::Model
      field :format, -> { Auth0::Types::FormFieldDateConfigFormatEnum }, optional: true, nullable: false
      field :default_value, -> { String }, optional: true, nullable: false
    end
  end
end
