# frozen_string_literal: true

module Auth0
  module Types
    # The access level granted to the connection for an organization.
    class EventStreamCloudEventOrgConnectionUpdatedObjectOrganizationAccessLevel < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedObjectOrganizationAccessLevel0Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedObjectOrganizationAccessLevel1Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedObjectOrganizationAccessLevel2Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedObjectOrganizationAccessLevel3Enum }
    end
  end
end
