# frozen_string_literal: true

module Auth0
  module Types
    module ActionBuildStatusEnum
      extend Auth0::Internal::Types::Enum

      PENDING = "pending"
      BUILDING = "building"
      PACKAGED = "packaged"
      BUILT = "built"
      RETRYING = "retrying"
      FAILED = "failed"
    end
  end
end
