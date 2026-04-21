# frozen_string_literal: true

module Auth0
  module Types
    module DomainVerificationStatusEnum
      extend Auth0::Internal::Types::Enum

      VERIFIED = "verified"
      PENDING = "pending"
      FAILED = "failed"
    end
  end
end
