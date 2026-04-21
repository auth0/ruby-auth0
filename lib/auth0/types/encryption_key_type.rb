# frozen_string_literal: true

module Auth0
  module Types
    module EncryptionKeyType
      extend Auth0::Internal::Types::Enum

      CUSTOMER_PROVIDED_ROOT_KEY = "customer-provided-root-key"
      ENVIRONMENT_ROOT_KEY = "environment-root-key"
      TENANT_MASTER_KEY = "tenant-master-key"
      TENANT_ENCRYPTION_KEY = "tenant-encryption-key"
    end
  end
end
