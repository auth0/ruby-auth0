# frozen_string_literal: true

module Auth0
  module Types
    # Provisioning settings for connections created from this profile.
    class ConnectionProfileProvisioning < Internal::Types::Model
      field :scim, -> { Auth0::Types::ConnectionProfileProvisioningSCIM }, optional: true, nullable: false
    end
  end
end
