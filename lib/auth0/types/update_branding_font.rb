# frozen_string_literal: true

module Auth0
  module Types
    # Custom font settings.
    class UpdateBrandingFont < Internal::Types::Model
      field :url, -> { String }, optional: true, nullable: false
    end
  end
end
