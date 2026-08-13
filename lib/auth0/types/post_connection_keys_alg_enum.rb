# frozen_string_literal: true

module Auth0
  module Types
    module PostConnectionKeysAlgEnum
      extend Auth0::Internal::Types::Enum

      RS256 = "RS256"
      RS384 = "RS384"
      RS512 = "RS512"
      PS256 = "PS256"
      PS384 = "PS384"
      ES256 = "ES256"
      ES384 = "ES384"
    end
  end
end
