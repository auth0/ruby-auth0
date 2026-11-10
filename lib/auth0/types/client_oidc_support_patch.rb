# frozen_string_literal: true

module Auth0
  module Types
    # Controls whether the client can receive ID tokens and use the UserInfo endpoint, and which user profile
    # information it can request through OIDC scopes.
    class ClientOidcSupportPatch < Internal::Types::Model
      field :is_allowed, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :allow_all_scopes, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :allowed_scopes, -> { Internal::Types::Array[Auth0::Types::ClientOidcSupportAllowedScopesEnum] }, optional: true, nullable: false
    end
  end
end
