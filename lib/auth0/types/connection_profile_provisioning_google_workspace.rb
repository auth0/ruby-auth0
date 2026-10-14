# frozen_string_literal: true

module Auth0
  module Types
    # Google Workspace provisioning settings.
    class ConnectionProfileProvisioningGoogleWorkspace < Internal::Types::Model
      field :sync_users, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
