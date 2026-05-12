# frozen_string_literal: true

module Auth0
  module Types
    # Phone number display settings.
    class UpdateBrandingPhoneDisplay < Internal::Types::Model
      field :masking, -> { Auth0::Types::UpdateBrandingPhoneMaskingEnum }, optional: false, nullable: false
      field :formatting, -> { Auth0::Types::UpdateBrandingPhoneFormattingEnum }, optional: false, nullable: false
    end
  end
end
