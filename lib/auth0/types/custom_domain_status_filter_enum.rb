# frozen_string_literal: true

module Auth0
  module Types
    module CustomDomainStatusFilterEnum
      extend Auth0::Internal::Types::Enum

      PENDING_VERIFICATION = "pending_verification"
      READY = "ready"
      FAILED = "failed"
    end
  end
end
