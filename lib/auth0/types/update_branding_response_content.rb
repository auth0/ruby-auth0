# frozen_string_literal: true

module Auth0
  module Types
    class UpdateBrandingResponseContent < Internal::Types::Model
      field :colors, -> { Auth0::Types::BrandingColors }, optional: true, nullable: false
      field :favicon_url, -> { String }, optional: true, nullable: false
      field :logo_url, -> { String }, optional: true, nullable: false
      field :font, -> { Auth0::Types::BrandingFont }, optional: true, nullable: false
    end
  end
end
