# frozen_string_literal: true

module Auth0
  module Types
    module EncryptionKeyState
      extend Auth0::Internal::Types::Enum

      PRE_ACTIVATION = "pre-activation"
      ACTIVE = "active"
      DEACTIVATED = "deactivated"
      DESTROYED = "destroyed"
    end
  end
end
