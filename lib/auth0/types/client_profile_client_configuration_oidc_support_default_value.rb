# frozen_string_literal: true

module Auth0
  module Types
    # Controls whether matched clients can receive ID tokens and use the UserInfo endpoint, and which user profile
    # information they can request through OIDC scopes.
    class ClientProfileClientConfigurationOidcSupportDefaultValue < Internal::Types::Model
      field :is_allowed, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :allow_all_scopes, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :allowed_scopes, -> { Internal::Types::Array[Auth0::Types::ClientProfileClientConfigurationOidcSupportAllowedScopesEnum] }, optional: true, nullable: false
    end
  end
end
