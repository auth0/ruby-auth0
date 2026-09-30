# frozen_string_literal: true

module Auth0
  module Types
    module FeatureFlagStatusEnum
      extend Auth0::Internal::Types::Enum

      DRAFT = "draft"
      ACTIVE = "active"
      ARCHIVED = "archived"
    end
  end
end
