# frozen_string_literal: true

module Auth0
  module Types
    # Configuration options that apply before every user registration attempt.
    class SuspiciousIPThrottlingPreUserRegistrationStage < Internal::Types::Model
      field :max_attempts, -> { Integer }, optional: true, nullable: false
      field :rate, -> { Integer }, optional: true, nullable: false
    end
  end
end
