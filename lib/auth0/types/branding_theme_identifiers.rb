# frozen_string_literal: true

module Auth0
  module Types
    class BrandingThemeIdentifiers < Internal::Types::Model
      field :login_display, -> { Auth0::Types::BrandingThemeIdentifiersLoginDisplayEnum }, optional: false, nullable: false

      field :otp_autocomplete, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :phone_display, -> { Auth0::Types::BrandingThemeIdentifiersPhoneDisplay }, optional: false, nullable: false
    end
  end
end
