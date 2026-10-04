# frozen_string_literal: true

module Auth0
  module Types
    # The access level granted to the connection for an organization.
    class EventStreamCloudEventOrgConnectionAddedPreviousObjectOrganizationAccessLevel < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedPreviousObjectOrganizationAccessLevel0Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedPreviousObjectOrganizationAccessLevel1Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedPreviousObjectOrganizationAccessLevel2Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedPreviousObjectOrganizationAccessLevel3Enum }
    end
  end
end
