# frozen_string_literal: true

module Auth0
  module Types
    # The organization member access level granted to the connection for an organization.
    class EventStreamCloudEventOrgConnectionUpdatedObjectOrganizationMemberAccessLevel < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedObjectOrganizationMemberAccessLevel0Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedObjectOrganizationMemberAccessLevel1Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedObjectOrganizationMemberAccessLevel2Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedObjectOrganizationMemberAccessLevel3Enum }
    end
  end
end
