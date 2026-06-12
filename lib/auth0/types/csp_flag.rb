# frozen_string_literal: true

module Auth0
  module Types
    module CspFlag
      extend Auth0::Internal::Types::Enum

      UPGRADE_INSECURE_REQUESTS = "upgrade-insecure-requests"
      BLOCK_ALL_MIXED_CONTENT = "block-all-mixed-content"
    end
  end
end
