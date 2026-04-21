# frozen_string_literal: true

module Auth0
  module Types
    module CustomSigningKeyAlgorithmEnum
      extend Auth0::Internal::Types::Enum

      RS256 = "RS256"
      RS384 = "RS384"
      RS512 = "RS512"
      ES256 = "ES256"
      ES384 = "ES384"
      ES512 = "ES512"
      PS256 = "PS256"
      PS384 = "PS384"
      PS512 = "PS512"
    end
  end
end
