# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionSetUserRootAttributesEnum
      extend Auth0::Internal::Types::Enum

      ON_EACH_LOGIN = "on_each_login"
      ON_FIRST_LOGIN = "on_first_login"
      NEVER_ON_LOGIN = "never_on_login"
    end
  end
end
