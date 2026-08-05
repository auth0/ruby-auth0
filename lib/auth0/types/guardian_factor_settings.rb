# frozen_string_literal: true

module Auth0
  module Types
    # Factor-specific settings. Only returned when include_settings=true.
    class GuardianFactorSettings < Internal::Types::Model
      field :otp_length, -> { Integer }, optional: true, nullable: false

      field :otp_expiration_time, -> { Integer }, optional: true, nullable: false
    end
  end
end
