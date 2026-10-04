# frozen_string_literal: true

module Auth0
  module Types
    # The group the role is assigned to.
    class EventStreamCloudEventOrgGroupRoleAssignedPreviousObjectGroup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssignedPreviousObjectGroup0 }

      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssignedPreviousObjectGroup1 }

      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssignedPreviousObjectGroup2 }
    end
  end
end
