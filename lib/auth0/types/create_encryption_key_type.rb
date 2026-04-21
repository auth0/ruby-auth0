# frozen_string_literal: true

module Auth0
  module Types
    module CreateEncryptionKeyType
      extend Auth0::Internal::Types::Enum

      CUSTOMER_PROVIDED_ROOT_KEY = "customer-provided-root-key"
      TENANT_ENCRYPTION_KEY = "tenant-encryption-key"
    end
  end
end
