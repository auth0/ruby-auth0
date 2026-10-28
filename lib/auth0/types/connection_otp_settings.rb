# frozen_string_literal: true

module Auth0
  module Types
    # One-time password settings, configurable per delivery channel.
    class ConnectionOtpSettings < Internal::Types::Model
      field :email, -> { Auth0::Types::ConnectionOtpChannelSettings }, optional: true, nullable: false

      field :phone, -> { Auth0::Types::ConnectionOtpChannelSettings }, optional: true, nullable: false
    end
  end
end
