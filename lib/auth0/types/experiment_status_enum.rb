# frozen_string_literal: true

module Auth0
  module Types
    module ExperimentStatusEnum
      extend Auth0::Internal::Types::Enum

      DRAFT = "draft"
      ACTIVE = "active"
      PAUSED = "paused"
      COMPLETED = "completed"
      ARCHIVED = "archived"
    end
  end
end
