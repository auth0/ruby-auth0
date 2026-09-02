# frozen_string_literal: true

module Auth0
  module Types
    # The access level granted to the connection for an organization.
    class EventStreamCloudEventOrgConnectionUpdatedPreviousObjectOrganizationAccessLevel < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedPreviousObjectOrganizationAccessLevel0Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedPreviousObjectOrganizationAccessLevel1Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedPreviousObjectOrganizationAccessLevel2Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedPreviousObjectOrganizationAccessLevel3Enum }
    end
  end
end
