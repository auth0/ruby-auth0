# frozen_string_literal: true

module Auth0
  module Types
    class SelfServiceProfileBrandingProperties < Internal::Types::Model
      field :logo_url, -> { String }, optional: true, nullable: false
      field :colors, -> { Auth0::Types::SelfServiceProfileBrandingColors }, optional: true, nullable: false
    end
  end
end
