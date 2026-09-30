# frozen_string_literal: true

module Auth0
  module Types
    module ClientOidcSupportAllowedScopesEnum
      extend Auth0::Internal::Types::Enum

      PROFILE = "profile"
      EMAIL = "email"
      ADDRESS = "address"
      PHONE = "phone"
    end
  end
end
