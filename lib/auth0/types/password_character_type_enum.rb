# frozen_string_literal: true

module Auth0
  module Types
    module PasswordCharacterTypeEnum
      extend Auth0::Internal::Types::Enum

      UPPERCASE = "uppercase"
      LOWERCASE = "lowercase"
      NUMBER = "number"
      SPECIAL = "special"
    end
  end
end
