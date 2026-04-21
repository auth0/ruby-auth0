# frozen_string_literal: true

module Auth0
  module Types
    # Custom color settings.
    class BrandingColors < Internal::Types::Model
      field :primary, -> { String }, optional: true, nullable: false
      field :page_background, -> { Auth0::Types::BrandingPageBackground }, optional: true, nullable: false
    end
  end
end
