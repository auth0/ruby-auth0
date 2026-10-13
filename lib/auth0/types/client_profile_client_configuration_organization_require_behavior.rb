# frozen_string_literal: true

module Auth0
  module Types
    # Default organization prompt behavior applied to matched clients.
    class ClientProfileClientConfigurationOrganizationRequireBehavior < Internal::Types::Model
      field :default_value, -> { Auth0::Types::ClientProfileClientConfigurationOrganizationRequireBehaviorEnum }, optional: true, nullable: false
    end
  end
end
