# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionTokenEndpointAuthMethodEnum
      extend Auth0::Internal::Types::Enum

      CLIENT_SECRET_POST = "client_secret_post"
      PRIVATE_KEY_JWT = "private_key_jwt"
    end
  end
end
