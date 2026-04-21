# frozen_string_literal: true

module Auth0
  module Branding
    module Types
      class UpdateBrandingRequestContent < Internal::Types::Model
        field :colors, -> { Auth0::Types::UpdateBrandingColors }, optional: true, nullable: false
        field :favicon_url, -> { String }, optional: true, nullable: false
        field :logo_url, -> { String }, optional: true, nullable: false
        field :font, -> { Auth0::Types::UpdateBrandingFont }, optional: true, nullable: false
      end
    end
  end
end
