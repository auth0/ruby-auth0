# frozen_string_literal: true

module Auth0
  module Types
    # Email OTP authentication enablement
    class ConnectionEmailOtpAuthenticationMethod < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
