# frozen_string_literal: true

module Auth0
  module Types
    module DeviceCredentialTypeEnum
      extend Auth0::Internal::Types::Enum

      PUBLIC_KEY = "public_key"
      REFRESH_TOKEN = "refresh_token"
      ROTATING_REFRESH_TOKEN = "rotating_refresh_token"
    end
  end
end
