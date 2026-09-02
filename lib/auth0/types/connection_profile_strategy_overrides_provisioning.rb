# frozen_string_literal: true

module Auth0
  module Types
    # Provisioning settings for a connection profile strategy override.
    class ConnectionProfileStrategyOverridesProvisioning < Internal::Types::Model
      field :scim, -> { Auth0::Types::ConnectionProfileProvisioningSCIM }, optional: true, nullable: false
    end
  end
end
