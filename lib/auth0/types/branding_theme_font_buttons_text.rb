# frozen_string_literal: true

module Auth0
  module Types
    # Buttons text
    class BrandingThemeFontButtonsText < Internal::Types::Model
      field :bold, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :size, -> { Integer }, optional: false, nullable: false
    end
  end
end
