# frozen_string_literal: true

module Auth0
  module Types
    module ExperimentTransitionStatusEnum
      extend Auth0::Internal::Types::Enum

      ACTIVE = "active"
      PAUSED = "paused"
      COMPLETED = "completed"
      ARCHIVED = "archived"
    end
  end
end
