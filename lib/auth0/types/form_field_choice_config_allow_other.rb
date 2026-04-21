# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldChoiceConfigAllowOther < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :label, -> { String }, optional: true, nullable: false
      field :placeholder, -> { String }, optional: true, nullable: false
    end
  end
end
