# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldChoiceConfig < Internal::Types::Model
      field :multiple, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :options, -> { Internal::Types::Array[Auth0::Types::FormFieldChoiceConfigOption] }, optional: true, nullable: false
      field :allow_other, -> { Auth0::Types::FormFieldChoiceConfigAllowOther }, optional: true, nullable: false
    end
  end
end
