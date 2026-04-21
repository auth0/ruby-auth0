# frozen_string_literal: true

module Auth0
  module Types
    # OAuth 2.0 scopes requested from the identity provider during authorization. Determines what user information and
    # permissions Auth0 can access. Can be specified as a space-delimited string (e.g., 'openid profile email') or array
    # of scope values. The 'useOauthSpecScope' setting controls delimiter behavior when using connection_scope
    # parameter.
    class ConnectionScopeOAuth2 < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }
      member -> { Internal::Types::Array[String] }
    end
  end
end
