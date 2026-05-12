# frozen_string_literal: true

module Auth0
  module Types
    # The group the role is assigned to.
    class EventStreamCloudEventOrgGroupRoleAssignedObjectGroup < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssignedObjectGroup0 }
      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssignedObjectGroup1 }
      member -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleAssignedObjectGroup2 }
    end
  end
end
