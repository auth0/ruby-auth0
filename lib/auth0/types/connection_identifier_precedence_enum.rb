# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionIdentifierPrecedenceEnum
      extend Auth0::Internal::Types::Enum

      EMAIL = "email"
      PHONE_NUMBER = "phone_number"
      USERNAME = "username"
    end
  end
end
