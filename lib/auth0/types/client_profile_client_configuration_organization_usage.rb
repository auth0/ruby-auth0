# frozen_string_literal: true

module Auth0
  module Types
    # Default organization usage applied to matched clients.
    class ClientProfileClientConfigurationOrganizationUsage < Internal::Types::Model
      field :default_value, -> { Auth0::Types::ClientProfileClientConfigurationOrganizationUsageEnum }, optional: true, nullable: false
    end
  end
end
