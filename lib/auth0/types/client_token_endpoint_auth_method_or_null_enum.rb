# frozen_string_literal: true

module Auth0
  module Types
    module ClientTokenEndpointAuthMethodOrNullEnum
      extend Auth0::Internal::Types::Enum

      NONE = "none"
      CLIENT_SECRET_POST = "client_secret_post"
      CLIENT_SECRET_BASIC = "client_secret_basic"
    end
  end
end
