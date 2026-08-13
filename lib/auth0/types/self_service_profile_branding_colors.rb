# frozen_string_literal: true

module Auth0
  module Types
    class SelfServiceProfileBrandingColors < Internal::Types::Model
      field :primary, -> { String }, optional: false, nullable: false
    end
  end
end
