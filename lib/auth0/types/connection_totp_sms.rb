# frozen_string_literal: true

module Auth0
  module Types
    # Time-based One-Time Password (TOTP) options
    class ConnectionTotpSms < Internal::Types::Model
      field :length, -> { Integer }, optional: true, nullable: false
      field :time_step, -> { Integer }, optional: true, nullable: false
    end
  end
end
