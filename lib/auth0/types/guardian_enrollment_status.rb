# frozen_string_literal: true

module Auth0
  module Types
    module GuardianEnrollmentStatus
      extend Auth0::Internal::Types::Enum

      PENDING = "pending"
      CONFIRMED = "confirmed"
    end
  end
end
