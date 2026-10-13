# frozen_string_literal: true

module Auth0
  module Types
    # The organization member access level granted to the connection for an organization.
    class EventStreamCloudEventOrgConnectionAddedObjectOrganizationMemberAccessLevel < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedObjectOrganizationMemberAccessLevel0Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedObjectOrganizationMemberAccessLevel1Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedObjectOrganizationMemberAccessLevel2Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedObjectOrganizationMemberAccessLevel3Enum }
    end
  end
end
