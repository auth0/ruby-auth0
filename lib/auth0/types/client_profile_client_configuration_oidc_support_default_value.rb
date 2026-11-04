# frozen_string_literal: true

module Auth0
  module Types
    # OIDC support settings applied to matched clients.
    class ClientProfileClientConfigurationOidcSupportDefaultValue < Internal::Types::Model
      field :is_allowed, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :allow_all_scopes, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :allowed_scopes, -> { Internal::Types::Array[Auth0::Types::ClientProfileClientConfigurationOidcSupportAllowedScopesEnum] }, optional: true, nullable: false
    end
  end
end
