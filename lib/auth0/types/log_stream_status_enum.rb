# frozen_string_literal: true

module Auth0
  module Types
    module LogStreamStatusEnum
      extend Auth0::Internal::Types::Enum

      ACTIVE = "active"
      PAUSED = "paused"
      SUSPENDED = "suspended"
    end
  end
end
