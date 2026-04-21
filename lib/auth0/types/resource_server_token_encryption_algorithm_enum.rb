# frozen_string_literal: true

module Auth0
  module Types
    module ResourceServerTokenEncryptionAlgorithmEnum
      extend Auth0::Internal::Types::Enum

      RSA_OAEP256 = "RSA-OAEP-256"
      RSA_OAEP384 = "RSA-OAEP-384"
      RSA_OAEP512 = "RSA-OAEP-512"
    end
  end
end
