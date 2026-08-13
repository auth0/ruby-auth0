# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldLegalConfig < Internal::Types::Model
      field :text, -> { String }, optional: true, nullable: false
    end
  end
end
