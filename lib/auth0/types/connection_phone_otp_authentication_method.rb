# frozen_string_literal: true

module Auth0
  module Types
    # Phone OTP authentication enablement
    class ConnectionPhoneOtpAuthenticationMethod < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
