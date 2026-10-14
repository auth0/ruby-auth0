# frozen_string_literal: true

module Auth0
  module Types
    # The organization member access level granted to the connection for an organization.
    class EventStreamCloudEventOrgConnectionUpdatedPreviousObjectOrganizationMemberAccessLevel < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedPreviousObjectOrganizationMemberAccessLevel0Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedPreviousObjectOrganizationMemberAccessLevel1Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedPreviousObjectOrganizationMemberAccessLevel2Enum }

      member -> { Auth0::Types::EventStreamCloudEventOrgConnectionUpdatedPreviousObjectOrganizationMemberAccessLevel3Enum }
    end
  end
end
