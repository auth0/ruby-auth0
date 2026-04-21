# frozen_string_literal: true

module Auth0
  module Types
    # Configure the purpose of a connection to be used for connected accounts and Token Vault.
    class ConnectionConnectedAccountsPurposeXaa < Internal::Types::Model
      field :cross_app_access, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
