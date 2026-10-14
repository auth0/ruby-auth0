# frozen_string_literal: true

module Auth0
  module Types
    # Default organization discovery methods applied to matched clients.
    class ClientProfileClientConfigurationOrganizationDiscoveryMethods < Internal::Types::Model
      field :default_value, -> { Internal::Types::Array[Auth0::Types::ClientProfileClientConfigurationOrganizationDiscoveryMethodEnum] }, optional: true, nullable: false
    end
  end
end
