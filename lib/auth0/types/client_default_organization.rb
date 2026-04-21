# frozen_string_literal: true

module Auth0
  module Types
    # Defines the default Organization ID and flows
    class ClientDefaultOrganization < Internal::Types::Model
      field :organization_id, -> { String }, optional: false, nullable: false
      field :flows, -> { Internal::Types::Array[Auth0::Types::ClientDefaultOrganizationFlowsEnum] }, optional: false, nullable: false
    end
  end
end
