# frozen_string_literal: true

module Auth0
  module Types
    # Configure the purpose of a connection to be used for connected accounts and Token Vault.
    class ConnectionConnectedAccountsPurpose < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :cross_app_access, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
