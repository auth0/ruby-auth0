# frozen_string_literal: true

module Auth0
  module Types
    # Phone number display settings.
    class BrandingPhoneDisplay < Internal::Types::Model
      field :masking, -> { Auth0::Types::BrandingPhoneMaskingEnum }, optional: true, nullable: false

      field :formatting, -> { Auth0::Types::BrandingPhoneFormattingEnum }, optional: true, nullable: false
    end
  end
end
