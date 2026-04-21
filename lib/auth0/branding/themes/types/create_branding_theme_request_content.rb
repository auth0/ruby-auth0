# frozen_string_literal: true

module Auth0
  module Branding
    module Themes
      module Types
        class CreateBrandingThemeRequestContent < Internal::Types::Model
          field :borders, -> { Auth0::Types::BrandingThemeBorders }, optional: false, nullable: false
          field :colors, -> { Auth0::Types::BrandingThemeColors }, optional: false, nullable: false
          field :display_name, -> { String }, optional: true, nullable: false, api_name: "displayName"
          field :fonts, -> { Auth0::Types::BrandingThemeFonts }, optional: false, nullable: false
          field :page_background, -> { Auth0::Types::BrandingThemePageBackground }, optional: false, nullable: false
          field :widget, -> { Auth0::Types::BrandingThemeWidget }, optional: false, nullable: false
        end
      end
    end
  end
end
