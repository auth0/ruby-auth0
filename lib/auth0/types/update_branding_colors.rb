# frozen_string_literal: true

module Auth0
  module Types
    # Custom color settings.
    class UpdateBrandingColors < Internal::Types::Model
      field :primary, -> { String }, optional: true, nullable: false
      field :page_background, -> { Auth0::Types::UpdateBrandingPageBackground }, optional: true, nullable: false
    end
  end
end
