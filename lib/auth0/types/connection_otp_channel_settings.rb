# frozen_string_literal: true

module Auth0
  module Types
    # OTP settings for a delivery channel.
    class ConnectionOtpChannelSettings < Internal::Types::Model
      field :otp_length, -> { Integer }, optional: true, nullable: false

      field :otp_expiry, -> { Integer }, optional: true, nullable: false
    end
  end
end
