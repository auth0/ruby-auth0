# frozen_string_literal: true

module Auth0
  module Types
    # Identifier input display settings.
    class UpdateBrandingIdentifiers < Internal::Types::Model
      field :login_display, -> { Auth0::Types::UpdateBrandingLoginDisplayEnum }, optional: true, nullable: false

      field :otp_autocomplete, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :phone_display, -> { Auth0::Types::UpdateBrandingPhoneDisplay }, optional: true, nullable: false
    end
  end
end
