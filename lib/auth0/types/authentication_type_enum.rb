# frozen_string_literal: true

module Auth0
  module Types
    module AuthenticationTypeEnum
      extend Auth0::Internal::Types::Enum

      PHONE = "phone"
      EMAIL = "email"
      TOTP = "totp"
    end
  end
end
