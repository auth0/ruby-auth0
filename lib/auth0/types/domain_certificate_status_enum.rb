# frozen_string_literal: true

module Auth0
  module Types
    module DomainCertificateStatusEnum
      extend Auth0::Internal::Types::Enum

      PROVISIONING = "provisioning"
      PROVISIONING_FAILED = "provisioning_failed"
      PROVISIONED = "provisioned"
      RENEWING_FAILED = "renewing_failed"
    end
  end
end
