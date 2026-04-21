# frozen_string_literal: true

module Auth0
  module Types
    module ResourceServerSubjectTypeAuthorizationClientPolicyEnum
      extend Auth0::Internal::Types::Enum

      DENY_ALL = "deny_all"
      REQUIRE_CLIENT_GRANT = "require_client_grant"
    end
  end
end
