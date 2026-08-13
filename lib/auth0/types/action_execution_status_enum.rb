# frozen_string_literal: true

module Auth0
  module Types
    module ActionExecutionStatusEnum
      extend Auth0::Internal::Types::Enum

      UNSPECIFIED = "unspecified"
      PENDING = "pending"
      FINAL = "final"
      PARTIAL = "partial"
      CANCELED = "canceled"
      SUSPENDED = "suspended"
    end
  end
end
