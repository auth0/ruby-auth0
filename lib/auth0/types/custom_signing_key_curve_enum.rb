# frozen_string_literal: true

module Auth0
  module Types
    module CustomSigningKeyCurveEnum
      extend Auth0::Internal::Types::Enum

      P256 = "P-256"
      P384 = "P-384"
      P521 = "P-521"
    end
  end
end
