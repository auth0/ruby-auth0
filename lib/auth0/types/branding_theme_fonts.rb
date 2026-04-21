# frozen_string_literal: true

module Auth0
  module Types
    class BrandingThemeFonts < Internal::Types::Model
      field :body_text, -> { Auth0::Types::BrandingThemeFontBodyText }, optional: false, nullable: false
      field :buttons_text, -> { Auth0::Types::BrandingThemeFontButtonsText }, optional: false, nullable: false
      field :font_url, -> { String }, optional: false, nullable: false
      field :input_labels, -> { Auth0::Types::BrandingThemeFontInputLabels }, optional: false, nullable: false
      field :links, -> { Auth0::Types::BrandingThemeFontLinks }, optional: false, nullable: false
      field :links_style, -> { Auth0::Types::BrandingThemeFontLinksStyleEnum }, optional: false, nullable: false
      field :reference_text_size, -> { Integer }, optional: false, nullable: false
      field :subtitle, -> { Auth0::Types::BrandingThemeFontSubtitle }, optional: false, nullable: false
      field :title, -> { Auth0::Types::BrandingThemeFontTitle }, optional: false, nullable: false
    end
  end
end
