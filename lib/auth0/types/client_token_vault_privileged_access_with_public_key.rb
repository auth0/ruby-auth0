# frozen_string_literal: true

module Auth0
  module Types
    # Settings for Token Vault Privileged Access.
    class ClientTokenVaultPrivilegedAccessWithPublicKey < Internal::Types::Model
      field :credentials, -> { Internal::Types::Array[Auth0::Types::PublicKeyCredential] }, optional: false, nullable: false

      field :ip_allowlist, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
