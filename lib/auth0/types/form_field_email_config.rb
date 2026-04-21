# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldEmailConfig < Internal::Types::Model
      field :default_value, -> { String }, optional: true, nullable: false
      field :placeholder, -> { String }, optional: true, nullable: false
    end
  end
end
