# frozen_string_literal: true

module Auth0
  module Types
    module RefreshTokenExpirationTypeEnum
      extend Auth0::Internal::Types::Enum

      EXPIRING = "expiring"
      NON_EXPIRING = "non-expiring"
    end
  end
end
