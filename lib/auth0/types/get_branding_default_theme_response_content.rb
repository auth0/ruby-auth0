# frozen_string_literal: true

module Auth0
  module Types
    class GetBrandingDefaultThemeResponseContent < Internal::Types::Model
      field :borders, -> { Auth0::Types::BrandingThemeBorders }, optional: false, nullable: false
      field :colors, -> { Auth0::Types::BrandingThemeColors }, optional: false, nullable: false
      field :display_name, -> { String }, optional: false, nullable: false, api_name: "displayName"
      field :fonts, -> { Auth0::Types::BrandingThemeFonts }, optional: false, nullable: false
      field :page_background, -> { Auth0::Types::BrandingThemePageBackground }, optional: false, nullable: false
      field :theme_id, -> { String }, optional: false, nullable: false, api_name: "themeId"
      field :widget, -> { Auth0::Types::BrandingThemeWidget }, optional: false, nullable: false
    end
  end
end
