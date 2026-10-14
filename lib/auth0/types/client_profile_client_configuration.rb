# frozen_string_literal: true

module Auth0
  module Types
    # Runtime policy applied to matched clients. Omitted fields fall back to each client's own setting.
    class ClientProfileClientConfiguration < Internal::Types::Model
      field :refresh_token, -> { Auth0::Types::ClientProfileClientConfigurationRefreshToken }, optional: true, nullable: false

      field :organization_usage, -> { Auth0::Types::ClientProfileClientConfigurationOrganizationUsage }, optional: true, nullable: false

      field :organization_require_behavior, -> { Auth0::Types::ClientProfileClientConfigurationOrganizationRequireBehavior }, optional: true, nullable: false

      field :organization_discovery_methods, -> { Auth0::Types::ClientProfileClientConfigurationOrganizationDiscoveryMethods }, optional: true, nullable: false

      field :require_proof_of_possession, -> { Auth0::Types::ClientProfileClientConfigurationRequireProofOfPossession }, optional: true, nullable: false
    end
  end
end
