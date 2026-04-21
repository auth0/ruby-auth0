# frozen_string_literal: true

module Auth0
  module Types
    class BrandingThemeWidget < Internal::Types::Model
      field :header_text_alignment, -> { Auth0::Types::BrandingThemeWidgetHeaderTextAlignmentEnum }, optional: false, nullable: false
      field :logo_height, -> { Integer }, optional: false, nullable: false
      field :logo_position, -> { Auth0::Types::BrandingThemeWidgetLogoPositionEnum }, optional: false, nullable: false
      field :logo_url, -> { String }, optional: false, nullable: false
      field :social_buttons_layout, -> { Auth0::Types::BrandingThemeWidgetSocialButtonsLayoutEnum }, optional: false, nullable: false
    end
  end
end
