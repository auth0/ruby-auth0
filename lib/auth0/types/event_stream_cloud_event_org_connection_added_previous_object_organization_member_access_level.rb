# frozen_string_literal: true

module Auth0
  module Types
    # The organization member access level granted to the connection for an organization.
    class EventStreamCloudEventOrgConnectionAddedPreviousObjectOrganizationMemberAccessLevel < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedPreviousObjectOrganizationMemberAccessLevel0Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedPreviousObjectOrganizationMemberAccessLevel1Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedPreviousObjectOrganizationMemberAccessLevel2Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionAddedPreviousObjectOrganizationMemberAccessLevel3Enum }
    end
  end
end
