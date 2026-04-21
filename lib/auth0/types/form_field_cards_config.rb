# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldCardsConfig < Internal::Types::Model
      field :hide_labels, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :multiple, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :options, -> { Internal::Types::Array[Auth0::Types::FormFieldCardsConfigOption] }, optional: true, nullable: false
    end
  end
end
