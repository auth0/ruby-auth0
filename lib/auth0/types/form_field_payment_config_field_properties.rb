# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldPaymentConfigFieldProperties < Internal::Types::Model
      field :label, -> { String }, optional: true, nullable: false
      field :placeholder, -> { String }, optional: true, nullable: false
    end
  end
end
