# frozen_string_literal: true

module Auth0
  module Types
    module SessionCookieModeEnum
      extend Auth0::Internal::Types::Enum

      PERSISTENT = "persistent"
      NON_PERSISTENT = "non-persistent"
    end
  end
end
