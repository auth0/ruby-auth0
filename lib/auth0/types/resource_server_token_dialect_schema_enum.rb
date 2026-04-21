# frozen_string_literal: true

module Auth0
  module Types
    module ResourceServerTokenDialectSchemaEnum
      extend Auth0::Internal::Types::Enum

      ACCESS_TOKEN = "access_token"
      ACCESS_TOKEN_AUTHZ = "access_token_authz"
      RFC9068PROFILE = "rfc9068_profile"
      RFC9068PROFILE_AUTHZ = "rfc9068_profile_authz"
    end
  end
end
