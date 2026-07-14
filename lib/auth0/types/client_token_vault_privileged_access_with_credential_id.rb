# frozen_string_literal: true

module Auth0
  module Types
    # Settings for Token Vault Privileged Access.
    class ClientTokenVaultPrivilegedAccessWithCredentialID < Internal::Types::Model
      field :credentials, -> { Internal::Types::Array[Auth0::Types::CredentialID] }, optional: false, nullable: false

      field :ip_allowlist, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :grants, -> { Internal::Types::Array[Auth0::Types::TokenVaultPrivilegedAccessGrant] }, optional: true, nullable: false
    end
  end
end
