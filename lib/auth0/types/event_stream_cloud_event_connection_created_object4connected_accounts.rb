# frozen_string_literal: true

module Auth0
  module Types
    # Configure the purpose of a connection to be used for connected accounts and Token Vault.
    class EventStreamCloudEventConnectionCreatedObject4ConnectedAccounts < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
