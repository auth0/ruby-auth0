# frozen_string_literal: true

module Auth0
  module Types
    class BrandingThemePageBackground < Internal::Types::Model
      field :background_color, -> { String }, optional: false, nullable: false
      field :background_image_url, -> { String }, optional: false, nullable: false
      field :page_layout, -> { Auth0::Types::BrandingThemePageBackgroundPageLayoutEnum }, optional: false, nullable: false
    end
  end
end
