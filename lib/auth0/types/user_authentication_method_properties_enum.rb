# frozen_string_literal: true

module Auth0
  module Types
    module UserAuthenticationMethodPropertiesEnum
      extend Auth0::Internal::Types::Enum

      TOTP = "totp"
      PUSH = "push"
      SMS = "sms"
      VOICE = "voice"
    end
  end
end
