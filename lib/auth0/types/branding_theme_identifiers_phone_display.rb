# frozen_string_literal: true

module Auth0
  module Types
    # Phone display
    class BrandingThemeIdentifiersPhoneDisplay < Internal::Types::Model
      field :formatting, -> { Auth0::Types::BrandingThemeIdentifiersPhoneDisplayFormattingEnum }, optional: false, nullable: false

      field :masking, -> { Auth0::Types::BrandingThemeIdentifiersPhoneDisplayMaskingEnum }, optional: false, nullable: false
    end
  end
end
