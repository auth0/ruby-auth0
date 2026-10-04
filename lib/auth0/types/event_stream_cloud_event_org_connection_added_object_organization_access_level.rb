# frozen_string_literal: true

module Auth0
  module Types
    # The access level granted to the connection for an organization.
    class EventStreamCloudEventOrgConnectionAddedObjectOrganizationAccessLevel < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedObjectOrganizationAccessLevel0Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedObjectOrganizationAccessLevel1Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedObjectOrganizationAccessLevel2Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedObjectOrganizationAccessLevel3Enum }
    end
  end
end
