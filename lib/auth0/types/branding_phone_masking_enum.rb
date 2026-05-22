# frozen_string_literal: true

module Auth0
  module Types
    module BrandingPhoneMaskingEnum
      extend Auth0::Internal::Types::Enum

      SHOW_ALL = "show_all"
      HIDE_COUNTRY_CODE = "hide_country_code"
      MASK_DIGITS = "mask_digits"
    end
  end
end
